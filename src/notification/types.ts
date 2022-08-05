export interface NotifyData {
  text: string
  time?: number
}

export interface NotifyOptions {
  show: boolean
  type: string
  data: NotifyData
}

export interface NotifyPlugin {
  show: boolean
  showNotify: (options: NotifyOptions) => void
  hideNotify: () => void
}
