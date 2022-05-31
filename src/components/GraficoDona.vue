<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart, { THEME_KEY } from 'vue-echarts'
import { isDark } from '@/composables'

const props = defineProps<{
  colorTheme: { type: String; default: 'primary' }
  series: object[]
  etiquetas: string[]
  titulo: string
}>()

const colorPalette = ['#b3ecf0', '#80dfe6', '#33ccd6', '#00acb8', '#00868f']

const light_theme_options = ref({
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
    itemSize: 18,
    top: 1,
    right: 5,
    showTitle: true,
    orient: 'vertical',
    feature: {
      dataView: { iconStyle: { borderColor: 'black' }, show: true, readOnly: false },
      magicType: { iconStyle: { borderColor: 'black' }, show: true, type: ['line', 'bar'] },
      dataZoom: {
        iconStyle: { borderColor: 'black' },
        yAxisIndex: 'none',
      },
      restore: { iconStyle: { borderColor: 'black' }, show: true },
      saveAsImage: { iconStyle: { borderColor: 'black' }, show: true },
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

const dark_theme_options = ref({
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
  toolbox: {
    itemSize: 18,
    top: 1,
    right: 5,
    showTitle: true,
    orient: 'vertical',
    feature: {
      dataView: { iconStyle: { borderColor: 'white' }, show: true, readOnly: false },
      magicType: { iconStyle: { borderColor: 'white' }, show: true, type: ['line', 'bar'] },
      dataZoom: {
        iconStyle: { borderColor: 'white' },
        yAxisIndex: 'none',
      },
      restore: { iconStyle: { borderColor: 'white' }, show: true },
      saveAsImage: { iconStyle: { borderColor: 'white' }, show: true },
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
    :class="`w-full relative rounded-lg border-r-4 shadow-lg  bg-light_smooth-50 md:shadow-xl bg-light_base dark:bg-dark_smooth border-${props.colorTheme}`"
  >
    <div class="relative z-10 px-3 py-8">
      <h5 class="p-3 mt-2 font-semibold uppercase text-light_contrast dark:text-dark_contrast">
        {{ titulo }}
      </h5>
      <v-chart class="chart" :option="isDark ? dark_theme_options : light_theme_options" autoresize />
    </div>
  </div>
</template>

<style scoped>
.chart {
  height: 30rem;
}
</style>
