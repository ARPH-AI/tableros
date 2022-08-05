<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
// import { obtenerCantidad } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

const titulo = 'Cantidad de comorbilidades en casos confirmados'

const totalComorbilidades = {
  measures: ['casosComorbilidad.id_comorbilidad'],
  timeDimensions: [],
  order: {
    'casosComorbilidad.id_comorbilidad': 'desc',
  },
  dimensions: ['casosComorbilidad.comorbilidad'],
}
const pivotConfig = {
  x: ['casosComorbilidad.comorbilidad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="totalComorbilidades">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <BaseGraphSkeleton
          styles="sm:h-[38vh] xl:h-[50vh] 2xl:h-[60vh]"
          :color-theme="getThemeByDataSource(props.dataSource)"
        ></BaseGraphSkeleton>
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <GraficoDona
          :color-theme="getThemeByDataSource(props.dataSource)"
          :series="resultSet.series(pivotConfig)"
          :titulo="titulo"
          :etiquetas="resultSet.chartPivot(pivotConfig).map((row) => row.x)"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
