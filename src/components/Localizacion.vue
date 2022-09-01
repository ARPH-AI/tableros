<script setup lang="ts">
import cubeApi from '@/cube'
import { mergeArrayByKey } from '@/cube/utils'
import { ref, watchEffect } from 'vue'
import { osmApi, datosgeoApi } from '@/api'
import { format } from 'date-fns'
import { Popover, PopoverButton, PopoverPanel } from '@headlessui/vue'
import { QuestionMarkCircleIcon } from '@heroicons/vue/outline'

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

//let fecha = ref('2021-09-09')
let fecha = ref(format(new Date(), 'yyyy-MM-dd'))

const titulo = 'Total de casos activos por lugar de residencia'

const totalCasos = (fecha) => {
  return {
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
}

const pivotConfig = {
  x: ['casos.ciudad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const changeDate = (event) => {
  fecha.value = event.target.value
}

const forceUpdate = () => key.value++

watchEffect(async () => {
  resultSet = await cubeApi.load(totalCasos(fecha.value))
  coords.value = await getCoords(resultSet.rawData())
  forceUpdate()
})
</script>

<template>
  <div class="">
    <div class="">
      <div class="flex flex-row flex-1 place-items-center mb-2 shadow-b-xl">
        <div class="flex place-items-center shadow-b-xl">
          <h5 class="pr-5 text-left text-sm uppercase text-light_contrast dark:text-dark_contrast">{{ titulo }}</h5>
          <Popover class="pr-10 relative">
            <PopoverButton> <QuestionMarkCircleIcon class="w-5" aria-hidden="true" /></PopoverButton>
            <PopoverPanel
              class="dark:bg-dark_base dark:text-dark_contrast bg-light_base-50 absolute z-50 rounded-lg p-3 w-80"
            >
              <p class="text-left text-sm">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                ex ea commodo consequat.
              </p>
            </PopoverPanel>
          </Popover>
          <input
            v-model="fecha"
            class="
              z-40
              flex-1
              p-2
              pl-3
              right-0
              text-left
              bg-white
              rounded-lg
              shadow-xl
              cursor-default
              focus:outline-none
              focus-visible:border-indigo-500
              focus-visible:ring-2
              focus-visible:ring-white
              focus-visible:ring-opacity-75
              dark:text-light_contrast
              focus-visible:ring-offset-2 focus-visible:ring-offset-orange-300
            "
            type="date"
            @change="changeDate"
          />
        </div>
      </div>

      <MapaClustering :key="key" :center="center" :zoom="zoom" :coords="coords" />
    </div>
  </div>
</template>

<style scoped></style>
