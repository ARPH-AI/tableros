import { sections } from '@/constants'

export const data_sources = {
  HSI: {
    label: 'HSI',
    key: 'hsi',
    title: 'Historia Clínica Electrónica',
    content:
      'Desde la HSI se relevan datos de posibles eventos registrados en campos estructurados codificados con SNOMED CT, ya sean síntomas (para el caso de la vigilancia sindrómica) cómo diagnósticos que registra el personal de salud en la HSI.',
  },
  SNVS: {
    label: 'SNVS',
    key: 'snvs',
    title: 'Sistema Nacional de Vigilancia en Salud',
    content:
      'En la solapa identificada cómo SNVS se visualizan los casos notificados al sistema. Actualmente no se cuenta con vínculo de transmisión de información entre ambos sistemas.',
  },
}

export const enos = [
  {
    key: 'covid',
    title: 'COVID-19',
    fuente_datos: [data_sources.HSI, data_sources.SNVS],
    main_page: 'seccion-situacion-actual',
    secciones: [sections.SITUACION_ACTUAL, sections.CARACTERIZACION, sections.GEO],
    componentes: {
      situacion_actual: `SituacionActualCovid`,
      caracterizacion: `CaracterizacionCovid`,
      geo: `GeoCovid`,
    },
    mainComponent: `CasosActivosSemanaEpidemiologica`,
  },
  {
    key: 'dengue',
    title: 'Dengue',
    fuente_datos: [data_sources.HSI, data_sources.SNVS],
    main_page: 'seccion-situacion-actual',
    secciones: [sections.SITUACION_ACTUAL, sections.CARACTERIZACION, sections.GEO],
    componentes: {
      situacion_actual: `SituacionActualCovid`,
      caracterizacion: `CaracterizacionCovid`,
      geo: `GeoCovid`,
    },
    mainComponent: `CasosActivosSemanaEpidemiologica`,
  },
  {
    key: 'fiebre_ama',
    title: 'Fiebre Amarilla',
    fuente_datos: [data_sources.HSI],
    main_page: 'seccion-situacion-actual',
    secciones: [sections.SITUACION_ACTUAL, sections.CARACTERIZACION],
    componentes: {
      situacion_actual: `SituacionActualCovid`,
      caracterizacion: `CaracterizacionCovid`,
    },
    mainComponent: `CasosActivosSemanaEpidemiologica`,
  },
]
