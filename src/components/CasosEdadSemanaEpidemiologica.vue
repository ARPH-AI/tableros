<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import GraficoBar from '@/components/GraficoBar.vue'

const titulo = 'Casos por edad por semana epidemiológica'

const totalCasos = {
  measures: ['CovidEdadSexo.identificador'],
  timeDimensions: [
    {
      dimension: 'CovidEdadSexo.Fecha_inicio',
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
      <div v-if="loading" class="loading">Loading...</div>
      <div v-if="!loading && resultSet !== undefined">
        <GraficoBar
          :series="resultSet.series(pivotConfig).slice(1)"
          :titulo="titulo"
          :etiquetas="resultSet.chartPivot(pivotConfig).map((row) => row.x)"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
