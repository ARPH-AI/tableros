import axiosInstance from './axios'
import { OsmApi } from '@/api-client-osm'
import { DatosgeoApi } from '@/api-client-datosgeo'
import {
  AuthApi,
  RefreshApi,
  AccountApi,
  CubeApi,
  InfoApi,
  PermissionsApi,
  PublicApi,
  VersionApi,
} from '@/api-client-backend'

export const fetchClient = axiosInstance
export const osmApi = new OsmApi(undefined, undefined, fetchClient)
export const datosgeoApi = new DatosgeoApi(undefined, undefined, fetchClient)
export const authApi = new AuthApi(undefined, undefined, fetchClient)
export const authCubeApi = new CubeApi(undefined, undefined, fetchClient)
export const refreshApi = new RefreshApi(undefined, undefined, fetchClient)
export const accountApi = new AccountApi(undefined, undefined, fetchClient)
export const permissionsApi = new PermissionsApi(undefined, undefined, fetchClient)
export const infoApi = new InfoApi(undefined, undefined, fetchClient)
export const publicApi = new PublicApi(undefined, undefined, fetchClient)
export const versionApi = new VersionApi(undefined, undefined, fetchClient)
