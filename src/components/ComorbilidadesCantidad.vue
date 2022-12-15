<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { obtenerCantidad } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

const procesaDatos = (lista, total) => {
  if (lista.length === 0) {
    return lista
  }

  let resultado_intermedio = {}
  for (let i = 0; i < lista[0].series.length; i++) {
    let val = lista[0].series[i].value
    let x = lista[0].series[i].x
    if (typeof resultado_intermedio[val] !== 'undefined') {
      resultado_intermedio[val] += 1
    } else {
      resultado_intermedio[val] = 1
    }
  }

  let num = 0
  let resultado = []
  for (const [key, value] of Object.entries(resultado_intermedio)) {
    num = (value * 100) / total
    resultado.push({
      value: num.toFixed(2),
      name: key != 0 ? key : 'Ninguna',
    })
  }
  return resultado
}

const titulo = 'Cantidad de comorbilidades en casos confirmados'

const pivotConfig = {
  x: ['casosComorbilidad.paciente'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const totalComorbilidades = {
  measures: ['casosComorbilidad.total_comorbilidad'],
  timeDimensions: [],
  order: {
    'casosComorbilidad.total_comorbilidad': 'desc',
  },
  dimensions: ['casosComorbilidad.paciente'],
  filters: [
    {
      member: 'casosComorbilidad.Estado',
      operator: 'equals',
      values: ['Confirmado'],
    },
  ],
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
      <GraficoDona
        :chart-height="
          props.dataSource == 'hsi' ? 'sm:h-[38vh] xl:h-[47vh] 2xl:h-[26vh]' : 'sm:h-[38vh] xl:h-[47vh] 2xl:h-[54vh]'
        "
        :color-theme="getThemeByDataSource(props.dataSource)"
        :series="procesaDatos(resultSet.series(pivotConfig), obtenerCantidad(total))"
        :titulo="titulo"
      />
    </template>
  </Suspense>
</template>

<style scoped></style>
