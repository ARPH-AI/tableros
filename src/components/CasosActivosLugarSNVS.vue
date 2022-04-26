<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import TableCard from '@/components/TableCard.vue'
import { flattenColumns, getDisplayedColumns } from '@/cube/utils'
import { format } from 'date-fns'

const date = format(new Date(), 'yyyy-MM-dd')
//const date = '2021-09-09' Donde hay actualmente
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
      values: [`${date}`],
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
