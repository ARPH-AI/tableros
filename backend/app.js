const express = require('express')
const { createProxyMiddleware, responseInterceptor } = require('http-proxy-middleware');
const cors = require('cors')
const jwt = require('jsonwebtoken')
const { expressjwt } = require('express-jwt')
const moment = require('moment')
const morgan = require('morgan')
const axios = require('axios').default
const { pathToRegexp } = require("path-to-regexp")
require('dotenv').config({ path: './.env' })

// CONSTANTES
const APP_VERSION = process.env.npm_package_version
const APP_NAME = process.env.npm_package_name
const APP_DESC = 'Tablero Backend v1.0'
const HSI_API_URL = process.env.HSI_API_URL
const CUBEJS_API_SECRET = process.env.CUBEJS_API_SECRET
const ACCESS_TOKEN_EXPIRE = process.env.ACCESS_TOKEN_EXPIRE
const REFRESH_TOKEN_EXPIRE = process.env.REFRESH_TOKEN_EXPIRE
const JWT_SECRET_KEY = process.env.JWT_SECRET_KEY
const DEV_TOKEN = process.env.DEV_TOKEN
const WHITE_LIST = process.env.WHITE_LIST.split(',')
const ERole = {
  PARTNER: 'PARTNER',
  HR: 'HR',
  MANAGER: 'MANAGER',
  SCRUM_MASTER: 'SCRUM_MASTER',
  FUNCTIONAL: 'FUNCTIONAL',
  DEVELOPER: 'DEVELOPER',
  ADMINISTRATIVO: 'ADMIN',
  PERFIL_EPIDEMIO_MESO: 'PERFIL_EPIDEMIO_MESO',
  PERFIL_EPIDEMIO_INSTITUCION: 'PERFIL_EPIDEMIO_INSTITUCION'
}
const VALID_USER = {
  userId: 2,
  sub: 'User',
  username: 'user@email.com',
  password: 'user',
  department: 'Quilmes',
  firstName: 'userFirstname',
  lastName: 'userLastname',
  email: 'user@email.com',
  role: ERole['PERFIL_EPIDEMIO_INSTITUCION']
}
const VALID_USER_ADMIN = {
  userId: 1,
  sub: 'Administradxr',
  username: 'admin@email.com',
  password: 'admin',
  department: '',
  firstName: 'adminFirstname',
  lastName: 'adminLastname',
  email: 'admin@email.com',
  role: ERole['PERFIL_EPIDEMIO_MESO']
}

// UTILS
const getPermissions = async (req, token, userData) => {
  let userDepartment
  let instRes
  let depRes
  const baseUrl = `${req.protocol}://${req.hostname}:${process.env.SERVER_PORT}`
  const authHeaders = { headers: { 'Authorization': `Bearer ${token}` }}

  const permUrl = baseUrl + `/hsi/account/permissions`
  const permRes = await axios.get(permUrl, authHeaders)
  const userRole = permRes?.data?.roleAssignments[0]?.role
  const institutionId = permRes?.data?.roleAssignments[0]?.institutionId
  if (institutionId && institutionId > 0) {
    const instUrl = `${baseUrl}/hsi/institution/${institutionId}/address`
    try {
    	instRes = await axios.get(instUrl, authHeaders)
    } catch(error) {
      console.log(error);
    }
    const { departmentId, provinceId } = instRes.data
    if (provinceId && departmentId) {
      // No encontre otro endpoint que traiga directamente la description del departamento de una institucion
      const depUrl = `${baseUrl}/hsi/address/masterdata/province/${provinceId}/departments`
      try {
        depRes = await axios.get(depUrl, authHeaders)
      } catch(error) {
      	console.log(error)
      }
      userDepartment = depRes.data.find(x => x.id === departmentId)?.description
    }
  }
  return { ...userData, userRole, userDepartment }
}

// CORS
const corsOptions = {
  origin: (origin, callback) => {
    if (WHITE_LIST.indexOf(origin) !== -1) {
      callback(null, true)
    } else {
      //Not allowed by CORS
      callback(null, false)
    }
  },
}

// TOKENS
// Solo funciona para desarrollo como dummy porque en producción hacemos proxy contra API
// No tenemos ninguna API privada en tableros (usamos HSI y la de CUBE)
const jwtOptions = {
  secret: JWT_SECRET_KEY,
  algorithms: ['HS256'],
  getToken: (req) => {
    if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
      return req.headers.authorization.split(' ')[1]
    } else if (req.query && req.query.token) {
      return req.query.token
    }
    return null
  },
}

const handleTokenErrors = (err, req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*')
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,PUT,PATCH,DELETE')
  res.setHeader('Access-Control-Allow-Methods', 'Content-Type', 'Authorization')
  if (err.inner) {
    let text = ''
    switch (err.inner.name) {
      case 'TokenExpiredError':
        text = 'Sesion expirada'
        break
      case 'JsonWebTokenError':
        text = 'Token inválido'
        break
      default:
        text = err.inner.name
        break
    }
    res.status(err.status).send({ ...err.inner, text })
  } else {
    next(err)
  }
}

