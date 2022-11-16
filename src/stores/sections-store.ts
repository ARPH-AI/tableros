import { defineStore } from 'pinia'
import { main_axis } from '@/constants'

export const useSectionsStore = defineStore('sectionsStore', {
  state: () => {
    return {
      currentSection: 'enos',
    }
  },
  getters: {
    getCurrentSection(state) {
      return state.currentSection
    },
    actions: {
      setCurrentSection(state) {
        state.currentSection = state
      },
    },
  },
})
