import { App, reactive, readonly, ref } from 'vue'
import { NotifyPlugin, NotifyData, NotifyOptions } from './types'
import { setupDevtools } from './devtools'

export let notifyInstance: NotifyPlugin | undefined = undefined

function setupNotifyPlugin(options: NotifyOptions): NotifyPlugin {
  const show = ref<boolean>(options.show)
  const type = ref<string>(options.type)
  const data = ref<NotifyData>(options.data)
  const time = ref<number>(options.data.time)
  const text = ref<string>(options.data.text)

  function showNotify(options: NotifyOptions) {
    show.value = options.show
    type.value = options.type
    data.value = options.data
    time.value = options.data.time || 3000
    text.value = options.data.text
    setTimeout(hideNotify, time.value)
  }

  function hideNotify() { show.value = false }

  const unWrappedRefs = reactive({
    show,
    type,
    data,
    showNotify,
    hideNotify,
  })

  return readonly(unWrappedRefs)

}

const defaultOptions = {
  show: false,
  type: 'success',
  data: {
    time: 3000,
    text: 'Test'
  }
}


export function createNotify(appOptions: NotifyOptions) {
  // Fill default values to options that were not received
  const options: NotifyOptions = { ...defaultOptions, ...appOptions }

  return {
    install: (app: App): void => {
      notifyInstance = setupNotifyPlugin(options)
      app.config.globalProperties.$notify = notifyInstance

      if (import.meta.env.DEV) {
        // @ts-expect-error: until it gets fixed in devtools
        setupDevtools(app, notifyInstance)
      }
    },
  }
}

