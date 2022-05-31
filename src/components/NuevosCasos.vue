<script setup lang="ts">
import cubeApi from '@/cube'
import { ResultSet, PivotConfig } from '@cubejs-client/core'
import { QueryBuilder } from '@cubejs-client/vue3'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})
const titulo = 'Nuevos casos y promedio de los últimos 7 días'
const totalNuevosCasosHSI = {
  measures: ['casosCovidPromSem.cantidadXDia', 'casosCovidPromSem.promedioSemanal'],
  timeDimensions: [
    {
      dimension: 'casosCovidPromSem.Fecha_inicio_Conf',
      granularity: 'day',
      dateRange: 'last 360 days',
      //      dateRange: [`${fechaInicio}`, `${fechaFin}`],
    },
  ],
  order: {},
}

const totalNuevosCasosSNVS = {
  measures: ['casosCovidPromSem.cantidadXDiaSNVS', 'casosCovidPromSem.promedioSemanalSNVS'],
  timeDimensions: [
    {
      dimension: 'casosCovidPromSem.Fecha_inicio_Conf',
      granularity: 'day',
      dateRange: 'last 360 days',
      //      dateRange: [`${fechaInicio}`, `${fechaFin}`],
    },
  ],
  order: {},
}

const getTotalNuevosCasos = () => {
  switch (props.dataSource) {
    case 'hsi':
      return totalNuevosCasosHSI
    case 'snvs':
      return totalNuevosCasosSNVS
  }
}

const getSeriesLineName = () => {
  switch (props.dataSource) {
    case 'hsi':
      return '  Promedio Sem.'
    case 'snvs':
      return '  Promedio Sem. SNVS'
  }
}

const getSeriesBarName = () => {
  switch (props.dataSource) {
    case 'hsi':
      return '  Casos Diarios'
    case 'snvs':
      return '  Casos Diarios SNVS'
  }
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
  <query-builder :cubejs-api="cubeApi" :query="getTotalNuevosCasos()">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <Spinner />
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <GraficoBarLine
          :series-line="getSeries(resultSet, getSeriesLineName(), pivotConfig)[0]"
          :series-bar="getSeries(resultSet, getSeriesBarName(), pivotConfig)[0]"
          :etiquetas="resultSet.chartPivot(pivotConfig).map((row) => row.x)"
          :titulo="titulo"
          :colorTheme="getThemeByDataSource(props.dataSource)"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
