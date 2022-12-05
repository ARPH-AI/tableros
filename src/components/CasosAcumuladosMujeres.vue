<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import Card from '@/components/Card.vue'
import { obtenerCantidad } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

const titulo = 'Casos Acumulados Mujeres'
const totalCasosAcumuladosHSI = {
  measures: ['EnfermedadEdadSexoFem.cantidad_fem'],
  timeDimensions: [],
  order: {},
  filters: [
    {
      member: 'EnfermedadEdadSexoFem.enfermedad',
      operator: 'equals',
      values: ['Covid19'],
    }
  ],

}
const totalCasosAcumuladosSNVS = {
  measures: ['CovidEdadSexoFemSNVS.cantidad_fem_snvs'],
  timeDimensions: [],
  order: {},
}

const getTotalCasosAcumulados = () => {
  switch (props.dataSource) {
    case 'hsi':
      return totalCasosAcumuladosHSI
    case 'snvs':
      return totalCasosAcumuladosSNVS
  }
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="getTotalCasosAcumulados()">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <BaseCardSkeleton :color-theme="getThemeByDataSource(props.dataSource)"></BaseCardSkeleton>
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <NumberCard
          :color-theme="getThemeByDataSource(props.dataSource)"
          :cantidad="obtenerCantidad(resultSet)"
          :titulo="titulo"
          :miles=true
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
