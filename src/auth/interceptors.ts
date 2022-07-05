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
      // Any status code that lie within the range of 2xx cause this function to trigger
      // Do something with response data
      return response;
    },
    function (error) {
      const auth = useAuth()

      let response = error
      if (auth.isAuthenticated) {
        auth.tokenRefresh(auth.refreshToken || '')
      }
      if (error.response) {
        response = error.response
      }
      
      return Promise.reject(response)
    }
  );
}