const generateToken = (options, refresh = false) => {
  const iatValue = Math.floor(Date.now() / 1000) - 30
  const expire = refresh ? REFRESH_TOKEN_EXPIRE : ACCESS_TOKEN_EXPIRE
  return jwt.sign({ data: options, iat: iatValue }, jwtOptions.secret, { algorithm: 'HS256', expiresIn: expire })
}

let rutasSinAuth = [
  '/auth',
  '/public/version',
  '/hsi/public/version',
  '/hsi/public/info',
  '/hsi/public/recaptcha',
]
const rutasAuthHsi= [
  '/hsi/public/version',
  '/hsi/account/info',
  '/hsi/account/permissions',
  pathToRegexp('/hsi/institution/:id/address'),
  pathToRegexp('/hsi/address/masterdata/province/:id/departments')
]

if (process.env.MODE != 'development') {
  rutasSinAuth.push(...rutasAuthHsi)
}

// PROXY
const filterHsiAccount = (path) => path.match('^/hsi/account/(info|permissions)')

const filterHsiPublic = (path) => path.match('^/hsi/public/(info|version|recaptcha)')

const filterHsiInstitution = (path) => path.match('^/hsi/institution')

const filterHsiAdd = (path) => path.match('^/hsi/address/')

const filterMethod = (req, method) => req.method === method

const filterHsi = function (pathname, req) {
  return filterHsiPublic(pathname) || filterHsiAccount(pathname) || filterHsiInstitution(pathname) || filterHsiAdd(pathname) && filterMethod(req, 'GET')
}

const filterAuth = function (pathname, req) {
  return pathname.match('^/auth') && filterMethod(req,'POST')
}

const onError = (err, req, res) => {
  res.writeHead(500, { 'Content-Type': 'text/plain', })
  res.end('Something went wrong. And we are reporting a custom error message.' + err)
}

const onProxyReq = (proxyReq, req, res) => {
  if (req.method == 'POST' && req.body) {
    proxyReq.setHeader('content-type', 'application/json');
    proxyReq.setHeader('content-length', JSON.stringify(req.body).length);
    proxyReq.write(JSON.stringify(req.body))
    proxyReq.end()
  }
}

const onProxyRes = responseInterceptor(async (responseBuffer, proxyRes, req, res) => {
  if (proxyRes.headers['content-type'] === 'application/json') {
    let data = JSON.parse(responseBuffer.toString('utf8'));
    if (data.token) {
      data.accessToken = data.token
      delete data.token
      const decodeAccess = jwt.decode(data.accessToken)
      const { userId, sub } = decodeAccess
      const cubeUserData = await getPermissions(req, data.accessToken, { userId, userName: sub })
      data.cubeAccessToken = jwt.sign(cubeUserData, CUBEJS_API_SECRET, { expiresIn: ACCESS_TOKEN_EXPIRE })
      // data = Object.assign({}, data, { extra: 'foo bar' });
    }
    return JSON.stringify(data);
  }
  return responseBuffer;
})

const sourceOptions = {
  target: HSI_API_URL,
  changeOrigin: true,
  selfHandleResponse: true,
  onError,
  headers: { 'origin': HSI_API_URL },
  logLevel: 'debug',
}

// INITIALIZATION
const app = express()

const rojoReset = "\x1b[31m%s\x1b[0m"
console.log(rojoReset, "Corriendo en modo " + process.env.MODE)

// MIDDLEWARES
app.use(morgan('combined'));
app.get('/', (req, res) => res.send(APP_DESC)) //Sin cors por orden
app.use(expressjwt(jwtOptions).unless({ path: rutasSinAuth }))
app.use(cors(corsOptions))
app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use(handleTokenErrors)


// RUTAS
if (process.env.MODE != 'development') {
  const customHsiOptions = { pathRewrite: { '^/hsi': '' }, selfHandleResponse: false }
  const optionsHsi = Object.assign({}, sourceOptions, customHsiOptions)
  app.use('/hsi', createProxyMiddleware(filterHsi, optionsHsi))

  const customAuthOptions = { onProxyRes, onProxyReq }
  const optionsAuth = Object.assign({}, sourceOptions, customAuthOptions);
  app.use('/auth', createProxyMiddleware(filterAuth, optionsAuth))
}

app.get('/public/version', (req, res) => {
  const version = {
    version: APP_VERSION,
		name: APP_NAME
  }
  res.status(200).send(version)
})

