import { defineStore } from 'pinia'
import { data_sources } from '@/data/enos/enos'

export const useDataSourceStore = defineStore('dataSourceStore', {
  state: () => ({ dataSource: 'hsi', dataSources: data_sources }),
  getters: {
    getCurrentDataSource(state) {
      return state.dataSource
    },
  },
  actions: {
    setCurrentDataSource(value: string) {
      this.dataSource = value
    },
  },
})
