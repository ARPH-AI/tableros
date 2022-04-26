<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import GraficoStackedLines from '@/components/GraficoStackedLines.vue'

const titulo = 'Casos por edad por semana epidemiológica'
const tituloX = 'Semana Epidemiológica'
const tituloY = 'Casos'
const totalCasos = {
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
const pivotConfig = {
  x: ['CovidEdadSexoSNVS.Fecha_apertura.day'],
  y: ['CovidEdadSexoSNVS.Grupo_edad', 'measures'],
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
