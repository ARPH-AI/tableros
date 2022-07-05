import { App, setupDevtoolsPlugin } from '@vue/devtools-api'
import { watch } from 'vue'
import { NotifyPlugin } from './types'

const stateType = 'Notify Plugin'

export function setupDevtools(app: App, plugin: NotifyPlugin) {
  setupDevtoolsPlugin(
    {
      id: 'basic-notify-plugin',
      label: 'Basic Notify Plugin',
      componentStateTypes: [stateType],
      app,
    },
    (api) => {
      api.on.inspectComponent((payload) => {
        payload.instanceData.state.push({
          type: stateType,
          key: '$notify',
          value: plugin,
        })
      })

      watch(plugin, () => {
        api.notifyComponentUpdate()
      })
    }
  )
}
