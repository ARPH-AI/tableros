<script setup lang="ts">
import { ref, reactive, inject } from 'vue'
import { ScaleLine, defaults as defaultControls } from 'ol/control'
import Popper from 'vue3-popper'
import GeoInfoCard from './GeoInfoCard.vue'
import { getThemeByDataSource } from '@/composables'

const props = defineProps<{ url: string; provincia: string; center: number[]; zoom: number; datos: object[] }>()
const emit = defineEmits(['zoomChanged'])

const depsFromProv = reactive({})
const projection = ref('EPSG:4326')
const rotation = ref(0)
const format = inject('ol-format')
const geoJson = new format.GeoJSON()
const lineColor = 'rgba(0,0,0,0.4)'
const lineColorSelected = '#FFFF'
const fillColorSelected = 'rgba(0,0,0,0.3)'
const fillColorDefault = '#F3F4F6'
const gradiente = ['#F3F4F6', '#36CAD5', '#6CD6DE', '#A2E2E8', '#D8EEF1']
const criteria = [
  (x) => x < 10,
  (x) => x >= 10 && x < 20,
  (x) => x >= 20 && x < 30,
  (x) => x >= 30 && x < 40,
  (x) => x >= 40,
]

const fnCompare = new Intl.Collator('es', {
  sensitivity: 'base',
  ignorePunctuation: true,
}).compare

const overrideStyleFunction = (feature, style) => {
  // Se ejecuta cada vez que se selecciona otro departamento haciendo hover sobre el mapa!
  console.log(feature.get('departamento'), 'feature dep')
  let color = fillColorDefault
  let idx

  for (let i = 0; i < props.datos.length; i++) {
    console.log('ffff')
    if (fnCompare(props.datos[i].nombre, feature.get('departamento')) == 0) {
      for (idx = 0; idx < criteria.length; idx++) {
        if (criteria[idx](props.datos[i].valor) == true) {
          color = gradiente[idx]
          break
        }
      }
      if (!(props.provincia in depsFromProv)) {
        depsFromProv[props.provincia] = []
      } else {
        depsFromProv[props.provincia].push({ dep: feature.get('departamento'), cant: props.datos[i].valor })
      }
      break
    }
  }
  style.getFill().setColor(color)
}

const onZoomChanged = (currentZoom) => {
  emit('zoomChanged', currentZoom)
}

const departNombre = ref('')
const casosCant = ref(0)

const selectConditions = inject('ol-selectconditions')
const selectCondition = selectConditions.pointerMove

const featureSelected = (event) => {
  let cant = 0
  const feature = event.target.features_.array_[0].values_
  for (let i = 0; i < props.datos.length; i++) {
    if (fnCompare(props.datos[i].nombre, feature.departamento) == 0) {
      cant = props.datos[i].valor
    }
  }
  departNombre.value = feature.departamento
  casosCant.value = cant
}
const selectInteactionFilter = (feature) => {
  console.log(feature, 'feature')
  return feature.get('departamento') != undefined
}
</script>

<template>
  <ol-map
    :load-tiles-while-animating="true"
    :load-tiles-while-interacting="true"
    class="flex overflow-hidden flex-1 h-[58vh] 2xl:h-[68vh] rounded-xl shadow-2xl"
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

    <ol-scaleline-control text class="ol-scale-line" bar />

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
    class="w-60 z-80 h-30 bottom-[8%] right-[28%] absolute shadow-2xl"
    :titulo="departNombre"
    :color-theme="getThemeByDataSource('snvs')"
    :cantidad="Number(casosCant).toLocaleString()"
  ></GeoInfoCard>
  <TableCard
    class="w-80 ml-3"
    :datos="depsFromProv[props.provincia]"
    titulo="Casos por departamento"
    :titulos-columnas="['Departamento', 'Cantidad']"
  />
</template>

<style scoped></style>
