<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { obtenerCantidad } from '@/cube/utils'
import { format } from 'date-fns'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})
const date = format(new Date(), 'yyyy-MM-dd')
const titulo = 'Casos Activos'

const totalCasosActivosHSI = {
  measures: ['casos.identificador'],
  timeDimensions: [
    {
      dimension: 'casos.fecha_covid',
    },
  ],
  order: {},
  filters: [
    {
      member: 'casos.fecha_covid',
      operator: 'equals',
      values: [`${date}`],
    },
  ],
}

const totalCasosActivosSNVS = {
  measures: ['casosCovidPromSemSNVS.cantidadXDiaSNVS'],
  timeDimensions: [],
  order: {},
  filters: [
    {
      member: 'casosCovidPromSemSNVS.Fecha_inicio_Conf',
      operator: 'equals',
      values: [`${date}`],
    },
  ],
}

const getTotalCasosActivos = () => {
  switch (props.dataSource) {
    case 'hsi':
      return totalCasosActivosHSI
    case 'snvs':
      return totalCasosActivosSNVS
  }
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="getTotalCasosActivos()">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <BaseCardSkeleton :color-theme="getThemeByDataSource(props.dataSource)" />
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
