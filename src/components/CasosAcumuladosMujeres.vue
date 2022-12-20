<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import Card from '@/components/Card.vue'
import { obtenerCantidad } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
  enfermedad: { type: String, default: 'Covid19' },
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
      values: [ props.enfermedad ],
    }
  ],
}

const e = (props.enfermedad == 'Covid19') ? 'Covid' : props.enfermedad
const measures = [ e + 'EdadSexoFemSNVS.cantidad_fem_snvs' ]
const totalCasosAcumuladosSNVS = {
  measures,
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
