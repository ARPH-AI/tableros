<script setup lang="ts">
import 'echarts'
import VChart from 'vue-echarts'
import { isDark } from '@/composables'
import { formatDecimalValues } from '@/utils'

interface Props {
  series: object[]
  etiquetas: string[]
  titulo: string
  stacked?: boolean
  tituloX?: string
  tituloY?: string
  colorTheme?: string
  chartHeight: string
}

const props = withDefaults(defineProps<Props>(), { colorTheme: 'color_0', stacked: false, tituloY: 'Y', tituloX: 'X' })

const stackSeries = (series) => {
  return series.map((item, index) => {
    let color = index % 2 ? '#ff6c0a' : '#00bfcc'
    return {
      name: item.title,
      realtimeSort: true,
      data: item.series.map(({ value }) => value),
      ...(props.stacked && { stack: 'total' }),
      type: 'bar',
      itemStyle: {
        opacity: 0.7,
        color,
        borderRadius: 3,
      },
    }
  })
}

const light_theme_options = {
  showSpinner: true,
  // Radius of the "spinner". Available since `v4.8.0`.
  spinnerRadius: 10,
  textStyle: {
    fontFamily: 'sans-serif',
    fontSize: 14,
    color: 'black',
  },
  tooltip: {
    formatter: formatDecimalValues,
    trigger: 'axis',
    axisPointer: {
      type: 'shadow', // 'shadow' as default; can also be 'line' or 'shadow'
      crossStyle: {
        color: '#999',
      },
    },
  },
  grid: {
    top: '8%',
    bottom: '35%',
    left: '40%',
  },
  legend: {
    width: '100%',
    bottom: -7,
    type: 'plain',
    show: true,
    textStyle: {
      color: 'black',
    },
  },
  toolbox: {
    itemSize: 14,
    top: 20,
    right: 5,
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
  yAxis: {
    type: 'category',
    name: props.tituloY,
    inverse: true,
    nameLocation: 'middle',
    nameGap: 25,
    data: props.etiquetas,
  },
  xAxis: {
    axisLabel: { verticalAlign: 'bottom', paddingTop: 20 },
    type: 'value',
    name: props.tituloX,
    nameLocation: 'middle',
    nameGap: 25,
    boundaryGap: [0, 0.01],
    offset: 20,
  },
  series: stackSeries(props.series),
}

const dark_theme_options = {
  textStyle: {
    fontFamily: 'sans-serif',
    fontSize: 14,
    color: 'white',
  },
  tooltip: {
    formatter: formatDecimalValues,
    trigger: 'axis',
    axisPointer: {
      type: 'shadow', // 'shadow' as default; can also be 'line' or 'shadow'
      crossStyle: {
        color: '#999',
      },
    },
  },
  grid: {
    top: '8%',
    bottom: '35%',
    //containLabel: true,
    left: '40%',
  },
  legend: {
    width: '100%',
    bottom: -7,
    type: 'plain',
    show: true,
    textStyle: {
      color: 'white',
    },
  },
  toolbox: {
    itemSize: 14,
    top: 20,
    right: 5,
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
  yAxis: {
    type: 'category',
    name: props.tituloY,
    inverse: true,
    nameLocation: 'middle',
    nameGap: 25,
    data: props.etiquetas,
  },
  xAxis: {
    axisLabel: { verticalAlign: 'bottom', paddingTop: 20 },
    type: 'value',
    name: props.tituloX,
    nameLocation: 'middle',
    nameGap: 25,
    boundaryGap: [0, 0.01],
    offset: 20,
  },
  series: stackSeries(props.series),
}
</script>

<template>
  <v-chart
    v-if="props.series.length > 0"
    :class="`${props.chartHeight}`"
    autoresize
    :option="isDark ? dark_theme_options : light_theme_options"
  />
  <no-data-found v-else :chart-height="props.chartHeight"></no-data-found>
</template>
