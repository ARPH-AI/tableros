<script setup lang="ts">
import { ref, inject } from 'vue'
const props = defineProps<{ url: string; provincia: string; center: number[]; zoom: number; datos: object[] }>()
const emit = defineEmits(['zoomChanged'])

const projection = ref('EPSG:4326')
const rotation = ref(0)
const format = inject('ol-format')
const geoJson = new format.GeoJSON()
const lineColor = 'rgba(0,0,0,0.4)'
const lineColorSelected = 'rgba(255,0,0,1)'
const fillColorSelected = 'rgba(0,0,0,0.3)'
const fillColorDefault = 'rgba(0,0,0,0.2)'
const gradiente = [
  'rgba(233,62,58,0.7)',
  'rgba(237,104,60,0.7)',
  'rgba(243,144,63,0.7)',
  'rgba(253,199,12,0.7)',
  'rgba(255,243,59,0.7)',
]
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
  let color = fillColorDefault
  let idx
  for (let i = 0; i < props.datos.length; i++) {
    console.log(
      props.datos[i].nombre,
      feature.get('cabecera'),
      feature.get('departamento'),
      feature.get('provincia'),
      props.provincia
    )
    if (fnCompare(props.datos[i].nombre, feature.get('departamento')) == 0) {
      for (idx = 0; idx < criteria.length; idx++) {
        if (criteria[idx](props.datos[i].valor) == true) {
          color = gradiente[idx]
          break
        }
      }
      break
    }
  }
  style.getFill().setColor(color)
  style.getText().setText(` ${feature.get('departamento')}`)
  style.getText().setOverflow(true)
}

const onZoomChanged = (currentZoom) => {
  emit('zoomChanged', currentZoom)
}

const selectConditions = inject('ol-selectconditions')
const selectCondition = selectConditions.pointerMove;
const featureSelected = (event) => {
	console.log(event)
}
const selectInteactionFilter = (feature) => {
	return feature.get('departamento') != undefined;
};

</script>

<template>
  <ol-map
    :load-tiles-while-animating="true"
    :load-tiles-while-interacting="true"
    class="flex overflow-hidden flex-1 h-96 rounded-xl shadow-2xl"
  >
    <ol-view
      ref="view"
      :center="center"
      :rotation="rotation"
      :zoom="zoom"
      :projection="projection"
      @zoomChanged="onZoomChanged"
    />
    <ol-tile-layer>
      <ol-source-osm />
    </ol-tile-layer>
    <ol-zoom-control />

    <ol-interaction-select @select="featureSelected" :condition="selectCondition" :filter="selectInteactionFilter" >
        <ol-style>
            <ol-style-stroke :color="lineColorSelected" :width="5"></ol-style-stroke>
            <ol-style-fill :color="fillColorSelected"></ol-style-fill>
        </ol-style>
    </ol-interaction-select>

    <ol-vector-layer>
      <ol-source-vector :url="url" :format="geoJson">
        <ol-style :override-style-function="overrideStyleFunction">
          <ol-style-stroke :color="lineColor" :width="1"></ol-style-stroke>
          <ol-style-fill></ol-style-fill>
          <ol-style-text></ol-style-text>
        </ol-style>
      </ol-source-vector>
    </ol-vector-layer>
  </ol-map>
</template>

<style scoped></style>
