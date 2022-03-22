<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import TableCard from '@/components/TableCard.vue'
import { flattenColumns, getDisplayedColumns } from '@/cube/utils'

const fechaInicio = '2021-01-01' //fecha fija
const fechaFin = '2021-09-09' //hoy
const titulo = 'Total de casos activos por lugar de residencia'

const totalCasos = {
  measures: ['CovidEdadSexoSNVS.id_evento_caso'],

  order: {
    'CovidEdadSexoSNVS.id_evento_caso': 'desc',
  },
  filters: [
    {
      member: 'CovidEdadSexoSNVS.Fecha_apertura',
      operator: 'equals',
      values: [`${fechaFin}`],
    },
  ],
  dimensions: ['CovidEdadSexoSNVS.Ciudad'],
}

const pivotConfig = {
  x: ['CovidEdadSexoSNVS.Ciudad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="totalCasos">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="loading">Loading...</div>
      <div v-if="!loading && resultSet !== undefined">
        <TableCard
          :datos="resultSet.tablePivot(pivotConfig)"
          :titulo="titulo"
          :titulos-columnas="flattenColumns(resultSet.tableColumns(pivotConfig))"
          :titulos-mostrados="getDisplayedColumns(resultSet.tableColumns(pivotConfig))"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
