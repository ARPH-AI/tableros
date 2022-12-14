import { enos } from '@/data/enos/enos'
import { defineStore } from 'pinia'
import { data_sources } from '@/data/enos/enos'

interface DATA_SOURCE {
  label: string
  key: string
  title: string
  content: string
}

interface ENO {
  key: string
  title: string
  fuente_datos: DATA_SOURCE[]
  main_page: string
  componentes: {
    situacion_actual: string
    caracterizacion: string
    geo: string
  }
  mainComponent: string
}

const default_eno: ENO = {
  key: 'default',
  title: 'Default',
  fuente_datos: [],
  main_page: 'seccion-situacion-actual',
  componentes: {
    situacion_actual: '',
    caracterizacion: '',
    geo: '',
  },
  mainComponent: ''
}

export const useEnosStore = defineStore('enosStore', {
  state: () => {
    return {
      current_eno: '',
      enos_data: enos,
      current_eno_data: default_eno,
    }
  },
  getters: {
    getCurrentEno(state) {
      return state.current_eno
    },
    getCurrentEnoDataSources(state) {
      if (state.current_eno !== '') {
        return enos.find((eno) => eno.key === state.current_eno)?.fuente_datos
      } else {
        return data_sources
      }
    },
    getCurrentEnoData(state) {
      return state.current_eno_data
    }
  },
  actions: {
    setCurrentEno(state: { current_eno: any }) {
      state.current_eno = state
    },
    updateEnosDataBySource(source: string) {
      const newData = enos.filter((eno) => eno.fuente_datos.some((s) => s.key === source))
      this.enos_data = newData
    },
    setCurrentEnoString(value: string) {
      this.current_eno = value
    },
    setCurrentEnoData(eno: ENO) {
      this.current_eno_data = eno
    },
  },
})
