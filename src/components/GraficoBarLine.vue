<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart, { THEME_KEY } from 'vue-echarts'
import { format } from 'date-fns'
import { es } from 'date-fns/locale'
import { obtenerMinimo, obtenerMaximo, porcentaje } from '@/cube/utils'
import { isDark } from '@/composables'

const props = defineProps<{ seriesLine: number[]; seriesBar: number[]; etiquetas: string[]; titulo: string }>()

const maxLine = obtenerMaximo(props.seriesLine)
const maxBar = obtenerMaximo(props.seriesBar)
const minLine = obtenerMinimo(props.seriesLine)
const minBar = obtenerMinimo(props.seriesBar)
const maximoArr = maxLine > maxBar ? maxLine : maxBar

// Maximo en Y con un X porciento más
const por = 0
const max = Math.ceil(maximoArr + porcentaje(maximoArr, por))
const min = minLine > minBar ? minBar : minLine
const interval = Number((max / 10).toFixed(1))

const etiquetasFormateadas = props.etiquetas.map((item) => format(new Date(item), 'd MMM', { locale: es }))

const option = ref({
  textStyle: {
    fontFamily: 'monospace',
    fontWeight: 500,
    fontSize: 16,
    textBorderColor: '#fe161f',
    textBorderType: 'solid',
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
  legend: {
    data: ['Casos diarios', 'Promedio semanal'],
    textStyle: {
      color: '#00bfcc',
    },
  },
  xAxis: [
    {
      type: 'category',
      data: etiquetasFormateadas,
      axisPointer: {
        type: 'shadow',
      },
    },
  ],
  yAxis: [
    {
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
        color: '#fe161f',
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
      overflow-auto
    "
  >
    <h5 class="my-4 text-sm uppercase text-light_contrast dark:text-dark_contrast font-extrabold leading-tight">
      {{ titulo }}
    </h5>
    <div class="pl-4 pr-2 justify-center align-center">
      <v-chart class="chart" :autoresize="true" :option="option" />
    </div>
  </div>
</template>

<style scoped>
.chart {
  height: 32rem;
}
</style>
