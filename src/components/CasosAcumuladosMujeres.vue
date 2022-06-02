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
  measures: ['CovidEdadSexoFem.cantidad_fem'],
  timeDimensions: [],
  order: {},
}
const totalCasosAcumuladosSNVS = {
  measures: ['CovidEdadSexoFem.cantidad_fem_snvs'],
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
        <Spinner />
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

<style scoped></style>
