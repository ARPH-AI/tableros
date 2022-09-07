<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { flattenColumns, getDisplayedColumns, keepProps, filterIncludes } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'
import { format, addYears } from 'date-fns'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

const dateFormat = 'yyyy-MM-dd'
const todayDate = new Date()
const today = format(todayDate, dateFormat)
const oneYear = format(addYears(todayDate, -1), dateFormat)

const titulo = 'Casos activos por Semana Epidemiológica'

const totalCasosSNVS = {
  measures: ['casosCovidPromSem.cantidadXDiaSNVS'],
  timeDimensions: [],
  order: {
    //    'casosCovidPromSem.cantidadXDiaSNVS': 'desc',
    'casosCovidPromSem.anio': 'desc',
    'casosCovidPromSem.numero_semana': 'desc',
  },
  filters: [
    {
      member: 'casosCovidPromSem.Fecha_inicio_Conf',
      operator: 'inDateRange',
      values: [oneYear, today],
    },
  ],
  dimensions: ['casosCovidPromSem.nombre_semana', 'casosCovidPromSem.anio', 'casosCovidPromSem.numero_semana'],
}

const totalCasosHSI = {
  measures: ['casos.identificador'],
  filters: [
    {
      member: 'casos.inicio_covid',
      operator: 'inDateRange',
      values: [oneYear, today],
    },
  ],
  order: {
    'casos.anio': 'desc',
    'casos.numero_semana': 'desc',
  },
  dimensions: ['casos.semana', 'casos.variable', 'casos.anio', 'casos.numero_semana'],
}

const pivotConfigHSI = {
  x: ['casos.semana'],
  y: ['casos.variable', 'measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const pivotConfigSNVS = {
  x: ['casosCovidPromSem.nombre_semana'],
  y: ['casosCovidPromSem.cantidadXDiaSNVS'],
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

const getPivotConfig = () => {
  switch (props.dataSource) {
    case 'hsi':
      return pivotConfigHSI
    case 'snvs':
      return pivotConfigSNVS
  }
}

const getKeys = {
  hsi: [
    'casos.semana',
    //        "casos.anio",
    'Confirmado,casos.identificador',
    'Sospecha,casos.identificador',
  ],
  snvs: [
    'casosCovidPromSem.nombre_semana',
    //        "casosCovidPromSem.anio",
    'casosCovidPromSem.cantidadXDiaSNVS',
  ],
}

const getKeysColumnas = {
  hsi: [
    'Semana',
    //        'Anio',
    'Confirmado',
    'Sospecha',
  ],
  snvs: [
    'Nombre Semana',
    //        'Anio',
    'Casos Diarios SNVS',
  ],
}

const resultSet = await cubeApi.load(getTotalCasosActivos())
const tablePivot = await resultSet.tablePivot(getPivotConfig())

const datos = keepProps(tablePivot, getKeys[props.dataSource])

const tableColumns = await resultSet.tableColumns(getPivotConfig())

const titulosColumnas = filterIncludes(flattenColumns(tableColumns), getKeysColumnas[props.dataSource])
const titulosMostrados = filterIncludes(getDisplayedColumns(tableColumns), getKeys[props.dataSource])
</script>

<template>
  <Suspense>
    <template #fallback>
      <BaseTableSkeleton
        styles="sm:h-[38vh] xl:h-[55vh] 2xl:h-[60vh]"
        :color-theme="getThemeByDataSource(props.dataSource)"
      ></BaseTableSkeleton>
    </template>
    <template #default>
      <TableCard
        tableDimensions="sm:h-[38vh] xl:h-[43.2vh] 2xl:h-[52vh]"
        :color-theme="getThemeByDataSource(props.dataSource)"
        :datos="datos"
        :titulo="titulo"
        :titulos-columnas="titulosColumnas"
        :titulos-mostrados="titulosMostrados"
      />
    </template>
  </Suspense>
</template>

<style scoped></style>
