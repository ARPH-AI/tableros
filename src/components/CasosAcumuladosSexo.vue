<script setup lang="ts">
import cubeApi from '@/cube'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

const titulo = 'Casos acumulados por edad y sexo'

const totalCasosMascHSI = {
  measures: ['CovidEdadSexoMasc.cantidad_masc'],
  timeDimensions: [],
  order: {
    'CovidEdadSexoMasc.grupo_edad_masc': 'asc',
  },
  dimensions: ['CovidEdadSexoMasc.grupo_edad_masc'],
}

const totalCasosMascSNVS = {
  measures: ['CovidEdadSexoMasc.cantidad_masc_snvs'],
  timeDimensions: [],
  order: {
    'CovidEdadSexoMasc.grupo_edad_masc': 'asc',
  },
  dimensions: ['CovidEdadSexoMasc.grupo_edad_masc'],
}

const totalCasosFemHSI = {
  measures: ['CovidEdadSexoFem.cantidad_fem'],
  timeDimensions: [],
  order: {
    'CovidEdadSexoFem.grupo_edad_fem': 'asc',
  },
  dimensions: ['CovidEdadSexoFem.grupo_edad_fem'],
}

const totalCasosFemSNVS = {
  measures: ['CovidEdadSexoFem.cantidad_fem_snvs'],
  timeDimensions: [],
  order: {
    'CovidEdadSexoFem.grupo_edad_fem': 'asc',
  },
  dimensions: ['CovidEdadSexoFem.grupo_edad_fem'],
}

const pivotConfigMasc = {
  x: ['CovidEdadSexo.Grupo_edad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const pivotConfigFem = {
  x: ['CovidEdadSexo.Grupo_edad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const getTotalCasosMasc = () => {
  switch (props.dataSource) {
    case 'hsi':
      return totalCasosMascHSI
    case 'snvs':
      return totalCasosMascSNVS
  }
}

const getTotalCasosFem = () => {
  switch (props.dataSource) {
    case 'hsi':
      return totalCasosFemHSI
    case 'snvs':
      return totalCasosFemSNVS
  }
}

const resultSetMasc = await cubeApi.load(getTotalCasosMasc())
const resultSetFem = await cubeApi.load(getTotalCasosFem())
</script>

<template>
  <GraficoPiramide
    :color-theme="getThemeByDataSource(props.dataSource)"
    :series="[...resultSetMasc.series(pivotConfigMasc), ...resultSetFem.series(pivotConfigFem)]"
    :titulo="titulo"
    :etiquetas="resultSetMasc.chartPivot(pivotConfigMasc).map((row) => row.x)"
  />
</template>

<style scoped></style>
