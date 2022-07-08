<script setup lang="ts">
import 'echarts'
import VChart from 'vue-echarts'
import { format } from 'date-fns'
import { es } from 'date-fns/locale'
import { obtenerMinimo, obtenerMaximo, porcentaje } from '@/cube/utils'
import { isDark } from '@/composables'

const props = defineProps<{
  colorTheme: { type: string; default: 'primary' }
  seriesLine: number[]
  seriesBar: number[]
  etiquetas: string[]
  titulo: string
}>()

const maxLine = obtenerMaximo(props.seriesLine)
const maxBar = obtenerMaximo(props.seriesBar)
const minLine = obtenerMinimo(props.seriesLine)
const minBar = obtenerMinimo(props.seriesBar)
const maximoArr = maxLine > maxBar ? maxLine : maxBar

// Maximo en Y con un X porciento más
const por = 0
const max = Math.ceil(maximoArr + porcentaje(maximoArr, por))
const min = minLine > minBar ? minBar : minLine
// const interval = Number((max / 10).toFixed(1))

const etiquetasFormateadas = props.etiquetas.map((item) => format(new Date(item), 'd MMM', { locale: es }))

const light_theme_options = {
  grid: {
    top: '2%',
    left: '3%',
    right: '10%',
    bottom: '30%',
    containLabel: true,
  },
  textStyle: {
    fontFamily: 'monospace',
    fontSize: 16,
    color: 'black',
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross',
      crossStyle: {
        color: '#999',
      },
    },
  },
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
  legend: {
    data: ['Casos diarios', 'Promedio semanal'],
    bottom: 0,
    textStyle: {
      color: 'black',
    },
  },
  xAxis: [
    {
      nameLocation: 'middle',
      nameGap: 60,
      name: 'Promedio Semanal',
      axisLabel: { verticalAlign: 'top', padding: 20 },
      type: 'category',
      data: etiquetasFormateadas,
      axisPointer: {
        type: 'shadow',
      },
    },
  ],
  yAxis: [
    {
      nameLocation: 'middle',
      nameGap: 40,
      nameTextStyle: { align: 'middle', padding: 10 },
      type: 'value',
      name: 'Casos',
      min,
      max,
    },
  ],
  series: [
    {
      name: 'Casos diarios',
      type: 'bar',
      itemStyle: {
        color: '#00bfcc',
        borderRadius: 3,
        opacity: 0.4,
      },
      emphasis: {
        focus: 'series',
      },
      data: props.seriesBar,
    },
    {
      name: 'Promedio semanal',
      type: 'line',
      lineStyle: {
        color: '#ff6c0a',
      },
      itemStyle: {
        color: '#ff6c0a',
      },
      emphasis: {
        focus: 'series',
      },
      data: props.seriesLine,
    },
  ],
}

const dark_theme_options = {
  grid: {
    top: '2%',
    left: '3%',
    right: '10%',
    bottom: '30%',
    containLabel: true,
  },
  textStyle: {
    fontFamily: 'monospace',
    fontSize: 16,
    color: 'white',
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross',
      crossStyle: {
        color: 'white',
      },
    },
  },
  toolbox: {
    itemSize: 18,
    top: 1,
    right: 5,
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
  legend: {
    data: ['Casos diarios', 'Promedio semanal'],
    bottom: 0,
    textStyle: {
      color: 'white',
    },
  },
  xAxis: [
    {
      nameLocation: 'middle',
      nameGap: 60,
      name: 'Promedio Semanal',
      axisLabel: { verticalAlign: 'top', padding: 20 },
      type: 'category',
      data: etiquetasFormateadas,
      axisPointer: {
        type: 'shadow',
      },
    },
  ],
  yAxis: [
    {
      nameLocation: 'middle',
      nameGap: 40,
      nameTextStyle: { align: 'middle', padding: 10 },
      type: 'value',
      name: 'Casos',
      min,
      max,
    },
  ],
  series: [
    {
      name: 'Casos diarios',
      type: 'bar',
      itemStyle: {
        color: '#00bfcc',
        borderRadius: 3,
        opacity: 0.4,
      },
      emphasis: {
        focus: 'series',
      },
      data: props.seriesBar,
    },
    {
      name: 'Promedio semanal',
      type: 'line',
      lineStyle: {
        color: '#ff6c0a',
      },
      itemStyle: {
        color: '#ff6c0a',
      },
      emphasis: {
        focus: 'series',
      },
      data: props.seriesLine,
    },
  ],
}
</script>

<template>
  <div
    :class="`w-full relative rounded-lg border-r-4 shadow-lg  bg-light_smooth-50 md:shadow-xl bg-light_base dark:bg-dark_smooth border-${props.colorTheme}`"
  >
    <div class="relative z-10 px-3 py-8">
      <h5 class="p-3 mt-2 font-semibold uppercase text-light_contrast dark:text-dark_contrast">
        {{ titulo }}
      </h5>
      <v-chart class="chart" autoresize :option="isDark ? dark_theme_options : light_theme_options" />
    </div>
  </div>
</template>

<style scoped>
.chart {
  height: 44vh;
}
</style>
