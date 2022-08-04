<script setup lang="ts">
import 'echarts'
import VChart from 'vue-echarts'
import { format } from 'date-fns'
import { es } from 'date-fns/locale'
import { obtenerMinimo, obtenerMaximo, porcentaje } from '@/cube/utils'
import { isDark } from '@/composables'

const props = defineProps<{
  colorTheme: string
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
    top: '12%',
    left: '1%',
    right: '5%',
    bottom: '16%',
    containLabel: true,
  },
  textStyle: {
    fontFamily: 'monospace',
    fontSize: 14,
    color: 'black',
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross',
      crossStyle: {
        color: 'black',
      },
    },
  },
  toolbox: {
    top: 20,
    itemSize: 14,
    right: 0,
    showTitle: true,
    orient: 'vertical',
    feature: {
      dataView: { title: 'Ver datos', iconStyle: { borderColor: 'black' }, show: true, readOnly: false },
      magicType: { show: false },
      dataZoom: {
        iconStyle: { borderColor: 'black' },
        yAxisIndex: 'none',
      },
      restore: { title: 'Estado inicial', iconStyle: { borderColor: 'black' }, show: true },
      saveAsImage: { title: 'Descargar como imágen', iconStyle: { borderColor: 'black' }, show: true },
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
      // nameLocation: 'middle',
      // nameGap: 50,
      // axisLabel: { verticalAlign: 'top', padding: 20 },
      type: 'category',
      data: etiquetasFormateadas,
      axisPointer: {
        type: 'shadow',
      },
    },
  ],
  yAxis: [
    {
      // nameLocation: 'middle',
      // nameGap: 40,
      // nameTextStyle: { align: 'middle', padding: 10 },
      type: 'value',
      // name: 'Casos',
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
    top: '12%',
    left: '1%',
    right: '5%',
    bottom: '16%',
    containLabel: true,
  },
  textStyle: {
    fontFamily: 'monospace',
    fontSize: 14,
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
    top: 20,
    itemSize: 14,
    right: 0,
    showTitle: true,
    orient: 'vertical',
    feature: {
      dataView: { title: 'Ver datos', iconStyle: { borderColor: 'white' }, show: true, readOnly: false },
      magicType: { show: false },
      dataZoom: {
        iconStyle: { borderColor: 'white' },
        yAxisIndex: 'none',
      },
      restore: { title: 'Estado inicial', iconStyle: { borderColor: 'white' }, show: true },
      saveAsImage: { title: 'Descargar como imágen', iconStyle: { borderColor: 'white' }, show: true },
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
      // nameLocation: 'middle',
      // nameGap: 50,
      // axisLabel: { verticalAlign: 'top', padding: 20 },
      type: 'category',
      data: etiquetasFormateadas,
      axisPointer: {
        type: 'shadow',
      },
    },
  ],
  yAxis: [
    {
      // nameLocation: 'middle',
      // nameGap: 40,
      // nameTextStyle: { align: 'middle', padding: 10 },
      type: 'value',
      // name: 'Casos',
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
    :class="`sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth-50 dark:bg-dark_smooth border-${props.colorTheme}`"
  >
    <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
      <h5 class="pl-2 text-sm uppercase border-l-4">
        {{ titulo }}
      </h5>
      <v-chart
        class="sm:h-[38vh] xl:h-[41vh] 2xl:h-[54vh]"
        autoresize
        :option="isDark ? dark_theme_options : light_theme_options"
      />
    </div>
  </div>
</template>
