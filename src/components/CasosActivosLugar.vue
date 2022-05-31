<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import TableCard from '@/components/TableCard.vue'
import { flattenColumns, getDisplayedColumns } from '@/cube/utils'
import { format } from 'date-fns'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

//const date = format(new Date(), 'yyyy-MM-dd')
const date = '2021-09-09' //Donde hay actualmente
const titulo = 'Total de casos activos por lugar de residencia'

const totalCasosHSI = {
  measures: ['casos.identificador'],
  order: {
    'casos.identificador': 'desc',
  },
  filters: [
    {
      member: 'casos.fecha_covid',
      operator: 'equals',
      values: [`${date}`],
    },
  ],
  dimensions: ['casos.ciudad'],
}

const totalCasosSNVS = {
  measures: ['CovidEdadSexoSNVS.id_evento_caso'],

  order: {
    'CovidEdadSexoSNVS.id_evento_caso': 'desc',
  },
  filters: [
    {
      member: 'CovidEdadSexoSNVS.Fecha_apertura',
      operator: 'equals',
      values: [`${date}`],
    },
  ],
  dimensions: ['CovidEdadSexoSNVS.Ciudad'],
}

const pivotConfig = {
  x: ['casos.ciudad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const getTotalCasos = () => {
  switch (props.dataSource) {
    case 'hsi':
      return totalCasosHSI
    case 'snvs':
      return totalCasosSNVS
  }
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="getTotalCasos()">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <Spinner />
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <TableCard
          :colorTheme="getThemeByDataSource(props.dataSource)"
          :datos="resultSet.tablePivot(pivotConfig)"
          :titulo="titulo"
          :titulos-columnas="flattenColumns(resultSet.tableColumns(pivotConfig))"
          :titulos-mostrados="getDisplayedColumns(resultSet.tableColumns(pivotConfig))"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
