import { App, computed, reactive, readonly, ref } from 'vue'
import { setupDevtools } from './devtools'
import { configureAuthorizationHeaderInterceptor, configureRefreshTokenResponseInterceptor } from './interceptors'
import { configureNavigationGuards } from './navigationGuards'
import { ANONYMOUS_USER, AuthOptions, AuthPlugin, RequiredAuthOptions, User, UserTokens } from './types'
import { useNotify } from '@/notification'
import { backendApi } from '@/api'
import { RefreshToken, AuthApiLoginUserRequest, LoginUser } from '@/api-client-backend'

const TOKEN_STORAGE_KEY = 'arphai-token'
const REFRESH_TOKEN_STORAGE_KEY = 'arphai-refreshToken'
const CUBE_TOKEN_STORAGE_KEY = 'cube-token'

export let authInstance: AuthPlugin | undefined = undefined

function setupAuthPlugin(options: RequiredAuthOptions): AuthPlugin {
  const router = options.router
  const isAuthenticated = ref(false)
  const accessToken = ref<string>()
  const refreshToken = ref<string>()
  const cubeAccessToken = ref<string>()
  const user = ref<User>({ ...ANONYMOUS_USER })
  const userFullName = computed(() => {
    let fullname = user.value.firstName
    if (user.value.lastName) {
      fullname += ` ${user.value.lastName}`
    }
    return fullname
  })

  function storeTokens(tokens: UserTokens) {
    localStorage.setItem(TOKEN_STORAGE_KEY, tokens.accessToken)
    localStorage.setItem(REFRESH_TOKEN_STORAGE_KEY, tokens.refreshToken)
    localStorage.setItem(CUBE_TOKEN_STORAGE_KEY, tokens.cubeToken)
  }

  function removeTokens(): void {
    localStorage.removeItem(TOKEN_STORAGE_KEY)
    localStorage.removeItem(REFRESH_TOKEN_STORAGE_KEY)
    localStorage.removeItem(CUBE_TOKEN_STORAGE_KEY)
  }

  async function getCubeToken() {
    const response = await backendApi.getCubeToken()
    let token = ''
    if (response.status === 200) {
      token = response.data.token || ''
    } else {
      console.log('Error al quere obtener token de cube')
    }
    return token
  }

  async function login(formData: LoginUser) {
    const body: AuthApiLoginUserRequest = {
      loginUser: formData,
    }
    const response = await backendApi.loginUser(body)
    const { data } = response
    if (response.status == 200) {
      user.value = data.user
      isAuthenticated.value = true
      accessToken.value = data.accessToken
      refreshToken.value = data.refreshToken
      const cubeToken = await getCubeToken()
      cubeAccessToken.value = cubeToken
      const finalData = Object.assign({ cubeToken: cubeToken }, data)
      storeTokens({ accessToken: data.accessToken, refreshToken: data.refreshToken, cubeToken: cubeToken })
      router.push(router.currentRoute.value.query.redirectTo?.toString() || options.loginRedirectRoute)
      return finalData
    } else {
      const notify = useNotify()
      notify.showNotify({
        type: 'error',
        show: true,
        data: {
          text: data.error,
        },
      })
    }
  }

  async function tokenRefresh(refreshToken: RefreshToken) {
    if (isAuthenticated.value) {
      const body = { refreshToken: refreshToken }
      accessToken.value = refreshToken
      const response = await backendApi.refreshToken(body)
      const { data } = response
      if (response.status === 200) {
        storeTokens(response.data)
        const { accessToken: token, refreshToken, user: userRes } = data
        user.value = userRes
        isAuthenticated.value = true
        accessToken.value = token
        storeTokens({ token: token, refreshToken: refreshToken })
        router.push(router.currentRoute.value.query.redirectTo?.toString() || options.loginRedirectRoute)
      } else {
        logout()
        const notify = useNotify()
        notify.showNotify({
          type: 'error',
          show: true,
          data: {
            text: 'Sesión expirada',
          },
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