if (process.env.MODE == 'development') {
  app.post('/auth', async (req, res) => {
    const { username, password } = req.body
    if ((username == VALID_USER.username && password == VALID_USER.password) ||
        (username == VALID_USER_ADMIN.username && password == VALID_USER_ADMIN.password)
    ) {
      const userData = (username == VALID_USER.username) ? { userId: VALID_USER.userId, userName: VALID_USER.sub } : { userId: VALID_USER_ADMIN.userId, userName: VALID_USER_ADMIN.sub }
      const token = generateToken(userData)
      const refresh = generateToken(userData, true)
      const cubeUserData = await getPermissions(req, token, userData)
      const cube = jwt.sign(cubeUserData, CUBEJS_API_SECRET, { expiresIn: ACCESS_TOKEN_EXPIRE })
      res.status(200).send({ cubeAccessToken: cube, accessToken: token, refreshToken: refresh })
    } else {
      res.status(400).send({ error: 'Credenciales inválidas' })
    }
  })

  app.post('/auth/refresh', (req, res) => {
    if (req.auth) {
      const newToken = generateToken(req.auth)
      const newRefresh = generateToken(req.auth, true)
      res.status(200).send({ accessToken: newToken, refreshToken: newRefresh })
    } else {
      res.status(401).send({ error: 'Unauthorized' })
    }
  })

  app.get('/hsi/account/permissions', (req, res) => {
    if (req.auth) {
      const u =  (req.auth.data.userId == 1) ? VALID_USER_ADMIN : VALID_USER
      const data = {
        roleAssignments: [
          {
            institutionId: 1,
            role: u.role,
            roleDescription: "dev"
          },
        ],
      }
      res.status(200).send(data)
    } else {
      res.status(401).send({ error: 'Unauthorized' })
    }
  })

  app.get('/hsi/account/info', (req, res) => {
    if (req.auth) {
      const u =  (req.auth.data.userId == 1) ? VALID_USER_ADMIN : VALID_USER
      const data = {
        "id": 1,
        "email": u.email,
        "personDto": {
          "firstName": u.firstName,
          "lastName": u.lastName,
        },
        "previousLogin": {
          "date": {"year":2022,"month":9,"day":15},
          "time":{"hours":19,"minutes":1,"seconds":55}
        }
      }
      res.status(200).send(data)
    } else {
      res.status(401).send({ error: 'Unauthorized' })
    }
  })

  app.get('/hsi/public/version', (req, res) => {
    res.status(200).send({"version":"1.42.dev.local"})
  })

  app.get('/hsi/public/info', (req, res) => {
    res.status(200).send({"flavor":"minsal","features":["HABILITAR_VISUALIZACION_PROPIEDADES_SISTEMA","HABILITAR_BUSQUEDA_LOCAL_CONCEPTOS","RESTRINGIR_DATOS_EDITAR_PACIENTE","HABILITAR_SERVICIO_RENAPER","HABILITAR_GENERACION_ASINCRONICA_DOCUMENTOS_PDF","HABILITAR_HISTORIA_CLINICA_AMBULATORIA","HABILITAR_MODULO_GUARDIA","HABILITAR_CARGA_FECHA_PROBABLE_ALTA","HABILITAR_DESCARGA_DOCUMENTOS_PDF","HABILITAR_CREACION_USUARIOS","HABILITAR_INFORMES","HABILITAR_CONFIGURACION","HABILITAR_HISTORIA_CLINICA_EXTERNA","OCULTAR_LISTADO_PROFESIONES_WEBAPP","HABILITAR_GESTION_DE_TURNOS","HABILITAR_ODONTOLOGY","HABILITAR_MODULO_PORTAL_PACIENTE","HABILITAR_REPORTE_EPIDEMIOLOGICO","MAIN_DIAGNOSIS_REQUIRED","HABILITAR_DATOS_AUTOPERCIBIDOS","RESPONSIBLE_DOCTOR_REQUIRED","HABILITAR_REPORTES"]})
  })

  app.get('/hsi/public/recaptcha', (req, res) => {
    res.status(200).send({"siteKey":"test-key","enabled":false})
  })

  app.get('/hsi/institution/:id/address', (req, res) => {
    return res.status(200).send({
      "id": 0,
      "street": "string",
      "number": "string",
      "floor": "string",
      "apartment": "string",
      "quarter": "string",
      "postcode": "string",
      "city": {
        "id": 0,
        "description": "string"
      },
      "cityId": 0,
      "provinceId": 1,
      "departmentId": 1,
      "latitude": 0,
      "longitude": 0,
      "countryId": 0
    })
  })
  app.get('/hsi/address/masterdata/province/:id/departments', (req, res) => {
    if (req.auth) {
      const u =  (req.auth.data.userId == 1) ? VALID_USER_ADMIN : VALID_USER
      return res.status(200).send(
        [
          {
            "id": 1,
            "description": u.department
          }
        ]
      )
    } else {
      res.status(401).send({ error: 'Unauthorized' })
    }
  })

}

app.listen(process.env.SERVER_PORT, () => {
  console.log(rojoReset, `Arphai Auth backend listening on port ${process.env.SERVER_PORT}`)
})
