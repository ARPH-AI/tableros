import axiosInstance from './axios'
import cubejs from '@cubejs-client/core'
import { OsmApi } from '@/api-client-osm'
import { DatosgeoApi } from '@/api-client-datosgeo'
import { AuthApi, RefreshApi, FakeDataApi, CubeApi } from '@/api-client-auth'
import { AccountApi, PermissionsApi, InfoApi as AccountInfoApi } from '@/api-client-account'
import { InfoApi as PublicInfoApi, PublicApi, VersionApi } from '@/api-client-public'


const CUBE_API_URL = import.meta.env.VITE_CUBEJS_API_URL
export const cubeApi = cubejs(
  () => {
    if (!apiTokenPromise) {
      apiTokenPromise = fetch(`${CUBE_API_URL}/auth/cubejs-token`)
        .then((res) => res.json())
        .then((r) => r.token);
    }
    return apiTokenPromise;
  },
  {
    apiUrl: `${CUBE_API_URL}/cubejs-api/v1`,
  }
);


export const fetchClient = axiosInstance
export const osmApi = new OsmApi(undefined, undefined, fetchClient)
export const datosgeoApi = new DatosgeoApi(undefined, undefined, fetchClient)
export const authApi = {
  auth: new AuthApi(undefined, undefined, fetchClient),
  refresh: new RefreshApi(undefined, undefined, fetchClient),
  fakeData: new FakeDataApi(undefined, undefined, fetchClient),
  cube: new CubeApi(undefined, undefined, fetchClient)
}
export const accountApi = {
  account: new AccountApi(undefined, undefined, fetchClient),
  permissions: new PermissionsApi(undefined, undefined, fetchClient),
  info: new AccountInfoApi(undefined, undefined, fetchClient)
}
export const publicApi = {
  info: new PublicInfoApi(undefined, undefined, fetchClient),
  public: new PublicApi(undefined, undefined, fetchClient),
  version: new VersionApi(undefined, undefined, fetchClient)
}