import { defineStore } from 'pinia'
import { main_axis, sections } from '@/constants'

const queue: string[] = []
const section_ls = Object.entries(sections)
const section_keys = section_ls.map((axis) => axis[1].key)
const main_axis_keys = main_axis.map((axis): string => axis.key)

export const useSectionsStore = defineStore('sectionsStore', {
  state: () => ({
    currentSection: 'home',
    sectionsData: main_axis,
    axisTitle: '',
    sectionTitle: '',
    pageTitle: '',
    previousTitle: queue,
  }),
  getters: {
    getCurrentSection(state) {
      return state.currentSection
    },
    getAxis(state) {
      return state.sectionsData
    },
    getSectionTitle(state) {
      return state.sectionTitle
    },
    getAxisTitle(state) {
      return state.axisTitle
    },
    getPageTitle(state) {
      return state.pageTitle
    },
  },
  actions: {
    setCurrentSection(value: string) {
      this.currentSection = value
    },
    setSectionTitle(value: string) {
      this.previousTitle.push(value)
      this.sectionTitle = value
    },
    setPreviuosTitle(queue: string[]) {
      this.previousTitle = queue
    },
    popTitle() {
      this.previousTitle.pop()
      this.sectionTitle = this.previousTitle[this.previousTitle.length - 1]
    },
    setAxisTitle(value: string) {
      if (section_keys.includes(value) || value === '') {
        this.axisTitle = value
      }
      if (main_axis_keys.includes(value) || value === '') {
        this.axisTitle = ''
      }
    },
    setPageTitle(value: string) {
      this.pageTitle = value
    },
  },
})
