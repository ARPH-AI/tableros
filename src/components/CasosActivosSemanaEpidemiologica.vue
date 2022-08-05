<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { flattenColumns, getDisplayedColumns } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

// const fechaInicio = '2021-01-01' //fecha fija
// const fechaFin = '2022-06-06' //hoy
const titulo = 'Casos activos por Semana Epidemiológica'

const totalCasosSNVS = {
  measures: ['casosCovidPromSem.cantidadXDiaSNVS'],
  timeDimensions: [],
  order: {
    'casosCovidPromSem.numero_semana': 'desc',
  },
  filters: [],
  dimensions: ['casosCovidPromSem.nombre_semana'],
}

const totalCasosHSI = {
  measures: ['casos.identificador'],
  timeDimensions: [
    {
      dimension: 'casos.inicio_covid',
    },
  ],
  order: {
    'casos.semana': 'desc',
  },
  dimensions: ['casos.semana', 'casos.variable'],
}

const pivotConfig = {
  x: ['casos.semana'],
  y: ['casos.variable', 'measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const getTotalCasosActivos = () => {
  switch (props.dataSource) {
    case 'hsi':
      return totalCasosHSI
    case 'snvs':
      return totalCasosSNVS
  }
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="getTotalCasosActivos()">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <BaseTableSkeleton
          styles="sm:h-[38vh] xl:h-[49vh] 2xl:h-[60vh]"
          :color-theme="getThemeByDataSource(props.dataSource)"
        ></BaseTableSkeleton>
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <TableCard
          :color-theme="getThemeByDataSource(props.dataSource)"
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
