import axiosInstance from './axios'
import { OsmApi } from '@/api-client-osm'
import { DatosgeoApi } from '@/api-client-datosgeo'
import { BackendApi } from '@/api-client-backend'

// Backend base path
const basePath = import.meta.env.VITE_BACKEND_API_URL
console.log(basePath)
export const fetchClient = axiosInstance
export const osmApi = new OsmApi(undefined, undefined, fetchClient)
export const datosgeoApi = new DatosgeoApi(undefined, undefined, fetchClient)
export const backendApi = new BackendApi(undefined, basePath, fetchClient)
