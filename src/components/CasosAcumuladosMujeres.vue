<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import Card from '@/components/Card.vue'
import { obtenerCantidad } from '@/cube/utils'

const titulo = 'Casos Acumulados Mujeres'
const totalCasosAcumulados = {
  measures: ['CovidEdadSexoFem.cantidad_fem'],
  timeDimensions: [],
  order: {},
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="totalCasosAcumulados">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <Spinner />
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <Card :cantidad="obtenerCantidad(resultSet)" :titulo="titulo" />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
