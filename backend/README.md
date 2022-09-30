# Arphai-auth-backend

### Requisitos

- **node**: <= 12

### Instalación

- `npm install`
- `npm start` o `nodemon app.js` (en caso de tener instalado nodemon)

### Aclaración

- En modo development usa una API de ejemplo
- En modo producción usa una API como proxy al servidor de HSI


### Configuraciones

#### Usuario Desarrollo

```javascript=

// Usuario válido para loguearse
const VALID_USER = {
    ...
    username: 'admin@email.com',
    password: 'admin'
```

#### Variable de ambiente

Usar variables de ambiente por defecto:

```
cp .env.example .env
```

Descripción:

```
CUBEJS_API_SECRET=''  // secret key de cube-js
ACCESS_TOKEN_EXPIRE='1d'  // tiempo de duración del token del backend express
REFRESH_TOKEN_EXPIRE='2d'  // tiempo de duración del refresh token del backend express
JWT_SECRET_KEY='Secret' // secret key del backend express
SERVER_PORT=5000 // Puerto donde se sirve el backend
WHITE_LIST='http://localhost:3000,localhost:3000'  // lista de white list
MODE='development'  // modo development o production para usar el token dev de cube
HSI_API_URL='http://servidor_hsi/' // servidor de HSI a donde hacer de proxy
```

Además se utilizan variables de entorno que salen package.json cuando se ejecuta con `npm`

### Instalación

- `npm install`
- `npm start` o `nodemon app.js` (en caso de tener instalado nodemon)
