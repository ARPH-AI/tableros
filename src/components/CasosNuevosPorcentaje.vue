<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import Card from '@/components/Card.vue'
import { obtenerCantidad } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'
import { normalizeDecimals } from '@/utils'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
  title: { type: String, required: true },
  measure: { type: String, required: true },
  enfermedad: { type: String, default: 'Covid19' },
})

const totalCasosHSI = {
  measures: [props.measure],
  timeDimensions: [],
  filters: [
    {
      member: 'EnfermedadEdadSexo.enfermedad',
      operator: 'equals',
      values: [ props.enfermedad ],
    }
  ],
  order: {},
}

const totalCasosSNVS = {
  measures: [props.measure],
  timeDimensions: [],
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
          :titulo="title"
          :percent="true"
          styles="bg-light_smooth dark:bg-dark_smooth"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
