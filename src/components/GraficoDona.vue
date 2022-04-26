<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart, { THEME_KEY } from 'vue-echarts'

const props = defineProps<{ series: object[]; etiquetas: string[]; titulo: string }>()

console.log(props.series, props.etiquetas)
const colorPalette = ['#b3ecf0', '#80dfe6', '#33ccd6', '#00acb8', '#00868f']

const option = ref({
  textStyle: {
    fontFamily: 'monospace',
    fontWeight: 500,
    fontSize: 16,
    textBorderColor: '#fe161f',
    textBorderType: 'solid',
  },
  tooltip: {
    trigger: 'item',
    formatter: '{b}<br /><b>{c}%',
  },
  darkMode: true,
  toolbox: {
    orient: 'vertical',
    feature: {
      dataView: { show: true, readOnly: false },
      magicType: { show: true, type: ['line', 'bar'] },
      dataZoom: {
        yAxisIndex: 'none',
      },
      restore: { show: true },
      saveAsImage: { show: true },
    },
  },
  series: [
    {
      type: 'pie',
      radius: ['40%', '70%'],
      avoidLabelOverlap: false,
      itemStyle: {
        borderRadius: 7,
        borderColor: '#fff',
        borderWidth: 2,
        normal: {
          label: {
            show: true,
            position: 'inner',
            formatter: function (params) {
              return params.name
            },
          },
          labelLine: {
            show: true,
          },
        },
        emphasis: {
          label: {
            show: true,
            fontSize: '20',
            fontWeight: 'bold',
          },
        },
      },
      data: [
        { value: 20, name: 'Ninguna' },
        { value: 30, name: '1' },
        { value: 24, name: '2' },
        { value: 15, name: '3' },
        { value: 11, name: '4 o más' },
      ],
    },
  ],
  color: colorPalette,
})
</script>

<template>
  <div
    class="
      p-2
      bg-light_smooth-50
      dark:bg-dark_smooth
      shadow
      border-r-4 border-secondary
      rounded-lg
      shadow-lg
      md:shadow-xl
      relative
    "
  >
    <h5 class="my-4 text-sm uppercase text-light_contrast dark:text-dark_contrast font-extrabold leading-tight">
      {{ titulo }}
    </h5>
    <div class="px-2 justify-center align-center">
      <v-chart class="chart" :option="option" :autoresize="true" />
    </div>
  </div>
</template>

<style scoped>
.chart {
  height: 400px;
  width: 100%;
}
</style>
