<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
// import { obtenerCantidad } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

const titulo = 'Frecuencia de comorbilidades'
const tituloX = '% de casos confirmados'
const tituloY = ''

const itemSplit = (item) => {
  item.title = item.title.split(',')[0];
  return item;
}

const totalComorbilidades = {
  measures: ['casosComorbilidad.id_comorbilidad'],
  timeDimensions: [],
  order: {
    'casosComorbilidad.id_comorbilidad': 'desc',
  },
  dimensions: ['casosComorbilidad.comorbilidad', 'casosComorbilidad.sexo'],
}
const pivotConfig = {
  x: ['casosComorbilidad.comorbilidad'],
  y: ['casosComorbilidad.sexo', 'measures'],
  fillMissingDates: true,
  joinDateRange: false,
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="totalComorbilidades">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <Spinner />
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <GraficoBar
          :color-theme="getThemeByDataSource(props.dataSource)"
          :series="resultSet.series(pivotConfig).map(itemSplit)"
          :titulo="titulo"
          :titulo-x="tituloX"
          :titulo-y="tituloY"
          :etiquetas="resultSet.chartPivot(pivotConfig).map((row) => row.x)"
        />
      </div>
    </template>
  </query-builder>
</template>
