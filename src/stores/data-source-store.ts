import { defineStore } from 'pinia'

export const useDataSourceStore = defineStore('dataSourceStore', {
  state: () => ({ dataSource: 'hsi' }),
  getters: {
    getCurrentDataSource(state) {
      return state.dataSource
    },
  },
  actions: {
    setCurrentDataSource(state) {
      state.dataSource = state
    },
  },
})
