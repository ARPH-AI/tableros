<script setup lang="ts">
import cubeApi from '@/cube'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
  enfermedad: { type: String, default: 'Covid19' },
  chartHeight: { type: String, default: 'sm:h-[38vh] xl:h-[47vh] 2xl:h-[54vh]' },
})

const titulo = 'Casos acumulados por edad y sexo'

const totalCasosMascHSI = {
  measures: ['EnfermedadEdadSexoMasc.cantidad_masc'],
  timeDimensions: [],
  order: {
    'EnfermedadEdadSexoMasc.grupo_edad_masc': 'asc',
  },
  filters: [
    {
      member: 'EnfermedadEdadSexoMasc.enfermedad',
      operator: 'equals',
      values: [props.enfermedad],
    },
  ],
  dimensions: ['EnfermedadEdadSexoMasc.grupo_edad_masc'],
}

const e = props.enfermedad == 'Covid19' ? 'Covid' : props.enfermedad

const totalCasosMascSNVS = {
  measures: [e + 'EdadSexoMascSNVS.cantidad_masc_snvs'],
  timeDimensions: [],
  order: {
    [e + 'EdadSexoMascSNVS.grupo_edad_masc']: 'asc',
  },
  dimensions: [e + 'EdadSexoMascSNVS.grupo_edad_masc'],
}

const totalCasosFemHSI = {
  measures: ['EnfermedadEdadSexoFem.cantidad_fem'],
  timeDimensions: [],
  order: {
    'EnfermedadEdadSexoFem.grupo_edad_fem': 'asc',
  },
  dimensions: ['EnfermedadEdadSexoFem.grupo_edad_fem'],
  filters: [
    {
      member: 'EnfermedadEdadSexoFem.enfermedad',
      operator: 'equals',
      values: [props.enfermedad],
    },
  ],
}

const totalCasosFemSNVS = {
  measures: [e + 'EdadSexoFemSNVS.cantidad_fem_snvs'],
  timeDimensions: [],
  order: {
    [e + 'EdadSexoFemSNVS.grupo_edad_fem']: 'asc',
  },
  dimensions: [e + 'EdadSexoFemSNVS.grupo_edad_fem'],
}

const pivotConfigMasc = {
  x: ['EnfermedadEdadSexoMasc.grupo_edad_masc'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const pivotConfigFem = {
  x: ['EnfermedadEdadSexoFem.grupo_edad_fem'],
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
  <Transition mode="out-in">
    <Suspense>
      <base-visualizacion :titulo="titulo" :color-theme="getThemeByDataSource(props.dataSource)">
        <GraficoPiramide
          :chart-height="props.chartHeight"
          :color-theme="getThemeByDataSource(props.dataSource)"
          :series="[...resultSetMasc.series(pivotConfigMasc), ...resultSetFem.series(pivotConfigFem)]"
          :etiquetas="resultSetMasc.chartPivot(pivotConfigMasc).map((row) => row.x)"
        />
      </base-visualizacion>
      <template #fallback>
        <BaseGraphSkeleton
          styles="sm:h-[38vh] xl:h-[50vh] 2xl:h-[60vh]"
          :color-theme="getThemeByDataSource(props.dataSource)"
        ></BaseGraphSkeleton>
      </template>
    </Suspense>
  </Transition>
</template>

<style scoped></style>
