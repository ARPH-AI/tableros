# Arphai-auth-backend

### Requisitos

- **node**: <= 12

### Instalación

- `npm install`
- `npm start` o `nodemon app.js` (en caso de tener instalado nodemon)

### Configuraciones

#### Usuario

```javascript=

// Usuario válido para loguearse
const VALID_USER = {
    email: 'admin@email.com',
    password: 'admin'
}
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
DEV_TOKEN=''  // token dev de cube
WHITE_LIST='http://localhost:3000,localhost:3000'  // lista de white list
MODE='development'  // modo development o production para usar el token dev de cube
```

### Instalación

- `npm install`
- `npm start` o `nodemon app.js` (en caso de tener instalado nodemon)
