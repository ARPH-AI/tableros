import { App, computed, reactive, readonly, ref } from 'vue'
import { setupDevtools } from './devtools'
import { configureAuthorizationHeaderInterceptor, configureRefreshTokenResponseInterceptor } from './interceptors'
import { configureNavigationGuards } from './navigationGuards'
import { ANONYMOUS_USER, AuthOptions, AuthPlugin, RequiredAuthOptions, User, UserFormData } from './types'
import { authApi } from '@/api'
import { useNotify } from '@/notification'

const TOKEN_KEY = 'arphai-token'
const REFRESH_TOKEN_KEY = 'arphai-refreshToken'

export let authInstance: AuthPlugin | undefined = undefined

function setupAuthPlugin(options: RequiredAuthOptions): AuthPlugin {
  const router = options.router
  const isAuthenticated = ref(false)
  const accessToken = ref<string>()
  const refreshToken = ref<string>()
  const user = ref<User>({ ...ANONYMOUS_USER })
  const userFullName = computed(() => {
    let fullname = user.value.firstName
    if (user.value.lastName) {
      fullname += ` ${user.value.lastName}`
    }
    return fullname
  })
  

  function storeTokens(tokens: any) {
    localStorage.setItem(TOKEN_KEY, tokens.token)
    localStorage.setItem(REFRESH_TOKEN_KEY, tokens.refreshToken)
  }

  function removeTokens(): void {
    localStorage.removeItem(TOKEN_KEY)
    localStorage.removeItem(REFRESH_TOKEN_KEY)
  }

  async function login(formData: UserFormData) {
    try {
      const authResponse = await authApi.auth.loginUser({ body: formData })
      const responseData = authResponse.data
      user.value = responseData.user
      isAuthenticated.value = true
      accessToken.value = responseData.accessToken
      refreshToken.value = responseData.refreshToken
      storeTokens({ token: responseData.accessToken, refreshToken: responseData.refreshToken })
      router.push(router.currentRoute.value.query.redirectTo?.toString() || options.loginRedirectRoute)
      return authResponse
    } catch (error) {
      const notify = useNotify()
      notify.showNotify({
        type: 'error',
        show: true,
        data: {
          text: error.data.error
        }
      })
      return error
    }
  }

  async function tokenRefresh(refreshToken: String) {
    if (isAuthenticated.value) {
      const body = { body: { refreshToken } }
      accessToken.value = refreshToken
      try {
        const response = await authApi.refresh.refreshToken(body)
        const responseData = response.data
        storeTokens(response.data)
        const { accessToken: token, refreshToken } = responseData
        user.value = responseData.user
        isAuthenticated.value = true
        accessToken.value = token
        storeTokens({ token: token, refreshToken: refreshToken })
        router.push(router.currentRoute.value.query.redirectTo?.toString() || options.loginRedirectRoute)
      } catch (error) {
        console.log('catch tokenRefresh error: ', error)
        logout()
        const notify = useNotify()
        notify.showNotify({
          type: 'error',
          show: true,
          data: {
            text: 'Sesión expirada'
          }
        })
      }
    }
  }

  async function logout() {
    console.log('plugin -> logout')
    user.value = { ...ANONYMOUS_USER }
    isAuthenticated.value = false
    accessToken.value = undefined
    removeTokens()
    router.push(options.logoutRedirectRoute)
  }

  async function getFakeData() {
    try {
      const response = await authApi.fakeData.getFakeData()
      return response.data
    } catch (error) {
      console.log('catch getFakeData error: ', error)
    }
  }

  /*
   * "reactive" unwraps 'ref's, therefore using the .value is not required.
   * E.g: from "auth.isAuthenticated.value" to "auth.isAuthenticated"
   * but when using destructuring like: { isAuthenticated } = useAuth() the reactivity over isAuthenticated would be lost
   * this is not recommended but in such case use toRefs: { isAuthenticated } = toRefs(useAuth())
   * See: https://v3.vuejs.org/guide/reactivity-fundamentals.html#ref-unwrapping
   * And: https://v3.vuejs.org/guide/reactivity-fundamentals.html#destructuring-reactive-state
   */
  const unWrappedRefs = reactive({
    isAuthenticated,
    accessToken,
    refreshToken,
    user,
    userFullName,
    login,
    logout,
    tokenRefresh,
    getFakeData,
  })

  return readonly(unWrappedRefs)
}

const defaultOptions = {
  loginRedirectRoute: '/',
  logoutRedirectRoute: '/',
  loginRouteName: 'login',
  autoConfigureNavigationGuards: true,
  autoRefreshExpiredToken: true,
}
export function createAuth(appOptions: AuthOptions) {
  // Fill default values to options that were not received
  const options: RequiredAuthOptions = { ...defaultOptions, ...appOptions }

  return {
    install: (app: App): void => {
      authInstance = setupAuthPlugin(options)
      app.config.globalProperties.$auth = authInstance

      if (options.autoConfigureNavigationGuards) {
        configureNavigationGuards(options.router, options)
      }

      if (options.axios?.autoAddAuthorizationHeader) {
        configureAuthorizationHeaderInterceptor(options.axios.instance, options.axios.authorizationHeaderPrefix)
      }

      if (options.axios?.autoRefreshExpiredToken) {
        configureRefreshTokenResponseInterceptor(options.axios.instance)
      }

      if (import.meta.env.DEV) {
        // @ts-expect-error: until it gets fixed in devtools
        setupDevtools(app, authInstance)
      }
    },
  }
}
