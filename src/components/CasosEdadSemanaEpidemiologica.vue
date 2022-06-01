<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

const titulo = 'Nuevos casos por grupo de edad'
const tituloX = 'Semana Epidemiológica'
const tituloY = 'Casos'
const totalCasosHSI = {
  measures: ['CovidEdadSexo.identificador'],
  timeDimensions: [
    {
      dimension: 'CovidEdadSexo.Fecha_inicio',
      //      dateRange: 'last 360 days',
    },
  ],
  order: {
    'CovidEdadSexo.Numero_semana': 'asc',
    'CovidEdadSexo.Grupo_edad': 'asc',
  },
  dimensions: ['CovidEdadSexo.Numero_semana', 'CovidEdadSexo.Grupo_edad'],
}
const totalCasosSNVS = {
  measures: ['CovidEdadSexoSNVS.id_evento_caso'],
  timeDimensions: [
    {
      dimension: 'CovidEdadSexoSNVS.Fecha_apertura',
      //      dateRange: 'last 360 days',
    },
  ],
  order: {
    'CovidEdadSexoSNVS.Numero_semana_snvs': 'asc',
    'CovidEdadSexoSNVS.Grupo_edad': 'asc',
  },
  dimensions: ['CovidEdadSexoSNVS.Numero_semana_snvs', 'CovidEdadSexoSNVS.Grupo_edad'],
}

// const pivotConfigHSI = {
//   x: ['CovidEdadSexo.Fecha_inicio.day'],
//   y: ['CovidEdadSexo.Grupo_edad', 'measures'],
//   fillMissingDates: true,
//   joinDateRange: false,
// }

// const pivotConfigSNVS = {
//   x: ['CovidEdadSexoSNVS.Fecha_apertura.day'],
//   y: ['CovidEdadSexoSNVS.Grupo_edad', 'measures'],
//   fillMissingDates: true,
//   joinDateRange: false,
// }

const getTotalCasos = () => {
  switch (props.dataSource) {
    case 'hsi':
      return totalCasosHSI
    case 'snvs':
      return totalCasosSNVS
  }
}

const getHardcodedTags = ['1', '2', ...'53']

const getHardcodedSeries = [
  {
    data: [
      2, 3, 8, 10, 24, 68, 59, 60, 36, 43, 23, 19, 10, 89, 94, 12, 25, 68, 18, 45, 67, 358, 324, 338, 390, 450, 432,
      401, 389, 373, 369, 340, 320, 376, 350, 301, 270, 229, 178, 165, 152, 147, 130, 122, 108, 97, 67, 102, 104, 145,
      260, 105,
    ],
    name: 'Niños 0 a 9',
    type: 'line',
    color: '#00becb',
    showSymbol: false,
  },
  {
    data: [
      31, 25, 67, 124, 98, 78, 59, 42, 42, 32, 31, 95, 44, 89, 14, 73, 55, 78, 69, 49, 69, 31, 39, 33, 47, 25, 93, 94,
      98, 91, 96, 39, 22, 76, 70, 87, 70, 89, 55, 99, 52, 47, 30, 42, 58, 67, 67, 20, 34, 25, 60, 80,
    ],
    name: 'Adolescentes 10 a 19',
    type: 'line',
    color: '#53c07a',
    showSymbol: false,
  },
  {
    data: [
      1, 45, 17, 14, 18, 27, 59, 53, 56, 32, 31, 25, 24, 18, 19, 17, 15, 20, 29, 29, 36, 31, 39, 38, 47, 45, 43, 44, 38,
      31, 36, 39, 22, 27, 37, 30, 27, 28, 55, 99, 52, 14, 13, 72, 28, 19, 17, 22, 34, 24, 16, 8,
    ],
    name: 'Jóvenes 20 a 24',
    type: 'line',
    color: '#c2ab1a',
    showSymbol: false,
  },
  {
    data: [
      31, 25, 67, 124, 198, 238, 449, 430, 456, 332, 331, 295, 204, 189, 194, 173, 155, 208, 209, 249, 369, 318, 394,
      338, 470, 450, 432, 441, 389, 313, 369, 390, 220, 276, 370, 301, 270, 289, 155, 199, 152, 147, 130, 172, 208, 197,
      167, 202, 304, 245, 160, 80,
    ],
    name: 'Adultos 25 a 60',
    type: 'line',
    color: '#f7931e',
    showSymbol: false,
  },
  {
    data: [
      31, 25, 67, 124, 198, 278, 459, 530, 556, 332, 331, 295, 204, 189, 194, 173, 155, 13, 25, 107, 124, 198, 178, 159,
      130, 156, 132, 131, 195, 370, 301, 270, 289, 155, 199, 152, 147, 130, 172, 208, 197, 167, 202, 304, 245, 160, 80,
      301, 270, 289, 155, 199,
    ],
    name: 'Mayores de 60',
    type: 'line',
    color: '#ed1c24',
    showSymbol: false,
  },
]
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="getTotalCasos()">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <Spinner />
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <!-- <GraficoStackedLines
          :series="resultSet.series(pivotConfigHSI).slice(1)"
          :titulo="titulo"
          :titulo-y="tituloY"
          :titulo-x="tituloX"
          :etiquetas="resultSet.chartPivot(pivotConfigHSI).map((row) => row.x)"
        /> -->
        <GraficoStackedLines
          :color-theme="getThemeByDataSource(props.dataSource)"
          :series="getHardcodedSeries"
          :titulo="titulo"
          :titulo-y="tituloY"
          :titulo-x="tituloX"
          :etiquetas="getHardcodedTags"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
