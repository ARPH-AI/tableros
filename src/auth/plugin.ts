import { App, computed, reactive, readonly, ref } from 'vue'
import { setupDevtools } from './devtools'
import jwt_decode from "jwt-decode"
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
    localStorage.setItem(CUBE_TOKEN_STORAGE_KEY, tokens.cubeAccessToken)
  }

  function removeTokens(): void {
    localStorage.removeItem(TOKEN_STORAGE_KEY)
    localStorage.removeItem(REFRESH_TOKEN_STORAGE_KEY)
    localStorage.removeItem(CUBE_TOKEN_STORAGE_KEY)
  }

  async function getHsiAccountPermissions() {
    const response = await backendApi.getHsiAccountPermissions()
    let permissions = {}
    if (response.status === 200) {
      permissions = response.data
    } else {
      console.error('Error al querer obtener permisos de usuarix')
    }
    return permissions
  }

  async function getHsiAccountInfo() {
    const response = await backendApi.getHsiAccountInfo()
    let info = {}
    if (response.status === 200) {
      const { id, email, personDto:{ firstName, lastName }} = response.data
      info = { id, email, firstName, lastName }
    } else {
      console.log('Error al querer obtener info de usuarix')
    }
    return info
  }

  async function login(formData: LoginUser) {
    let response
    const notify = useNotify()
    const body: AuthApiLoginUserRequest = {
      loginUser: formData,
    }

    try {
      response = await backendApi.loginUser(body)
    } catch (error) {
      notify.showNotify({ type: 'error', show: true, data: { text: error.message }})
      return false
    }

    const { data } = response
    if (response.status == 200) {
      isAuthenticated.value = true
      accessToken.value = data.accessToken
      refreshToken.value = data.refreshToken
      cubeAccessToken.value = data.cubeAccessToken

      const info = await getHsiAccountInfo()
      const perm = await getHsiAccountPermissions()
      const jwtDecoded = jwt_decode(cubeAccessToken.value)
      const { userDepartment, userRole } = jwtDecoded
      user.value = Object.assign({}, info, perm, { userDepartment, userRole })
      const finalData = Object.assign({ cubeAccessToken: cubeAccessToken }, data)
      storeTokens({ accessToken: data.accessToken, refreshToken: data.refreshToken, cubeAccessToken: data.cubeAccessToken })
      router.push(router.currentRoute.value.query.redirectTo?.toString() || options.loginRedirectRoute)
      return finalData
    } else {
      notify.showNotify({
        type: 'error',
        show: true,
        data: {
          text: data.error || data.text,
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
        const { accessToken: token, refreshToken } = data
        isAuthenticated.value = true
        accessToken.value = token
        storeTokens({ accessToken: token, refreshToken: refreshToken })
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
    cubeAccessToken.value = undefined
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
    cubeAccessToken,
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
