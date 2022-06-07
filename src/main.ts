import '@/assets/scss/app.scss'
import './index.css'
import { createApp, h, Fragment } from 'vue'
import { createAuth } from './auth'
import App from './App.vue'
import router from './router'
import axiosInstance from './api/axios'
import i18n from './plugins/i18n'
import OpenLayersMap from 'vue3-openlayers'
import 'vue3-openlayers/dist/vue3-openlayers.css'
import { plugin, defaultConfig } from '@formkit/vue'

let app = null

const auth = createAuth({
  router,
  loginRedirectRoute: { name: 'situacion_actual_hsi' },
  logoutRedirectRoute: { name: 'situacion_actual_hsi' },
  autoConfigureNavigationGuards: true,
  axios: {
    instance: axiosInstance,
    autoAddAuthorizationHeader: true,
  },
})

if (process.env.NODE_ENV === 'development') {
  const VueAxe = await import('vue-axe')
  app = createApp({
    render: () => h(Fragment, [h(App), h(VueAxe.VueAxePopup)]),
  })
  app.use(VueAxe.default)
} else {
  app = createApp(App)
}

export default app

app.use(router)
app.use(auth)
app.use(i18n)
app.use(OpenLayersMap)
app.use(plugin, defaultConfig)
app.provide('enable-route-transitions', true)
app.mount('#app')
