<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
// import { obtenerCantidad } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'
import { obtenerCantidad } from '@/cube/utils'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

const titulo = 'Frecuencia de comorbilidades'
const tituloX = '% de casos confirmados'
const tituloY = ''

const procesaDatos = (lista, total) => {
  const calculaFrecuencia = (item) => {
    const num = (item.value * 100) / total
    item.value = num.toFixed(2)
    return item
  }

  const procesaItem = (item) => {
    item.title = item.title.split(',')[0]
    item.series = item.series.map(calculaFrecuencia)
    return item
  }

  return lista.map(procesaItem)
}

const totalComorbilidades = {
  measures: ['casosComorbilidad.total_Confirmado'],
  timeDimensions: [],
  order: {
    'casosComorbilidad.total_Confirmado': 'desc',
  },
  filters: [
    {
      member: 'casosComorbilidad.comorbilidad',
      operator: 'set',
    },
  ],
  dimensions: ['casosComorbilidad.comorbilidad', 'casosComorbilidad.sexo'],
}
const pivotConfig = {
  x: ['casosComorbilidad.comorbilidad'],
  y: ['casosComorbilidad.sexo', 'measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const totalConfirmados = {
  measures: ['casosComorbilidad.total_Confirmado'],
  timeDimensions: [],
  order: {},
  dimensions: [],
  filters: [],
}

const resultSet = await cubeApi.load(totalComorbilidades)
const total = await cubeApi.load(totalConfirmados)
</script>

<template>
  <Suspense>
    <template #fallback>
      <BaseGraphSkeleton
        styles="sm:h-[38vh] xl:h-[50vh] 2xl:h-[60vh]"
        :color-theme="getThemeByDataSource(props.dataSource)"
      ></BaseGraphSkeleton>
    </template>
    <template #default>
      <GraficoBar
        :chart-height="
          props.dataSource == 'hsi' ? 'sm:h-[38vh] xl:h-[47vh] 2xl:h-[26vh]' : 'sm:h-[38vh] xl:h-[47vh] 2xl:h-[54vh]'
        "
        :color-theme="getThemeByDataSource(props.dataSource)"
        :series="procesaDatos(resultSet.series(pivotConfig), obtenerCantidad(total))"
        :titulo="titulo"
        :titulo-x="tituloX"
        :titulo-y="tituloY"
        :etiquetas="resultSet.chartPivot(pivotConfig).map((row) => row.x)"
      />
    </template>
  </Suspense>
</template>
