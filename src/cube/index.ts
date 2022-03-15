import cubejs from '@cubejs-client/core'

const cubeApi = cubejs(import.meta.env.VITE_CUBEJS_TOKEN, { apiUrl: import.meta.env.VITE_CUBEJS_API_URL })

export default cubeApi
