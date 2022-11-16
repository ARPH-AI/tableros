import { defineStore } from 'pinia'

export const useEnosStore = defineStore('enosStore', {
  state: () => {
    return {
      current_eno: 'covid',
    }
  },
  getters: {
    getCurrentEno(state) {
      return state.current_eno
    },
  },
  actions: {
    setCurrentEno(state) {
      state.current_eno = state
    },
  },
})
