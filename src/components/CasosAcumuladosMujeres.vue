<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import Card from '@/components/Card.vue'
import { obtenerCantidad } from '@/cube/utils'

const fechaInicio = '2021-01-01' //fecha fija
const fechaFin = '2022-06-06' //hoy
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
      <div v-if="loading" class="loading">Loading...</div>
      <div v-if="!loading && resultSet !== undefined">
        <Card :cantidad="obtenerCantidad(resultSet)" :titulo="titulo" />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
