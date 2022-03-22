<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import GraficoBar from '@/components/GraficoBar.vue'

const titulo = 'Casos por edad por semana epidemiológica'

const totalCasos = {
  measures: ['CovidEdadSexoSNVS.id_evento_caso'],
  timeDimensions: [
    {
      dimension: 'CovidEdadSexoSNVS.Fecha_apertura',
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
