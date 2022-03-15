<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart, { THEME_KEY } from 'vue-echarts'
import { format } from 'date-fns'
import { es } from 'date-fns/locale'
import { obtenerMinimo, obtenerMaximo, porcentaje } from '@/cube/utils'

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
const interval = 0.5

const etiquetasFormateadas = props.etiquetas.map((item) => format(new Date(item), 'd MMM', { locale: es }))

const option = ref({
  textStyle: {
    fontFamily: 'Roboto',
    fontWeight: 400,
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
      interval,
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
})
</script>

<template>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title p-3 border bg-light">{{ titulo }}</h5>
      <v-chart class="chart" :option="option" />
    </div>
  </div>
</template>

<style scoped>
.chart {
  height: 500px;
  width: 100%;
}
</style>
