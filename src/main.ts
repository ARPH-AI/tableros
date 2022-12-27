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
import { createNotify } from './notification'
import { createPinia } from 'pinia'

let app = null

const auth = createAuth({
  router,
  loginRedirectRoute: 'home',
  logoutRedirectRoute: 'login',
  autoConfigureNavigationGuards: true,
  axios: {
    instance: axiosInstance,
    autoAddAuthorizationHeader: true,
    autoRefreshExpiredToken: true,
  },
})

const notify = createNotify({
  show: false,
  type: 'success',
  data: {
    text: 'Default Notification',
    time: 3000,
  },
})

const loadAxe = async () => await import('vue-axe')

if (process.env.NODE_ENV === 'development') {
  loadAxe().then((VueAxe) => {
    app = createApp({
      render: () => h(Fragment, [h(App), h(VueAxe.VueAxePopup)]),
    })
    app.use(VueAxe.default)
    app.use(router)
    app.use(auth)
    app.use(notify)
    app.use(i18n)
    app.use(OpenLayersMap)
    app.provide('enable-route-transitions', true)
    app.use(createPinia())
    app.mount('#app')
  })
} else {
  app = createApp(App)
  app.use(router)
  app.use(auth)
  app.use(notify)
  app.use(i18n)
  app.use(OpenLayersMap)
  app.provide('enable-route-transitions', true)
  app.use(createPinia())
  app.mount('#app')
}

export default app
