<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import Card from '@/components/Card.vue'
import { obtenerCantidad } from '@/cube/utils'

const date = '2022-03-06' //hoy
const titulo = 'Casos Activos SNVS'
const totalCasosActivos = {
  measures: ['casosCovidPromSem.cantidadXDiaSNVS'],
  timeDimensions: [],
  order: {},
  filters: [
    {
      member: 'casosCovidPromSem.Fecha_inicio_Conf',
      operator: 'equals',
      values: [`${date}`],
    },
  ],
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="totalCasosActivos">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="loading">Loading...</div>
      <div v-if="!loading && resultSet !== undefined">
        <Card :cantidad="obtenerCantidad(resultSet)" :titulo="titulo" />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
