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
const titulo = 'Últimos 7 días'

const totalCasosHSI = {
  measures: ['casos.identificador'],
  timeDimensions: [
    {
      dimension: 'casos.inicio_covid',
      dateRange: 'Last 7 days',
    },
  ],
  order: {},
  filters: [],
  dimensions: [],
}

const totalCasosSNVS = {
  measures: ['CovidEdadSexoSNVS.id_evento_caso'],
  timeDimensions: [
    {
      dimension: 'CovidEdadSexoSNVS.Fecha_apertura',
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
        <Card
          :color-theme="getThemeByDataSource(props.dataSource)"
          :cantidad="obtenerCantidad(resultSet)"
          :titulo="titulo"
        />
      </div>
    </template>
  </query-builder>
</template>
