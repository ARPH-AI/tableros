<script setup lang="ts">
import { ref, reactive, inject } from 'vue'
import { getThemeByDataSource } from '@/composables'

const props = defineProps<{ url: string; provincia: string; center: number[]; zoom: number; datos: object[] }>()

// Eventos  de cambio
const emit = defineEmits(['zoomChanged'])

// Data sobre poblacion en departamentos
const poblacionImport = await fetch('poblacion_por_departamento.json')
const poblacion = await poblacionImport.json()

// Estados locales

let depsFromProv = []
let depsFromProvObj = {}

// Configuracion del mapa
const projection = ref('EPSG:4326')
const rotation = ref(0)
const format = inject('ol-format')
const geoJson = new format.GeoJSON()

// Estilos del mapa
const lineColor = 'rgba(0,0,0,0.4)'
const lineColorSelected = '#FFFF'
const fillColorSelected = 'rgba(0,0,0,0.3)'
const fillColorDefault = '#F3F4F6'

// Escala
const gradiente = ['#FFFFFF', '#FFFFCC', '#FFEDA0', '#FED976', '#FEB24C', '#FD8D3C', '#FC4E2A', '#E31A1C', '#B10026']
const criteria = [
  (x) => (x < 10),
  (x) => (x >= 10 && x < 50),
  (x) => (x >= 50 && x < 100),
  (x) => (x >= 100 && x < 200),
  (x) => (x >= 200 && x < 400),
  (x) => (x >= 400 && x < 800),
  (x) => (x >= 800 && x < 1600),
  (x) => (x >= 1600),
]

const scaleCriteria = [
  { color: 'coroplethic_0', reference: '10', id: 0 },
  { color: 'coroplethic_1', reference: '50', id: 1 },
  { color: 'coroplethic_2', reference: '100', id: 2 },
  { color: 'coroplethic_3', reference: '200', id: 3 },
  { color: 'coroplethic_4', reference: '400', id: 4 },
  { color: 'coroplethic_5', reference: '800', id: 5 },
  { color: 'coroplethic_6', reference: '1600', id: 6 },
  { color: 'coroplethic_7', reference: 'x > 1600', id: 7 },
]

const fnCompare = new Intl.Collator('es', {
  sensitivity: 'base',
  ignorePunctuation: true,
}).compare

const provinciaAsKey = props.provincia
  .toUpperCase()
  .normalize('NFD')
  .replace(/[\u0300-\u036f]/g, '')
const departamentos = Object.keys(poblacion[provinciaAsKey]) || []
let muestra = 100000
let casos
let casos_obj
let poblacion_depto
let encontro

for (let i = 0; i < departamentos.length; i++) {
  encontro = 0
  for (let j = 0; j < props.datos.length; j++) {
    if (fnCompare(props.datos[j].nombre, departamentos[i]) == 0) {
      poblacion_depto = poblacion[provinciaAsKey][departamentos[i]]['2021'] || muestra
      casos = (props.datos[j].valor * muestra) / poblacion_depto
      casos_obj = { dep: departamentos[i], cant: props.datos[j].valor, tasa: casos }
      depsFromProv.push(casos_obj)
      depsFromProvObj[departamentos[i]] = casos_obj
      encontro = 1
      break
    }
  }
  if (encontro == 0) {
    casos_obj = { dep: departamentos[i], cant: 0, tasa: 0 }
    depsFromProv.push(casos_obj)
    depsFromProvObj[departamentos[i]] = casos_obj
  }
}

// Ordenando lista de cosas por tasa
const orderDesc = (a, b) => b.tasa - a.tasa
depsFromProv = depsFromProv.sort(orderDesc)

const overrideStyleFunction = (feature, style) => {
  let color = fillColorDefault

  let casos = depsFromProvObj[feature.get('departamento')]
  if (casos !== undefined) {
    for (let idx = 0; idx < criteria.length; idx++) {
      if (criteria[idx](casos.tasa) == true) {
        color = gradiente[idx]
        break
      }
    }
  } else {
    console.log('Departamento no encontrado: ' + feature.get('departamento'))
  }
  style.getFill().setColor(color)
}

const onZoomChanged = (currentZoom) => {
  emit('zoomChanged', currentZoom)
}

const departNombre = ref('departamento')
const casosCant = ref('0')
const casosTasa = ref('0')

const selectConditions = inject('ol-selectconditions')
const selectCondition = selectConditions.pointerMove

const featureSelected = (event) => {
  if (event.selected.length >= 1) {
    let feature = event.target.features_.array_[0].values_
    let { cant, tasa } = depsFromProvObj[feature.departamento]
    casosTasa.value = tasa.toString()
    casosCant.value = cant.toString()
    departNombre.value = feature.departamento
  }
}

const selectInteactionFilter = (feature) => {
  return feature.get('departamento') != undefined
}
</script>

<template>
  <div class="flex w-full h-full">
    <ol-map
      :load-tiles-while-animating="true"
      :load-tiles-while-interacting="true"
      class="flex w-full overflow-hidden flex-1 h-[64vh] 2xl:h-[68vh] rounded-xl shadow-2xl"
    >
      <ol-view
        ref="view"
        :center="center"
        :rotation="rotation"
        :zoom="zoom"
        :projection="projection"
        @zoomChanged="onZoomChanged"
      />
      <ol-tile-layer class="z-50 shadow-2xl">
        <ol-source-osm />
      </ol-tile-layer>

      <ol-interaction-select :condition="selectCondition" :filter="selectInteactionFilter" @select="featureSelected">
        <ol-style>
          <ol-style-stroke :color="lineColorSelected" :width="5"></ol-style-stroke>
          <ol-style-text></ol-style-text>
          <ol-style-fill :color="fillColorSelected"></ol-style-fill>
        </ol-style>
      </ol-interaction-select>

      <ol-vector-layer>
        <ol-source-vector class="z-50 shadow-2xl" :url="url" :format="geoJson">
          <ol-style :override-style-function="overrideStyleFunction">
            <ol-style-stroke :color="lineColor" :width="1"></ol-style-stroke>
            <ol-style-fill></ol-style-fill>
            <ol-style-text></ol-style-text>
          </ol-style>
        </ol-source-vector>
      </ol-vector-layer>
      <ol-zoom-control />
    </ol-map>
    <GeoInfoCard
      class="w-60 z-80 h-48 bottom-[8%] right-[60%] xl:bottom-[4%] xl:right-[30%] 2xl:right-[21%] absolute shadow-2xl"
      :titulo="departNombre"
      :color-theme="getThemeByDataSource('snvs')"
      :cantidad="casosCant"
      :tasa="casosTasa"
    ></GeoInfoCard>
    <TableCard
      :titulos-mostrados="['Departamento', 'Cantidad', 'Tasa']"
      :color-theme="getThemeByDataSource('snvs')"
      class="w-1/4 2xl:w-96 ml-3"
      :datos="depsFromProv"
      :titulos-columnas="['Departamento', 'Cantidad', 'Tasa']"
    />
    <CoroplethicMapScale
      class="z-80 w-38 top-[26%] 2xl:top-[18%] left-[0.5%] absolute"
      :references="scaleCriteria"
      :color-theme="getThemeByDataSource('snvs')"
    ></CoroplethicMapScale>
  </div>
</template>

<style scoped></style>
