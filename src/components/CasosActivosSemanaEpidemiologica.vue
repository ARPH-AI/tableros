<script setup lang="ts">
import cubeApi from '@/cube'
import { flattenColumns, getDisplayedColumns, keepProps, filterIncludes } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'
import { format, addYears } from 'date-fns'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
  enfermedad: { type: String, default: 'Covid19' },
})

const dateFormat = 'yyyy-MM-dd'
const todayDate = new Date()
const today = format(todayDate, dateFormat)
const oneYear = format(addYears(todayDate, -1), dateFormat)

const titulo = 'Casos activos por Semana Epidemiológica'

const e = props.enfermedad == 'Covid19' ? 'Covid' : props.enfermedad
const casosPromSemSNVS = `casos${e}PromSemSNVS`

const getKeys = {
  hsiCovid19: [
    'casos.semana',
    'Confirmado,casos.identificador',
    'Sospecha,casos.identificador',
  ],
  hsiDengue: [
    'casos.semana',
    'Confirmado,casos.identificador',
    'Sospecha,casos.identificador',
    'Grave,casos.identificador',
    'Otro,casos.identificador',
  ],
  snvsCovid19: [
    `${casosPromSemSNVS}.nombre_semana`,
    `${casosPromSemSNVS}.cantidadXDiaSNVS`,
  ],
  snvsDengue: [
    `${casosPromSemSNVS}.nombre_semana`,
    `${casosPromSemSNVS}.cantidadXDiaSNVS`,
  ],
}

const getKeysColumnas = {
  hsiCovid19: [
    'Semana',
    'Confirmado',
    'Sospecha',
  ],
  hsiDengue: [
    'Semana',
    'Confirmado',
    'Sospecha',
    'Grave',
    'Otro'
  ],
  snvsCovid19: [
    'Nombre Semana',
    'Casos Diarios SNVS',
  ],
  snvsDengue: [
    'Nombre Semana',
    'Casos Diarios SNVS',
  ],
}

const totalCasosSNVS = {
  measures: [`${casosPromSemSNVS}.cantidadXDiaSNVS`],
  timeDimensions: [],
  order: {
    //    'casosCovidPromSem.cantidadXDiaSNVS': 'desc',
    [`${casosPromSemSNVS}.anio`]: 'desc',
    [`${casosPromSemSNVS}.numero_semana`]: 'desc',
  },
  filters: [
    {
      member: `${casosPromSemSNVS}.Fecha_inicio_Conf`,
      operator: 'inDateRange',
      values: [oneYear, today],
    },
  ],
  dimensions: [`${casosPromSemSNVS}.nombre_semana`, `${casosPromSemSNVS}.anio`, `${casosPromSemSNVS}.numero_semana`],
}

const totalCasosHSI = {
  measures: ['casos.identificador'],
  filters: [
    {
      member: 'casos.fecha_inicio',
      operator: 'inDateRange',
      values: [oneYear, today],
    },
    {
      member: 'casos.enfermedad',
      operator: 'equals',
      values: [props.enfermedad],
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
  x: [`${casosPromSemSNVS}.nombre_semana`],
  y: [`${casosPromSemSNVS}.cantidadXDiaSNVS`],
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

const resultSet = await cubeApi.load(getTotalCasosActivos())
const tablePivot = await resultSet.tablePivot(getPivotConfig())
const datos = keepProps(tablePivot, getKeys[`${props.dataSource}${props.enfermedad}`])
const tableColumns = await resultSet.tableColumns(getPivotConfig())
const titulosColumnas = filterIncludes(flattenColumns(tableColumns), getKeysColumnas[`${props.dataSource}${props.enfermedad}`])
const titulosMostrados = filterIncludes(getDisplayedColumns(tableColumns), getKeys[`${props.dataSource}${props.enfermedad}`])
</script>

<template>
  <KeepAlive>
    <Suspense>
      <template #fallback>
        <BaseTableSkeleton
          styles="sm:h-[38vh] xl:h-[55vh] 2xl:h-[60vh]"
          :color-theme="getThemeByDataSource(props.dataSource)"
        ></BaseTableSkeleton>
      </template>
      <TableCard
        table-dimensions="sm:h-[38vh] xl:h-[45vh] 2xl:h-[52vh]"
        :color-theme="getThemeByDataSource(props.dataSource)"
        :datos="datos"
        :titulo="titulo"
        :titulos-columnas="titulosColumnas"
        :titulos-mostrados="titulosMostrados"
      />
    </Suspense>
  </KeepAlive>
</template>

<style scoped></style>
