<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { flattenColumns, getDisplayedColumns, mergeArrayByKey } from '@/cube/utils'
import { ref } from 'vue'
import { format } from 'date-fns'
import { osmApi, datosgeoApi } from '@/api'

const getCoords = async (resultSet) => {
  const centroide_lat = 'centroide.lat'
  const centroide_lon = 'centroide.lon'
  const campos = `${centroide_lat},${centroide_lon}`
  const ciudades = resultSet.map((item) => {
    return {
      nombre: item['casos.ciudad'],
      campos,
      max: 1,
    }
  })

  const params = {
    inlineObject: {
      localidades: ciudades,
    },
  }

  try {
    const {
      data: { resultados: localidades },
    } = await datosgeoApi.obtenerLocalidadesPorLote(params)
    const cantidad_ciudad = localidades.flatMap((item) => item.localidades[0])
    const resultado = mergeArrayByKey(cantidad_ciudad, resultSet, 'casos.ciudad', 'nombre')
    return resultado.reduce((prev, cur, idx, arr) => {
      return [
        ...prev,
        ...Array(parseInt(cur['casos.identificador']))
          .fill()
          .map(() => [cur['centroide']['lon'], cur['centroide']['lat']]),
      ]
    }, [])
  } catch (error) {
    console.error('Error traer datos de obtenerLocalidadesPorLote', error)
    return []
  }
}

const submitHandler = async (resultSet) => {
  //formas de evitar consulta a OSM (buscar ciudad argentinas geo)
  // Cambio center del mapa basado en form
  // Debe mostrar todas las opciones en el select
  const format = 'jsonv2'
  const country = 'argentina'
  const city = formData.value.ubicacion

  try {
    const { data } = await osmApi.findGeoByCity({ city, country, format })
    if (data.length) {
      center.value = [data[0].lon, data[0].lat]
      zoom.value = 12 //depende del bounding box, tamaño de ciudad
    }
  } catch (error) {
    console.error('Error traer datos de findGeoByCity', error)
  }
}

const submitted = ref(false)
const formData = ref({})
let center = ref([-64.8, -36.45])
let zoom = ref(5)

const fecha = '2021-09-09'
//const fecha = ref(format(new Date(), 'yyyy-MM-dd'))

const titulo = 'Total de casos activos por lugar de residencia'

const totalCasos = {
  measures: ['casos.identificador'],
  order: {
    'casos.identificador': 'desc',
  },
  filters: [
    {
      member: 'casos.fecha_covid',
      operator: 'equals',
      values: [`${fecha}`],
    },
  ],
  dimensions: ['casos.ciudad'],
}

const pivotConfig = {
  x: ['casos.ciudad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const resultSet = await cubeApi.load(totalCasos)
const coords = await getCoords(resultSet.rawData())
</script>

<template>
  <div class="main mt-8 px-4 py-4 grid grid-cols-4">
    <!-- Left column -->
    <div class="flex justify-start w-full">
      <FormKit
        v-model="formData"
        type="form"
        incomplete-message=""
        @submit="submitHandler(resultSet.tablePivot(pivotConfig))"
      >
        <FormKit
          outer-class="w-full"
          label-class="w-full block mb-1 font-bold"
          inner-class="bg-light_base-100 text-light_contrast border border-secondary rounded mb-1 overflow-hidden"
          input-class="px-2 h-10 bg-light_base-100"
          help-class="text-primary"
          type="date"
          name="fecha"
          label="Fecha"
          help=""
          :value="fecha"
          :validation="[['required']]"
        />

        <!-- <FormKit
            outer-class="flex justify-start"
            label-class="mb-1 font-bold"
            inner-class="max-w-md rounded mb-1 overflow-hidden focus-within:border-secondary"
            input-class="w-full h-10 px-3 border-none text-base"
            help-class=""
            type="radio"
            name="casos"
            label="Casos"
            help=""
            :options="[
              { value: true, label: 'Casos Activos' },
              { value: false, label: 'Casos Nuevos' },
            ]"
          /> -->
        <FormKit
          label-class="block mb-1 font-bold"
          outer-class="mt-4 flex justify-start"
          inner-class="border border-secondary rounded-lg mb-1 overflow-hidden focus-within:border-secondary"
          input-class="h-10 px-3 border-none text-base"
          wrapper-class="mt-8"
          type="text"
          name="ubicacion"
          label="Ubicación"
          placeholder="Villa La Angostura"
        />
      </FormKit>
    </div>
    <div class="grid col-span-3 p-4">
      <MapaClustering :center="center" :zoom="zoom" :coords="coords" />
    </div>
  </div>
</template>

<style scoped></style>