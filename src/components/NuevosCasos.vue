<script setup lang="ts">
import cubeApi from '@/cube'
import { ResultSet, PivotConfig } from '@cubejs-client/core'
import { QueryBuilder } from '@cubejs-client/vue3'
import GraficoBarLine from '@/components/GraficoBarLine.vue'

const fechaInicio = '2021-01-01' //fecha fija
const fechaFin = '2022-06-06' //hoy
const titulo = 'Nuevos casos y promedio de los últimos 7 días'
const totalCasos = {
  measures: ['casosCovidPromSem.cantidadXDia', 'casosCovidPromSem.promedioSemanal'],
  timeDimensions: [
    {
      dimension: 'casosCovidPromSem.Fecha_inicio_Conf',
      granularity: 'day',
      dateRange: [`${fechaInicio}`, `${fechaFin}`],
    },
  ],
  order: {},
}

const pivotConfig = {
  x: ['casosCovidPromSem.Fecha_inicio_Conf.day'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const getSeries = (result: ResultSet, filterStr: string, pivot: PivotConfig) => {
  return result
    .series(pivot)
    .filter((item: any) => item.title == filterStr)
    .map((item: any) => item.series.map(({ value }: any) => value))
}

// Mejorar enviando no un str sino un fitlerFn
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="totalCasos">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="loading">Loading...</div>
      <div v-if="!loading && resultSet !== undefined">
        <GraficoBarLine
          :series-line="getSeries(resultSet, '  Promedio Sem.', pivotConfig)[0]"
          :series-bar="getSeries(resultSet, '  Casos Diarios', pivotConfig)[0]"
          :etiquetas="resultSet.chartPivot(pivotConfig).map((row) => row.x)"
          :titulo="titulo"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
