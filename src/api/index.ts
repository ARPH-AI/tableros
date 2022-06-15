import axiosInstance from './axios'
import { OsmApi } from '@/api-client-osm'
import { DatosgeoApi } from '@/api-client-datosgeo'
import { AuthApi } from '@/api-client-auth'

export const fetchClient = axiosInstance
export const osmApi = new OsmApi(undefined, undefined, fetchClient)
export const datosgeoApi = new DatosgeoApi(undefined, undefined, fetchClient)
export const authApi = new AuthApi(undefined, undefined, fetchClient)