import { defineStore } from 'pinia'
import { main_axis } from '@/constants'

export const useSectionsStore = defineStore('sectionsStore', {
  state: () => {
    return {
      current_section: main_axis.VIGILANCIA_SINDROMICA.key,
    }
  },
  getters: {
    getCurrentSection(state) {
      return state.current_section
    },
    actions: {
      setCurrentSection(state) {
        state.current_section = state
      },
    },
  },
})
