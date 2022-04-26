<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'

const titulo = 'Nuevos casos por grupo de edad'
const tituloX = 'Semana Epidemiológica'
const tituloY = 'Casos'
const totalCasos = {
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
const pivotConfig = {
  x: ['CovidEdadSexo.Fecha_inicio.day'],
  y: ['CovidEdadSexo.Grupo_edad', 'measures'],
  fillMissingDates: true,
  joinDateRange: false,
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="totalCasos">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <Spinner />
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <GraficoStackedLines
          :series="resultSet.series(pivotConfig).slice(1)"
          :titulo="titulo"
          :titulo-y="tituloY"
          :titulo-x="tituloX"
          :etiquetas="resultSet.chartPivot(pivotConfig).map((row) => row.x)"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
