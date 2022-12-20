<script setup lang="ts">
import cubeApi from '@/cube'
import { mergeArrayByKey } from '@/cube/utils'
import { computed, ref, watchEffect } from 'vue'
import { osmApi, datosgeoApi } from '@/api'
import { format } from 'date-fns'
import { Popover, PopoverButton, PopoverPanel } from '@headlessui/vue'
import { QuestionMarkCircleIcon } from '@heroicons/vue/outline'
import VueTailwindDatepicker from 'vue-tailwind-datepicker'

const props = defineProps({
  enfermedad: { type: String, default: 'Covid19' },
})

const ciudadesFilter = (item) => item['casos.ciudad']
const getCoords = async (resultSet) => {
  const centroide_lat = 'centroide.lat'
  const centroide_lon = 'centroide.lon'
  const campos = `${centroide_lat},${centroide_lon}`
  const ciudades = resultSet.filter(ciudadesFilter).map((item) => ({
    nombre: item['casos.ciudad'],
    campos,
    max: 1,
  }))

  const params = {
    inlineObject: {
      localidades: ciudades,
    },
  }

  if (ciudades.length === 0) {
    console.error('No encontro ciudades para consultar')
    return []
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
  // formas de evitar consulta a OSM (buscar ciudad argentinas geo)
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

let resultSet = {}
const submitted = ref(false)
const formData = ref({})
let center = ref([-64.8, -36.45])
let zoom = ref(5)
let key = ref(0)
let coords = ref([])

let fecha = ref(format(new Date(), 'dd-MM-yyyy'))
const formatter = ref({
  date: 'DD-MM-YYYY',
  month: 'MMM',
})
const fecha_for_cube = computed(() => fecha.value.split('-').reverse().join('-'))
const titulo = 'Total de casos activos por lugar de residencia'

const totalCasos = (fecha) => {
  return {
    measures: ['casos.identificador'],
    order: {
      'casos.identificador': 'desc',
    },
    filters: [
      {
        member: 'casos.fecha_activo',
        operator: 'equals',
        values: [`${fecha}`],
      },
      {
        member: 'casos.enfermedad',
        operator: 'equals',
        values: [ props.enfermedad ],
      }
    ],
    dimensions: ['casos.ciudad'],
  }
}

const pivotConfig = {
  x: ['casos.ciudad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const changeDate = (event) => {
  if (event.target.value) {
    fecha.value = event.target.value
    fecha_placeholder = event.target.value
  }
}

const forceUpdate = () => key.value++

watchEffect(async () => {
  if (fecha.value) {
    resultSet = await cubeApi.load(totalCasos(fecha_for_cube.value))
    coords.value = await getCoords(resultSet.rawData())
    forceUpdate()
  }
})
</script>

<template>
  <div class="grid space-y-3">
    <div class="flex flex-row mt-3">
      <div class="place-items-center shadow-b-xl text-xs flex flex-row basis-3/4 float-left">
        <h5
          class="
            pl-2
            border-l-4
            border-light_contrast
            dark:border-dark_contrast
            text-left text-sm
            uppercase
            text-light_contrast
            dark:text-dark_contrast
          "
        >
          {{ titulo }}
        </h5>
        <Popover class="ml-4 float-left relative">
          <PopoverButton> <QuestionMarkCircleIcon class="w-5" aria-hidden="true" /></PopoverButton>
          <PopoverPanel
            class="text-dark_contrast bg-[#000] absolute z-50 rounded-lg p-3 w-80 bg-light_smooth border-none"
          >
            <p class="text-left text-sm">
              Este mapa se ha elaborado tomando en cuenta la residencia de las personas, permitiendo la identificación
              de clusters de casos activos registrados en la HSI.
            </p>
          </PopoverPanel>
        </Popover>
      </div>
      <div class="flex">
        <vue-tailwind-datepicker
          v-model="fecha"
          aria-label="Seleccion de fecha"
          class="flex-1 float-right focus:outline-none shadow-md rounded-lg bg-light_smooth border-none cursor-pointer"
          overlay
          :formatter="formatter"
          as-single
          input-classes="block text-sm font-medium text-light_contrast dark:text-dark_contrast shadow-none"
          :placeholder="fecha"
          i18n="es-ar"
        />
      </div>
    </div>

    <MapaClustering :key="key" :center="center" :zoom="zoom" :coords="coords" />
  </div>
</template>

<style scoped></style>
