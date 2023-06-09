<script setup lang="ts">
import cubeApi from '@/cube'
import { ResultSet, PivotConfig } from '@cubejs-client/core'
import { QueryBuilder } from '@cubejs-client/vue3'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
  enfermedad: { type: String, default: 'Covid19' },
  chartHeight: { type: String, default: 'sm:h-[38vh] xl:h-[47vh] 2xl:h-[54vh]' },
})

const e = props.enfermedad == 'Covid19' ? 'Covid' : props.enfermedad
const titulo = 'Nuevos casos y promedio de los últimos 7 días'

const casosEnfermedad = `casos${e}PromSem`
const totalNuevosCasosHSI = {
  measures: [`${casosEnfermedad}.cantidadXDia`, `${casosEnfermedad}.promedioSemanal`],
  timeDimensions: [
    {
      dimension: `${casosEnfermedad}.Fecha_inicio_Conf`,
      granularity: 'day',
      dateRange: 'last 360 days',
      //      dateRange: [`${fechaInicio}`, `${fechaFin}`],
    },
  ],
  order: {},
}

const totalNuevosCasosSNVS = {
  measures: [`${casosEnfermedad}SNVS.cantidadXDiaSNVS`, `${casosEnfermedad}SNVS.promedioSemanalSNVS`],
  timeDimensions: [
    {
      dimension: `${casosEnfermedad}SNVS.Fecha_inicio_Conf`,
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
  x: [`${casosEnfermedad}.Fecha_inicio_Conf.day`],
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
        <BaseGraphSkeleton
          height="sm:h-[38vh] xl:h-[55vh] 2xl:h-[60vh]"
          :color-theme="getThemeByDataSource(props.dataSource)"
        />
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <base-visualizacion :titulo="titulo" :color-theme="getThemeByDataSource(props.dataSource)">
          <GraficoBarLine
            chart-height="sm:h-[38vh] xl:h-[47vh] 2xl:h-[54vh]"
            :series-line="getSeries(resultSet, getSeriesLineName() || 'Promedio Sem.', pivotConfig)[0]"
            :series-bar="getSeries(resultSet, getSeriesBarName() || 'Promedio Sem.', pivotConfig)[0]"
            :etiquetas="resultSet.chartPivot(pivotConfig).map((row) => row.x)"
        /></base-visualizacion>
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
