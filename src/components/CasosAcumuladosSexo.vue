<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import GraficoPiramide from '@/components/GraficoPiramide.vue'

const titulo = 'Casos acumulados por sexo'

const totalCasosMasc = {
  measures: ['CovidEdadSexoMasc.cantidad_masc'],
  timeDimensions: [],
  order: {
    'CovidEdadSexoMasc.grupo_edad_masc': 'asc',
  },
  dimensions: ['CovidEdadSexoMasc.grupo_edad_masc'],
}

const pivotConfigMasc = {
  x: ['CovidEdadSexo.Grupo_edad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const totalCasosFem = {
  measures: ['CovidEdadSexoFem.cantidad_fem'],
  timeDimensions: [],
  order: {
    'CovidEdadSexoFem.grupo_edad_fem': 'asc',
  },
  dimensions: ['CovidEdadSexoFem.grupo_edad_fem'],
}

const pivotConfigFem = {
  x: ['CovidEdadSexo.Grupo_edad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const resultSetMasc = await cubeApi.load(totalCasosMasc)
const resultSetFem = await cubeApi.load(totalCasosFem)
</script>

<template>
  <GraficoPiramide
    :series="[...resultSetMasc.series(pivotConfigMasc), ...resultSetFem.series(pivotConfigFem)]"
    :titulo="titulo"
    :etiquetas="resultSetMasc.chartPivot(pivotConfigMasc).map((row) => row.x)"
  />
</template>

<style scoped></style>
