<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
// import { obtenerCantidad } from '@/cube/utils'
import GraficoBar from '@/components/GraficoBar.vue'

const titulo = 'Casos confirmados acumulados por presencia de las principales comorbilidades'

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
      <div v-if="loading" class="loading">Loading...</div>
      <div v-if="!loading && resultSet !== undefined">
        <GraficoBar
          :series="resultSet.series(pivotConfig)"
          :titulo="titulo"
          :etiquetas="resultSet.chartPivot(pivotConfig).map((row) => row.x)"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
