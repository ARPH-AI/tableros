import { sections } from '@/constants'
import CasosActivosSemanaEpidemiologicaVue from '@/components/CasosActivosSemanaEpidemiologica.vue'

export const data_sources = {
  HSI: {
    key: 'HSI',
    title: 'Historia Clínica Electrónica',
    content:
      'Desde la HSI se relevan datos de posibles eventos registrados en campos estructurados codificados con SNOMED CT, ya sean síntomas (para el caso de la vigilancia sindrómica) cómo diagnósticos que registra el personal de salud en la HSI.',
  },
  SNVS: {
    key: 'SNVS',
    title: 'Sistema Nacional de Vigilancia en Salud',
    content:
      'En la solapa identificada cómo SNVS se visualizan los casos notificados al sistema. Actualmente no se cuenta con vínculo de transmisión de información entre ambos sistemas.',
  },
}

export const enos = {
  COVID: {
    key: 'covid',
    title: 'COVID-19',
    fuente_datos: [data_sources.HSI, data_sources.SNVS],
    main_page: 'seccion-situacion-actual',
    componentes: {
      situacion_actual: [],
      caracterizacion: [],
      geo: [],
    },
    mainComponent: CasosActivosSemanaEpidemiologicaVue,
  },
  DENGUE: {
    key: 'dengue',
    title: 'Dengue',
    fuente_datos: [data_sources.HSI],
    main_page: 'seccion-situacion-actual',
    secciones: [sections.SITUACION_ACTUAL, sections.CARACTERIZACION],
    componentes: {
      situacion_actual: [],
      caracterizacion: [],
    },
    mainComponent: CasosActivosSemanaEpidemiologicaVue,
  },
}

export const enos_array = [
  {
    key: 'covid',
    title: 'COVID-19',
    fuente_datos: [data_sources.HSI, data_sources.SNVS],
    main_page: 'seccion-situacion-actual',
    componentes: {
      situacion_actual: [],
      caracterizacion: [],
      geo: [],
    },
    mainComponent: CasosActivosSemanaEpidemiologicaVue,
  },
  // {
  //   key: 'dengue',
  //   title: 'Dengue',
  //   fuente_datos: [data_sources.HSI],
  //   main_page: 'seccion-situacion-actual',
  //   secciones: [sections.SITUACION_ACTUAL, sections.CARACTERIZACION],
  //   componentes: {
  //     situacion_actual: [],
  //     caracterizacion: [],
  //   },
  //   mainComponent: CasosActivosSemanaEpidemiologicaVue,
  // },
]
