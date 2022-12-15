import { TrendingUpIcon, MapIcon, UserGroupIcon, HomeIcon } from '@heroicons/vue/outline'

export const sections = {
  SITUACION_ACTUAL: {
    key: 'eno-seccion-situacion-actual',
    title: 'Situacion actual',
    iconComponent: TrendingUpIcon,
    content:
      'En la  primera sección se incluyen indicadores que brindan en una mirada sucinta y general la situación actual de la notificación del caso (tanto por HSI para los efectores que nuclea, cómo por SNVS).',
  },
  CARACTERIZACION: {
    key: 'eno-seccion-caracterizacion',
    title: 'Caracterizacion',
    iconComponent: UserGroupIcon,
    content:
      'Se utilizaron los datos estructurados de la HSI: fecha de nacimiento, fecha de la consulta y sexo y se elaboraron indicadores significativos que sintetizan la progresión de ENOs por grupos de edad y sexo. Encuanto a la sección de comorbilidades se busca hacer foco en el análisis de un grupo poblacional relevante para Covid 19 y que desde la HSI se puede identificar en forma temprana',
  },
  GEO: {
    key: 'eno-seccion-distribucion-espacial',
    title: 'Geo',
    iconComponent: MapIcon,
    content:
      'Se elaboraron mapas considerando la residencia de las personas (tomando el dato de dirección de la HSI) para identificación de clusters de casos activos registrados en la HSI. Para los datos de SNVS al no contar con el posicionamiento de la persona se definió utilizar la localidad mínima qué contiene el set de datos.',
  },
}

export const data_sources = {
  HSI: {
    key: 'hsi',
    title: 'Historia Clínica Electrónica',
    content:
      'Desde la HSI se relevan datos de posibles eventos registrados en campos estructurados codificados con SNOMED CT, ya sean síntomas (para el caso de la vigilancia sindrómica) cómo diagnósticos que registra el personal de salud en la HSI.',
  },
  SNVS: {
    key: 'snvs',
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
  },
  DENGUE: {
    key: 'dengue',
    title: 'Dengue',
    fuente_datos: [data_sources.HSI],
  },
}
