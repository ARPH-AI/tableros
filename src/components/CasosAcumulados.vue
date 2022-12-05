<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { obtenerCantidad } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})
const titulo = 'Casos Acumulados'
const totalCasosAcumuladosHSI = {
  measures: ['casosEnfermedad.identificador'],
  timeDimensions: [
    {
      dimension: 'casosEnfermedad.Fecha_inicio',
      dateRange: 'last 360 days',
      //      dateRange: [`${fechaInicio}`, `${fechaFin}`],
    },
  ],
  order: {},
  filters: [
    {
      member: 'casosEnfermedad.enfermedad',
      operator: 'equals',
      values: ['Covid19'],
    }
  ],
}

const totalCasosAcumuladosSNVS = {
  measures: ['casosCovidPromSemSNVS.cantidadXDiaSNVS'],
  timeDimensions: [
    {
      dimension: 'casosCovidPromSemSNVS.Fecha_inicio_Conf',
      dateRange: 'last 360 days',
      //      dateRange: [`${fechaInicio}`, `${fechaFin}`],
    },
  ],
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
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
