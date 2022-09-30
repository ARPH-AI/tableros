import { AxiosInstance } from 'axios'
import { useAuth } from './useAuth'

export function configureAuthorizationHeaderInterceptor(axiosInstance: AxiosInstance, prefix = 'Bearer') {
  axiosInstance.interceptors.request.use((config) => {
    const auth = useAuth()
    config.headers = config.headers ?? {}
    if (auth.isAuthenticated) {
      config.headers.Authorization = `${prefix} ${auth.accessToken}`
    }
    return config
  })
}

export function configureRefreshTokenResponseInterceptor(axiosInstance: AxiosInstance) {
  axiosInstance.interceptors.response.use(
    function (response) {
      // Handlear cualquier response en el rango de 2xx
      return response
    },
    function (error) {
      if (error.response) {
        // Handlear cualquier response status distinto a 2xx
        const { response } = error
        const { url } = response.config
        const auth = useAuth()
        if (!url.includes('/auth/refresh') && auth.isAuthenticated && response.data.name === 'TokenExpiredError') {
          auth.tokenRefresh(auth.refreshToken || '')
        }
        return Promise.resolve(response)
      }
      return Promise.reject(error)
    }
  )
}
