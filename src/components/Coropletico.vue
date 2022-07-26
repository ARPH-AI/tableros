<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { flattenColumns, getDisplayedColumns, mergeArrayByKey } from '@/cube/utils'
import { ref, watchEffect } from 'vue'
import { format } from 'date-fns'
import { osmApi, datosgeoApi } from '@/api'
import { Listbox, ListboxLabel, ListboxButton, ListboxOptions, ListboxOption } from '@headlessui/vue'
import { CheckIcon, SelectorIcon } from '@heroicons/vue/solid'

const provinciasImport = await fetch('src/assets/provincias-argentina.json')
const provincias = await provinciasImport.json()

const titulo = 'Total de casos activos por lugar de residencia'

let resultSet = {}
let datos = ref([])
//let  fecha = ref('2021-04-09')
let fecha = ref(format(new Date(), 'yyyy-MM-dd'))
let key = ref(0)
let zoomChild = ref(null)

//Se podria tomar directamente de provincia, buscando por nombre para el por defecto
let provinciaSel = ref(provincias[0])
let zoom = ref(provincias[0].zoom)
let center = ref([provinciaSel.value.centroide.lon, provinciaSel.value.centroide.lat])
let url = ref('src/assets/departamentos-buenos_aires.json')
//let url = ref("src/assets/departamentos-argentina.json")

// El uppercase y trim, habria que hacerlo en otro lado
const getData = async (resultSet) => {
  return resultSet.map((item) => {
    return {
      nombre: item['CovidEdadSexoSNVS.Ciudad'].toUpperCase().trim(),
      valor: parseInt(item['CovidEdadSexoSNVS.id_evento_caso']),
    }
  })
}

const totalCasos = (fecha) => {
  return {
    measures: ['CovidEdadSexoSNVS.id_evento_caso'],
    order: {
      'CovidEdadSexoSNVS.id_evento_caso': 'desc',
    },
    filters: [
      {
        member: 'CovidEdadSexoSNVS.Fecha_apertura',
        operator: 'equals',
        values: [`${fecha}`],
      },
    ],
    dimensions: ['CovidEdadSexoSNVS.Ciudad'],
  }
}

const pivotConfig = {
  x: ['CovidEdadSexoSNVS.Ciudad'],
  y: ['measures'],
  fillMissingDates: true,
  joinDateRange: false,
}

const forceUpdate = () => key.value++

watchEffect(async () => {
  resultSet = await cubeApi.load(totalCasos(fecha.value))
  datos.value = await getData(resultSet.rawData())
  zoom.value = zoomChild.value ? zoomChild.value : zoom.value
  forceUpdate()
})

const changeDate = (event) => {
  fecha.value = event.target.value
}

const changeZoom = (event) => {
  zoomChild.value = event
}

const matchArchivo = (nombre) => {
  // Normalizando desde nombre de DB a nombre de archivo
  return nombre
    .toLowerCase()
    .split(' ')
    .join('_')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
}
const changeProvincia = (event) => {
  center.value = [provinciaSel.value.centroide.lon, provinciaSel.value.centroide.lat]
  url.value = 'src/assets/departamentos-' + matchArchivo(provinciaSel.value.iso_nombre) + '.json'
  zoom.value = provinciaSel.value.zoom
}
</script>

<template>
  <div class="flex flex-col flex-1 w-full h-full">
    <div class="flex flex-row flex-1 justify-center justify-items-center px-80 mb-2 shadow-b-xl">
      <Listbox v-model="provinciaSel">
        <div class="relative z-40 flex-1 justify-center mt-1 mr-2 basis-1/4">
          <ListboxButton
            class="
              py-2
              pr-10
              pl-3
              w-full
              text-left
              bg-white
              rounded-lg
              shadow-md
              cursor-default
              focus:outline-none
              focus-visible:border-indigo-500
              focus-visible:ring-2
              focus-visible:ring-white
              focus-visible:ring-opacity-75
              focus-visible:ring-offset-2
              focus-visible:ring-offset-orange-300
              sm:text-sm
            "
          >
            <span class="block truncate">{{ provinciaSel.iso_nombre }}</span>
            <span class="flex absolute inset-y-0 right-0 items-center pr-2 pointer-events-none">
              <SelectorIcon class="w-5 h-5 text-primary'" aria-hidden="true" />
            </span>
          </ListboxButton>

          <transition
            leave-active-class="transition duration-100 ease-in"
            leave-from-class="opacity-100"
            leave-to-class="opacity-0"
          >
            <ListboxOptions
              class="
                overflow-auto
                absolute
                py-1
                mt-1
                w-full
                max-h-60
                text-base
                bg-white
                rounded-lg
                ring-1 ring-black ring-opacity-5
                shadow-lg
                focus:outline-none
                sm:text-sm
              "
            >
              <ListboxOption
                v-for="item in provincias"
                v-slot="{ active, selected }"
                :key="item.iso_nombre"
                :value="item"
                as="template"
                @click="changeProvincia"
              >
                <li
                  :class="[
                    active ? 'bg-light_smooth text-primary' : 'text-dark_base',
                    'relative cursor-default text-left select-none py-2 pl-10 pr-4',
                  ]"
                >
                  <span :class="[selected ? 'font-medium' : 'font-normal', 'block truncate']">{{
                    item.iso_nombre
                  }}</span>
                  <span v-if="selected" class="flex absolute inset-y-0 left-0 items-center pl-3 text-primary'">
                    <CheckIcon class="w-5 h-5" aria-hidden="true" />
                  </span>
                </li>
              </ListboxOption>
            </ListboxOptions>
          </transition>
        </div>
      </Listbox>
      <div class="flex flex-1 w-1/4">
        <input
          v-model="fecha"
          class="
            z-40
            flex-1
            p-1
            pl-3
            mt-1
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
            focus-visible:ring-offset-2
            focus-visible:ring-offset-orange-300
          "
          type="date"
          @change="changeDate"
        />
      </div>
    </div>
    <div class="relative flex-1 h-3/5">
      <MapaCoropletico
        :key="key"
        :url="url"
        :provincia="provinciaSel.iso_nombre"
        :center="center"
        :zoom="zoom"
        :datos="datos"
      />
      <div class="flex absolute right-4 top-10 z-10 rounded-lg shadow-lg dark:texto-light_contrast md:w-1/4">
        <CasosActivosLugar data-source="snvs" />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
