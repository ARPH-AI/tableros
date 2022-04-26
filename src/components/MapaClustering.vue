<script setup lang="ts">
import { ref } from 'vue'
const props = defineProps<{ center: number[]; zoom: number; coords: number[] }>()

const projection = ref('EPSG:4326')
const rotation = ref(0)

const overrideStyleFunction = (feature, style) => {
  let clusteredFeatures = feature.get('features')
  let size = clusteredFeatures.length

  let color = size > 20 ? '192,0,0' : size > 8 ? '255,128,0' : '0,128,0'
  var radius = Math.max(8, Math.min(size, 20))
  let dash = (2 * Math.PI * radius) / 6
  let calculatedDash = [0, dash, dash, dash, dash, dash, dash]

  style.getImage().getStroke().setLineDash(dash)
  style
    .getImage()
    .getStroke()
    .setColor('rgba(' + color + ',0.5)')
  style.getImage().getStroke().setLineDash(calculatedDash)
  style
    .getImage()
    .getFill()
    .setColor('rgba(' + color + ',1)')

  style.getImage().setRadius(radius)

  style.getText().setText(size.toString())
}

const featureSelected = (event) => {
  console.log(event)
}
</script>

<template>
  <ol-map :load-tiles-while-animating="true" :load-tiles-while-interacting="true" style="height: 36rem">
    <ol-view ref="view" :center="center" :rotation="rotation" :zoom="zoom" :projection="projection" />

    <ol-tile-layer>
      <ol-source-osm />
    </ol-tile-layer>

    <ol-interaction-clusterselect :point-radius="20" @select="featureSelected">
      <ol-style>
        <ol-style-stroke color="green" :width="5"></ol-style-stroke>
        <ol-style-fill color="rgba(255,255,255,0.5)"></ol-style-fill>
      </ol-style>
    </ol-interaction-clusterselect>

    <ol-animated-clusterlayer :animation-duration="500" :distance="40">
      <ol-source-vector ref="vectorsource">
        <ol-feature v-for="(coord, index) in coords" :key="index">
          <ol-geom-point :coordinates="coord"></ol-geom-point>
        </ol-feature>
      </ol-source-vector>

      <ol-style :override-style-function="overrideStyleFunction">
        <ol-style-stroke color="red" :width="2"></ol-style-stroke>
        <ol-style-fill color="rgba(255,255,255,0.1)"></ol-style-fill>

        <ol-style-circle :radius="20">
          <ol-style-stroke color="black" :width="15" :line-dash="[]" line-cap="butt"></ol-style-stroke>
          <ol-style-fill color="black"></ol-style-fill>
        </ol-style-circle>

        <ol-style-text>
          <ol-style-fill color="white"></ol-style-fill>
        </ol-style-text>
      </ol-style>
    </ol-animated-clusterlayer>
  </ol-map>
</template>

<style scoped></style>
