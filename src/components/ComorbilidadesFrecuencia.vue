<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
// import { obtenerCantidad } from '@/cube/utils'

const titulo = 'Frecuencia de comorbilidades'
const tituloX = '% de casos confirmados'
const tituloY = 'Comorbilidades'

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
          :series="resultSet.series(pivotConfig)"
          :titulo="titulo"
          :titulo-x="tituloX"
          :titulo-y="tituloY"
          :etiquetas="resultSet.chartPivot(pivotConfig).map((row) => row.x)"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
