const express = require('express')
const cors = require('cors')
const app = express()
const port = 5000
const jwt = require('jsonwebtoken');
const { expressjwt } = require("express-jwt");

const CUBEJS_API_SECRET = 'cube-secret'
const ACCESS_TOKEN_EXPIRE = '1m' // 1 minuto
const REFRESH_TOKEN_EXPIRE = '2m' // 2 minutos
const JWT_SECRET_KEY = 'arphai-secret'
const VALID_USER = {
    id: '0000',
    firstName: 'Usuario',
    lastName: 'Administrador',
    email: 'admin@email.com',
}
const ERole = {
    PARTNER: "PARTNER",
    HR: "HR",
    MANAGER: "MANAGER",
    SCRUM_MASTER: "SCRUM_MASTER",
    FUNCTIONAL: "FUNCTIONAL",
    DEVELOPER: "DEVELOPER",
}

const corsOptions = {
    origin: '*',
    allows: '*'
}
const jwtOptions = {
    secret: JWT_SECRET_KEY,
    algorithms: ["HS256"],
    getToken: (req) => {
        if (
            req.headers.authorization &&
            req.headers.authorization.split(" ")[0] === "Bearer"
        ) {
            return req.headers.authorization.split(" ")[1];
        } else if (req.query && req.query.token) {
            return req.query.token;
        }
        return null;
    }
}

const handleTokenErrors = (err, req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin','*');
    res.setHeader('Access-Control-Allow-Methods','GET,POST,PUT,PATCH,DELETE');
    res.setHeader('Access-Control-Allow-Methods','Content-Type','Authorization');
    console.log('err.inn ', err.inner.name)
    if (err.inner) {
        let text = ''
        switch (err.inner.name) {
            case 'TokenExpiredError':
                text = 'Sesion expirada'
                break;
            case 'JsonWebTokenError':
                text = 'Token inválido'
            default:
                text = err.inner.name
                break;
        }
        res.status(err.status).send({ ...err.inner, text })
    } else {
        next(err);
    }
}

const generateToken = (options, refresh=false) => {
    const iatValue = Math.floor(Date.now() / 1000) - 30
    const expire = refresh? REFRESH_TOKEN_EXPIRE : ACCESS_TOKEN_EXPIRE
    return jwt.sign({data: options, iat: iatValue }, jwtOptions.secret, { algorithm: 'HS256', expiresIn: expire })
}

app.use(expressjwt(jwtOptions).unless({ path: ["/auth"] }))
app.use(cors(corsOptions))
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(handleTokenErrors)


app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.post('/auth',
    (req, res) => {
        const { username, password } = req.body
        if(username == 'admin@email.com' && password == 'admin') {
            const token = generateToken({user: VALID_USER, role: 'admin'})
            const refresh = generateToken({user: VALID_USER, role: 'admin'}, true)
            res.status(200).send({user: VALID_USER, accessToken: token, refreshToken: refresh})
        } else {
            res.status(400).send({error: 'Credenciales inválidas'})
        }
    }
)

app.post('/auth/refresh',
    (req, res) => {
        if (req.auth) {
            const newToken = generateToken(req.auth.data)
            const newRefresh = generateToken(req.auth.data, true)
            res.status(200).send({user: req.auth.data.user, accessToken: newToken, refreshToken: newRefresh})
        } else {
            res.status(401).send({error: 'Unauthorized'})
        }
    }
)

app.get('/auth/cubejs-token', 
    (req, res) => {
        if (req.auth) {
            const devToken = 'a36e649cedd441107c7531ec2da8415e592f19e9f93c250f001e9c40a660694892a3f78ccd8c027ae8504453ba25ebd0de47467a984bf98176c3197a9ffd685d'
            // const realToken = jwt.sign(req.user, CUBEJS_API_SECRET, { expiresIn: '1d', })
            res.status(200).send({token: devToken})
        } else {
            res.status(401).send({error: 'Unauthorized'})
        }
    }
)

app.get('/account/permissions',
    (req, res) => {
        if (req.auth) {
            const data = {
                roleAssignments: [
                    {
                        projectId: 1,
                        role: ERole['MANAGER']
                    }
                ]
            }
            res.status(200).send(data)
        } else {
            res.status(401).send({error: 'Unauthorized'})
        }
    }
)

app.get('/account/info',
    (req, res) => {
        if (req.auth) {
            const data = {
                info: 'Mollit Lorem reprehenderit qui elit id aliqua. Deserunt ipsum ad cupidatat ullamco.'
            }
            res.status(200).send(data)
        } else {
            res.status(401).send({error: 'Unauthorized'})
        }
    }
)

app.get('/public/info',
    (req, res) => {
        if (req.auth) {
            const data = {
                flavor: 'public info flavor'
            }
            res.status(200).send(data)
        } else {
            res.status(401).send({error: 'Unauthorized'})
        }
    }
)

app.get('/public/version',
    (req, res) => {
        if (req.auth) {
            const data = {
                version: '1.0.0'
            }
            res.status(200).send(data)
        } else {
            res.status(401).send({error: 'Unauthorized'})
        }
    }
)

app.get('/dashboard-data',
    (req, res) => {
        if (req.auth) {
            res.status(200).send({
                "id": "600dc3b5c4e60ba2ebf06569",
                "name": "Howell Faulkner",
                "about": "Mollit Lorem reprehenderit qui elit id aliqua. Deserunt ipsum ad cupidatat ullamco ut aliqua est do consectetur nostrud sit esse.",
                "address": "77 Hemlock Street, Hasty, Florida",
                "company": "Fleetmix"
            })
        } else {
            res.status(401).send({error: 'Unauthorized'})
        }
    }
)

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})