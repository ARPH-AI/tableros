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
  measures: ['CovidEdadSexoMascSNVS.cantidad_masc_snvs'],
  timeDimensions: [],
  order: {
    'CovidEdadSexoMascSNVS.grupo_edad_masc': 'asc',
  },
  dimensions: ['CovidEdadSexoMascSNVS.grupo_edad_masc'],
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
  measures: ['CovidEdadSexoFemSNVS.cantidad_fem_snvs'],
  timeDimensions: [],
  order: {
    'CovidEdadSexoFemSNVS.grupo_edad_fem': 'asc',
  },
  dimensions: ['CovidEdadSexoFemSNVS.grupo_edad_fem'],
}

const pivotConfigMasc = {
  x: ['CovidEdadSexoMasc.grupo_edad_masc'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const pivotConfigFem = {
  x: ['CovidEdadSexoFem.grupo_edad_fem'],
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
      <GraficoPiramide
        :chart-height="
          dataSource == 'hsi' ? 'sm:h-[38vh] xl:h-[47vh] 2xl:h-[26vh]' : 'sm:h-[38vh] xl:h-[47vh] 2xl:h-[54vh]'
        "
        :color-theme="getThemeByDataSource(props.dataSource)"
        :series="[...resultSetMasc.series(pivotConfigMasc), ...resultSetFem.series(pivotConfigFem)]"
        :titulo="titulo"
        :etiquetas="resultSetMasc.chartPivot(pivotConfigMasc).map((row) => row.x)"
      />
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
