import cubejs from '@cubejs-client/core'
import { useAuth } from '../auth/useAuth'

const auth = useAuth()
const cubeApi = cubejs(auth.cubeAccessToken, { apiUrl: import.meta.env.VITE_CUBEJS_API_URL })

export default cubeApi
