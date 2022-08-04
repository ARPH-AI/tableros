import { AxiosInstance } from 'axios'
import { RouteLocationRaw, Router, RouteRecordName } from 'vue-router'

export interface User {
  id?: string
  firstName: string
  lastName: string
  email?: string
}

export const ANONYMOUS_USER: Readonly<User> = Object.freeze({
  id: undefined,
  firstName: 'Anonymous',
  lastName: '',
})

export interface AuthPlugin {
  user: User
  isAuthenticated: boolean
  userFullName: string
  accessToken?: string
  refreshToken?: string
  login: (formData: UserFormData) => Promise<Response>
  logout: () => Promise<void>
  tokenRefresh: (refresh: string) => Promise<void>
}

export interface AuthAxiosConfig {
  instance: AxiosInstance
  autoAddAuthorizationHeader: boolean
  authorizationHeaderPrefix?: string
  autoRefreshExpiredToken?: boolean
}

export interface RequiredAuthOptions {
  router: Router
  loginRouteName: RouteRecordName
  loginRedirectRoute: RouteLocationRaw
  logoutRedirectRoute: RouteLocationRaw
  autoConfigureNavigationGuards: boolean
  axios?: AuthAxiosConfig
}

/*
 * Make all optional but router
 * See: https://www.typescriptlang.org/docs/handbook/utility-types.html#partialtype
 * See: https://stackoverflow.com/a/51507473/4873750
 */
export interface AuthOptions extends Omit<Partial<RequiredAuthOptions>, 'router'> {
  router: Router
}

export interface UserFormData {
  username: string,
  password: string
}

export interface ApplicationVersionDto {
  version: string
}

export interface JWTokenDto {
  token: string,
  refreshToken: string
}

export interface PasswordResetDto {
  password: string,
  token: string
}

export interface PermissionsDto {
  roleAssingments: RoleAssingment[]
}

export interface PublicInfoDto {
  flavor: string
}

export interface RefreshTokenDto {
  refreshToken: string
}

export interface RoleAssingment {
  projectId: number, role: ERole
}

export const enum ERole {
  ADMIN='ADMIN', USER='USER '
}
