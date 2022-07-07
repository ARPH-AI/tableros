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