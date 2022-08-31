<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart from 'vue-echarts'
import { isDark } from '@/composables'

const props = defineProps<{
  colorTheme: string
  series: object[]
  titulo: string
  chartHeight: string
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
      data: props.series,
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
      data: props.series,
    },
  ],
  color: colorPalette,
})
</script>

<template>
  <div
    :class="`sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth dark:bg-dark_smooth dark:border-${props.colorTheme}_dark border-${props.colorTheme}`"
  >
    <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
      <h5 class="pl-2 text-sm uppercase border-l-4 border-light_contrast dark:border-dark_contrast">
        {{ titulo }}
      </h5>
      <v-chart :class="`${props.chartHeight}`" autoresize :option="isDark ? dark_theme_options : light_theme_options" />
    </div>
  </div>
</template>
