import axiosInstance from './axios'
import { OsmApi } from '@/api-client-osm'
import { DatosgeoApi } from '@/api-client-datosgeo'
import { AuthApi, RefreshApi, FakeDataApi } from '@/api-client-auth'

export const fetchClient = axiosInstance
export const osmApi = new OsmApi(undefined, undefined, fetchClient)
export const datosgeoApi = new DatosgeoApi(undefined, undefined, fetchClient)
export const authApi = {
  auth: new AuthApi(undefined, undefined, fetchClient),
  refresh: new RefreshApi(undefined, undefined, fetchClient),
  fakeData: new FakeDataApi(undefined, undefined, fetchClient)
}