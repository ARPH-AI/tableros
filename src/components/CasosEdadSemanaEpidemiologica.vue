<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
  enfermedad: { type: String, default: 'Covid19' },
  chartHeight: { type: String, default: 'sm:h-[38vh] xl:h-[47vh] 2xl:h-[54vh]' },
})

const titulo = 'Nuevos casos por grupo de edad'
const tituloX = 'Semana Epidemiológica'
const tituloY = 'Casos'

const itemSplit = (item) => {
  item.title = item.title.split(',')[0]
  return item
}

const filterV = (item) => {
  return item.title.split(',')[0] != 'v'
}

const procesaDatos = (datos, semanas) => {
  for (let i = 0; i < datos.length; i++) {
    let nuevaSerie = []
    let o = {}
    for (let j = 0; j < datos[i].series.length; j++) {
      let val = datos[i].series[j].value
      let x = semanas[datos[i].series[j].x]
      let idx = x.semana + ' ' + x.anio
      if (typeof o[idx] !== 'undefined') {
        o[idx] += val
      } else {
        o[idx] = val
      }
    }
    for (const [key, value] of Object.entries(o)) {
      nuevaSerie.push({ x: key, value })
    }
    datos[i].series = nuevaSerie
  }
  return datos
}

const totalCasosHSI = {
  measures: ['EnfermedadEdadSexo.identificador'],
  timeDimensions: [
    {
      dimension: 'EnfermedadEdadSexo.Fecha_inicio',
      granularity: 'day',
      dateRange: 'last 360 days',
    },
  ],
  filters: [
    {
      member: 'EnfermedadEdadSexo.enfermedad',
      operator: 'equals',
      values: [props.enfermedad],
    },
  ],
  order: {
    'EnfermedadEdadSexo.identificador': 'desc',
  },
  dimensions: ['EnfermedadEdadSexo.Grupo_edad'],
}
const e = props.enfermedad == 'Covid19' ? 'Covid' : props.enfermedad

const totalCasosSNVS = {
  measures: [e + 'EdadSexoSNVS.ideventocaso'],
  timeDimensions: [
    {
      dimension: e + 'EdadSexoSNVS.Fecha_apertura',
      granularity: 'day',
      dateRange: 'last 360 days',
    },
  ],
  order: {
    [e + 'EdadSexoSNVS.ideventocaso']: 'desc',
  },
  dimensions: [e + 'EdadSexoSNVS.Grupo_edad'],
  filters: [],
}

const pivotConfigHSI = {
  x: ['EnfermedadEdadSexo.Fecha_inicio'],
  y: ['EnfermedadEdadSexo.Grupo_edad', 'measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const pivotConfigSNVS = {
  x: [e + 'EdadSexoSNVS.Fecha_apertura.day'],
  y: [e + 'EdadSexoSNVS.Grupo_edad', 'measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const getTotalCasos = () => {
  switch (props.dataSource) {
    case 'hsi':
      return totalCasosHSI
    case 'snvs':
      return totalCasosSNVS
  }
}

const SemanaQuery = {
  measures: ['SemanaEpidemiologica.count'],
  dimensions: ['SemanaEpidemiologica.fecha', 'SemanaEpidemiologica.numero_semana', 'SemanaEpidemiologica.anio'],
  timeDimensions: [
    {
      dimension: 'SemanaEpidemiologica.fecha',
      granularity: 'day',
      dateRange: 'last 360 days',
    },
  ],
  order: {},
  filters: [],
}

const pivotConfigSemana = {
  x: ['SemanaEpidemiologica.fecha', 'SemanaEpidemiologica.numero_semana', 'SemanaEpidemiologica.anio'],
  y: [],
  fillMissingDates: true,
  joinDateRange: false,
}

const getPivotConfig = () => {
  switch (props.dataSource) {
    case 'hsi':
      return pivotConfigHSI
    case 'snvs':
      return pivotConfigSNVS
  }
}

const resultSet = await cubeApi.load(getTotalCasos())
const semanaSet = await cubeApi.load(SemanaQuery)
const semanaSetPivot = semanaSet.pivot(pivotConfigSemana)
const semanas = semanaSetPivot.reduce((todasSemanas, semana) => {
  todasSemanas[semana.xValues[0]] = {
    semana: semana.xValues[1],
    anio: semana.xValues[2],
  }
  return todasSemanas
}, {})

const semanasUnicas = [...new Set(semanaSetPivot.map((semana) => semana.xValues[1] + ' ' + semana.xValues[2]))]
</script>

<template>
  <Suspense>
    <template #fallback>
      <BaseGraphSkeleton
        height="sm:h-[38vh] xl:h-[50vh] 2xl:h-[60vh]"
        :color-theme="getThemeByDataSource(props.dataSource)"
      ></BaseGraphSkeleton>
    </template>
    <template #default>
      <base-visualizacion :titulo="titulo" :color-theme="getThemeByDataSource(props.dataSource)">
        <GraficoStackedLines
          :chart-height="props.chartHeight"
          :color-theme="getThemeByDataSource(props.dataSource)"
          :series="procesaDatos(resultSet.series(getPivotConfig()).filter(filterV).map(itemSplit), semanas)"
          :titulo-y="tituloY"
          :titulo-x="tituloX"
          :etiquetas="semanasUnicas"
        />
      </base-visualizacion>
    </template>
  </Suspense>
</template>
