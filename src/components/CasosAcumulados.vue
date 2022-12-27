<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { obtenerCantidad } from '@/cube/utils'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
  enfermedad: { type: String, default: 'Covid19' },
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
      values: [props.enfermedad],
    },
    {
      member: 'casosEnfermedad.Estado',
      operator: 'equals',
      values: [ 'Confirmado' ],
    }
  ],
}

const e = props.enfermedad == 'Covid19' ? 'Covid' : props.enfermedad
const totalCasosAcumuladosSNVS = {
  measures: ['casos' + e + 'PromSemSNVS.cantidadXDiaSNVS'],
  timeDimensions: [
    {
      dimension: 'casos' + e + 'PromSemSNVS.Fecha_inicio_Conf',
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
