# Arphai-fake-backend  

### Requisitos
- **node**: <= 12


### Instalación
- `npm install`
- `npm start` o `nodemon app.js` (en caso de tener instalado nodemon)

### Configuraciones
```javascript=
// Tiempo de expiración del access token
const ACCESS_TOKEN_EXPIRE = '1m' // 1 minuto

// Tiempo de expiración del refresh token
const REFRESH_TOKEN_EXPIRE = '2m' // 2 minutos

// Clave secreta para generar los tokens
const JWT_SECRET_KEY = 'arphai-secret'

// Usuario válido para loguearse
const VALID_USER = {
    email: 'admin@email.com',
    password: 'admin'
}
```

### ENV VARS
En un archivo `.env` configurar las siguientes variables
```
CUBEJS_API_SECRET=''  // secret key de cube-js
ACCESS_TOKEN_EXPIRE='1m'  // tiempo de duración del token del backend express
REFRESH_TOKEN_EXPIRE='2m'  // tiempo de duración del refresh token del backend express
JWT_SECRET_KEY='' // secret key del backend express
SERVER_PORT=5000 // puerto del servidor
DEV_TOKEN=''  // token dev de cube
WHITE_LIST='http://localhost:3000,localhost:3000'  // lista de white list
MODE='development'  // modo development o production para usar el token dev de cube
```