<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { obtenerCantidad } from '@/cube/utils'
import { format } from 'date-fns'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
  enfermedad: { type: String, default: 'Covid19' },
})

const date = format(new Date(), 'yyyy-MM-dd')
const titulo = 'Últimos 7 días'
const e = props.enfermedad == 'Covid19' ? 'Covid' : props.enfermedad

const totalCasosHSI = {
  measures: ['casos.identificador'],
  timeDimensions: [
    {
      dimension: 'casos.fecha_inicio',
      dateRange: 'Last 7 days',
    },
  ],
  order: {},
  filters: [
    {
      member: 'casos.enfermedad',
      operator: 'equals',
      values: [props.enfermedad],
    },
  ],
  dimensions: [],
}

const totalCasosSNVS = {
  measures: [e + 'EdadSexoSNVS.ideventocaso'],
  timeDimensions: [
    {
      dimension: e + 'EdadSexoSNVS.Fecha_apertura',
      dateRange: 'Last 7 days',
    },
  ],
  order: {},
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
