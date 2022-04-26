<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import Card from '@/components/Card.vue'
import { obtenerCantidad } from '@/cube/utils'
import { format } from 'date-fns'

const date = format(new Date(), 'yyyy-MM-dd')
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
