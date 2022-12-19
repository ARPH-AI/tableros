<script setup lang="ts">
import cubeApi from '@/cube'
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

const titulo = 'Consultas Febriles'
const tituloX = 'Semana Epidemiológica'
const tituloY = 'Casos'

const totalCasosHSI = {
  measures: ['casosFebriles.Respiratorios', 'casosFebriles.NoRespiratorios'],
  filters: [
    {
      member: 'casosFebriles.fecha',
      operator: 'inDateRange',
      values: [oneYear, today],
    },
  ],
  order: {
    'casosFebriles.anio': 'asc',
    'casosFebriles.numero_semana': 'asc',
  },
  dimensions: ['casosFebriles.anio', 'casosFebriles.numero_semana'],
}

const pivotConfigHSI = {
  x: ['casos.semana'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const totalCasosSNVS = {}
const pivotConfigSNVS = {}

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

const colors = ['#ff6c0a', '#33ccd6']

const series = resultSet.series().map(
    (item, idx) => {
        return  {
            ...item,
            itemStyle: {
                color: colors[idx],
                barBorderRadius: 3,
                opacity: 0.8
            }
        }
    }
)

let semanas = []
if (series.length) {
  semanas = series[0].series.map(({x}) => x.split(',').reverse().join(' '))
}

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
        <GraficoStackedLines
          :chart-height="
            props.dataSource == 'hsi' ? 'sm:h-[38vh] xl:h-[55vh] 2xl:h-[60vh]' : 'sm:h-[38vh] xl:h-[55vh] 2xl:h-[60vh]'"
          :color-theme="getThemeByDataSource(props.dataSource)"
          :series="series"
          :titulo="titulo"
          :titulo-y="tituloY"
          :titulo-x="tituloX"
          :etiquetas="semanas"
          chart-type="bar"
          :stacked="true"
        />
    </template>
  </Suspense>
</template>

<style scoped></style>
