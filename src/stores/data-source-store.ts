import { defineStore } from 'pinia'

export const useDataSourceStore = defineStore('dataSourceStore', {
  state: () => {
    return {
      dataSource: 'hsi',
    }
  },
  getters: {
    getCurrentDataSource(state) {
      return state.dataSource
    },
    getCurrentDataSource(state) {
      return state.dataSource
    },
    actions: {
      setCurrentDataSource(state) {
        state.dataSource = state
      },
    },
  },
})
