<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { obtenerCantidad } from '@/cube/utils'
import { format } from 'date-fns'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})
const date = format(new Date(), 'yyyy-MM-dd')
const titulo = 'Promedio Semanal'

const totalCasosHSI = {
  measures: ['EnfermedadEdadSexo.promCasosNuevosCovid'],
  timeDimensions: [],
  order: {},
  filters: [
    {
      member: 'EnfermedadEdadSexo.enfermedad',
      operator: 'equals',
      values: ['Covid19'],
    }
  ],
  dimensions: [],
}

const totalCasosSNVS = {
  measures: ['CovidEdadSexoSNVS.promCasosNuevosCovidSNVS'],
  timeDimensions: [],
  order: {},
  filters: [],
  dimensions: [],
}

const getTotalCasos = () => {
  switch (props.dataSource) {
    case 'hsi':
      return totalCasosHSI
    case 'snvs':
      return totalCasosSNVS
  }
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="getTotalCasos()">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <BaseCardSkeleton :color-theme="getThemeByDataSource(props.dataSource)"></BaseCardSkeleton>
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <NumberCard
          :color-theme="getThemeByDataSource(props.dataSource)"
          :cantidad="obtenerCantidad(resultSet)"
          :titulo="titulo"
          styles="bg-light_smooth dark:bg-dark_smooth"
        />
      </div>
    </template>
  </query-builder>
</template>
