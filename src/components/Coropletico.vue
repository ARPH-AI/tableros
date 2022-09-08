<script setup lang="ts">
import cubeApi from '@/cube'
import { QueryBuilder } from '@cubejs-client/vue3'
import { flattenColumns, getDisplayedColumns, mergeArrayByKey } from '@/cube/utils'
import { ref, watchEffect } from 'vue'
import { format } from 'date-fns'
import { osmApi, datosgeoApi } from '@/api'
import { Listbox, ListboxButton, ListboxOptions, ListboxOption } from '@headlessui/vue'
import { CheckIcon, SelectorIcon } from '@heroicons/vue/solid'
import { Popover, PopoverButton, PopoverPanel } from '@headlessui/vue'
import { QuestionMarkCircleIcon } from '@heroicons/vue/outline'

const provinciasImport = await fetch('provincias-argentina.json')
const provincias = await provinciasImport.json()

const titulo = 'Casos activos por departamento'

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
let url = ref('departamentos-buenos_aires.json')

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
      'CovidEdadSexoSNVS.id_evento_caso': 'asc',
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
  url.value = 'departamentos-' + matchArchivo(provinciaSel.value.iso_nombre) + '.json'
  zoom.value = provinciaSel.value.zoom
  forceUpdate()
}
</script>

<template>
  <div class="relative flex flex-col">
    <div class="flex flex-row flex-1 mb-2 shadow-b-xl">
      <div class="flex place-items-center shadow-b-xl">
        <h5 class="pl-2
            border-l-4
            border-light_contrast
            dark:border-dark_contrast
            text-left text-sm
            uppercase
            text-light_contrast
            dark:text-dark_contrast mr-2">{{ titulo }}</h5>
        <Popover class="pr-10 relative">
          <PopoverButton aria-label="Informacion sobre el mapa">
            <QuestionMarkCircleIcon class="w-5" aria-hidden="true"
          /></PopoverButton>
          <PopoverPanel class="text-dark_contrast bg-[#000] absolute z-50 rounded-lg p-3 w-80">
            <p class="text-left text-sm">
              Mapa coropletico interactivo de casos que permite identificar la distribucion de los casos activos en cada
              provincia cada 100.000 habitantes en una fecha determinada.
            </p>
          </PopoverPanel>
        </Popover>
      </div>

      <Listbox v-model="provinciaSel">
        <div class="relative z-40 flex-1 justify-center mt-1 mr-2 basis-1/4">
          <ListboxButton
            class="
              py-2
              pr-10
              pl-3
              w-full
              text-left
              bg-light_smooth
              rounded-lg
              shadow-md
              dark:text-light_contrast
              cursor-default
              focus:outline-none
              sm:text-sm
            "
          >
            <span class="block truncate">{{ provinciaSel.iso_nombre }}</span>
            <span class="flex absolute inset-y-0 right-0 items-center pr-2 pointer-events-none">
              <SelectorIcon class="w-5 h-5 dark:text-color_0_dark text-color_0'" aria-hidden="true" />
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
                bg-light_smooth
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
                    active ? 'bg-light_smooth dark:text-color_0_dark text-color_0' : 'text-dark_base',
                    'relative cursor-default text-left select-none py-2 pl-10 pr-4',
                  ]"
                >
                  <span :class="[selected ? 'font-medium' : 'font-normal', 'block truncate']">{{
                    item.iso_nombre
                  }}</span>
                  <span
                    v-if="selected"
                    class="flex absolute inset-y-0 left-0 items-center pl-3 dark:text-color_0_dark text-color_0'"
                  >
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
          aria-label="Seleccion de fecha"
          v-model="fecha"
          class="
            z-40
            flex-1
            p-1
            dark:text-light_contrast
            pl-3
            mt-1
            text-left
            bg-light_smooth
            rounded-lg
            shadow-xl
            cursor-default
            focus:outline-none
          "
          type="date"
          @change="changeDate"
        />
      </div>
    </div>
    <div class="flex-1 flex flex-row">
      <MapaCoropletico
        :key="key"
        :url="url"
        :provincia="provinciaSel.iso_nombre"
        :center="center"
        :zoom="zoom"
        :datos="datos"
      />
    </div>
  </div>
</template>

<style scoped></style>
