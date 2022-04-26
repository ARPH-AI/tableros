import { OsmApi } from '@/api-client-osm'
import { DatosgeoApi } from '@/api-client-datosgeo'
import axiosInstance from './axios'

export const osmApi = new OsmApi(undefined, undefined, axiosInstance)
export const datosgeoApi = new DatosgeoApi(undefined, undefined, axiosInstance)
