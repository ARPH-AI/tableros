<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import TableCard from '@/components/TableCard.vue'
import { flattenColumns, getDisplayedColumns } from '@/cube/utils'

const fechaInicio = '2021-01-01' //fecha fija
const fechaFin = '2022-06-06' //hoy
const titulo = 'Casos activos por Semana Epidemiológica'
const totalCasos = {
  measures: ['casosCovidPromSem.cantidadXDiaSNVS'],
  timeDimensions: [],
  order: {
    'casosCovidPromSem.numero_semana': 'desc',
  },
  filters: [],
  dimensions: ['casosCovidPromSem.nombre_semana'],
  limit: 2,
}

const pivotConfig = {
  x: ['casos.semana'],
  y: ['casos.variable', 'measures'],
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
