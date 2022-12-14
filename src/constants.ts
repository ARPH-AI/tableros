import { TrendingUpIcon, MapIcon, UserGroupIcon, HomeIcon, SearchIcon, ViewGridIcon } from '@heroicons/vue/outline'

export const sections = {
  SITUACION_ACTUAL: {
    key: 'seccion-situacion-actual',
    title: 'Situacion actual',
    iconComponent: TrendingUpIcon,
    content:
      'En la  primera sección se incluyen indicadores que brindan en una mirada sucinta y general la situación actual de la notificación del caso (tanto por HSI para los efectores que nuclea, cómo por SNVS).',
  },
  CARACTERIZACION: {
    key: 'seccion-caracterizacion',
    title: 'Caracterizacion',
    iconComponent: UserGroupIcon,
    content:
      'Se utilizaron los datos estructurados de la HSI: fecha de nacimiento, fecha de la consulta y sexo y se elaboraron indicadores significativos que sintetizan la progresión de ENOs por grupos de edad y sexo. Encuanto a la sección de comorbilidades se busca hacer foco en el análisis de un grupo poblacional relevante para Covid 19 y que desde la HSI se puede identificar en forma temprana',
  },
  GEO: {
    key: 'seccion-distribucion-espacial',
    title: 'Geo',
    iconComponent: MapIcon,
    content:
      'Se elaboraron mapas considerando la residencia de las personas (tomando el dato de dirección de la HSI) para identificación de clusters de casos activos registrados en la HSI. Para los datos de SNVS al no contar con el posicionamiento de la persona se definió utilizar la localidad mínima qué contiene el set de datos.',
  },
}

export const general_sections = {
  INFORMACION: {
    key: 'seccion-sobre-el-tablero',
    value: 1,
    title: 'Tablero epidemiologico',
  },
  HOME: {
    key: 'home',
    value: 0,
    title: 'Home',
    iconComponent: HomeIcon,
  },
}

export const main_axis = [
  {
    label: 'VIGILANCIA_SINDROMICA',
    key: 'vigilancia-sindromica',
    title: 'Vigilancia sindrómica',
    iconComponent: SearchIcon,
    description:
      'Se utiliza la HCE como fuente principal y se recabaron señales de posibles eventos. En este caso y a partir de campos estructurados y terminología SNOMED CT se incluyen las consultas febriles clasificadas en respiratorias y otras. Dentro de esta sección encontraremos las distintas señales  representadas en gráficos.',
  },
  {
    label: 'ENOS',
    key: 'enos',
    title: 'Enfermedades de Notificación Obligatoria',
    iconComponent: ViewGridIcon,
    description:
      'La información se encuentra organizada a partir de 2 fuentes principales: Historia Clinica Electronica y Sistema Nacional de Vigilancia en Salud, de las cuales características epidemiológicas relevantes relacionadas con persona, lugar y tiempo, creando entonces 3 sub-secciones, accesibles desde el menú lateral del tablero.  En situación actual se incluyen indicadores que brindan en una mirada sucinta y general la situación actual de los eventos o casos, incluyendo los datos de atención ambulatoria en la sección de fuente HCE. En la sección de mapas se presenta uno con la georreferenciación de la residencia de las personas (tomando el dato de dirección registrada en el sistema) mientras que para los datos de SNVS,  se cuantifican los eventos para una localidad mínima que contiene el set de datos. En la sección caracterización, se utilizan datos estructurados de edad y sexo y comorbilidades',
  },
]
