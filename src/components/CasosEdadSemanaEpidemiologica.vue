<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { getThemeByDataSource } from '@/composables'
import { format, subYears } from 'date-fns'

const props = defineProps({
  dataSource: { type: String, default: 'hsi' },
})

const dateFormat = 'yyyy-MM-dd'
const todayDate = new Date()
const today = format(todayDate, dateFormat)
const yearAgo = format(subYears(todayDate, 1), dateFormat)

const titulo = 'Nuevos casos por grupo de edad'
const tituloX = 'Semana Epidemiológica'
const tituloY = 'Casos'

const itemSplit = (item) => {
 item.title = item.title.split(',')[0];
 return item;
}

const filterV = (item) => {
 return (item.title.split(',')[0] != 'v')
}

const totalCasosHSI = {
  measures: ['CovidEdadSexo.identificador'],
  filters: [
    {
      or: [
        {
          member: 'CovidEdadSexo.Fecha_inicio',
          operator: 'inDateRange',
          values: [yearAgo, today],
        },
/*
        {
          member: 'CovidEdadSexo.Numero_semana',
          operator: 'notSet'
        }
*/
      ]
    }
  ],
  order: {
    'CovidEdadSexo.Anio': 'asc',
    'CovidEdadSexo.Numero_semana': 'asc',
    'CovidEdadSexo.Grupo_edad': 'asc',
  },
  dimensions: [
    'CovidEdadSexo.Anio',
    'CovidEdadSexo.Numero_semana',
    'CovidEdadSexo.Grupo_edad'
  ],
}
const totalCasosSNVS = {
  measures: ['CovidEdadSexoSNVS.id_evento_caso'],
  filters: [
    {
      or: [
        {
          member: 'CovidEdadSexoSNVS.Fecha_apertura',
          operator: 'inDateRange',
          values: [yearAgo, today],
        },
/*
        {
          member: 'CovidEdadSexoSNVS.Numero_semana_snvs',
          operator: 'notSet'
        }
*/
      ]
    }
  ],
  order: {
    'CovidEdadSexoSNVS.Anio_snvs': 'asc',
    'CovidEdadSexoSNVS.Numero_semana_snvs': 'asc',
    'CovidEdadSexoSNVS.Grupo_edad': 'asc',
  },
  dimensions: [
    'CovidEdadSexoSNVS.Anio_snvs',
    'CovidEdadSexoSNVS.Numero_semana_snvs',
    'CovidEdadSexoSNVS.Grupo_edad'
  ],
}

const pivotConfigHSI = {
  x: ['CovidEdadSexo.Fecha_inicio'],
  y: ['CovidEdadSexo.Grupo_edad', 'measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const pivotConfigSNVS = {
  x: ['CovidEdadSexoSNVS.Fecha_apertura.day'],
  y: ['CovidEdadSexoSNVS.Grupo_edad', 'measures'],
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

const getPivotConfig = () => {
  switch (props.dataSource) {
    case 'hsi':
      return pivotConfigHSI
    case 'snvs':
      return pivotConfigSNVS
  }
}
</script>

<template>
  <query-builder :cubejs-api="cubeApi" :query="getTotalCasos()">
    <template #default="{ loading, resultSet }">
      <div v-if="loading" class="flex justify-center items-center">
        <BaseGraphSkeleton
          styles="sm:h-[38vh] xl:h-[50vh] 2xl:h-[60vh]"
          :color-theme="getThemeByDataSource(props.dataSource)"
        ></BaseGraphSkeleton>
      </div>
      <div v-if="!loading && resultSet !== undefined">
        <GraficoStackedLines
          :color-theme="getThemeByDataSource(props.dataSource)"
          :series="resultSet.series(getPivotConfig()).filter(filterV).map(itemSplit)"
          :titulo="titulo"
          :titulo-y="tituloY"
          :titulo-x="tituloX"
          :etiquetas="resultSet.chartPivot(getPivotConfig()).map((row) => row.x)"
        />
      </div>
    </template>
  </query-builder>
</template>

<style scoped></style>
