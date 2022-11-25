<script setup lang="ts">
import 'echarts'
import VChart from 'vue-echarts'
import { isDark } from '@/composables'

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
  textStyle: {
    fontFamily: 'monospace',
    fontSize: 14,
    color: 'black',
  },
  tooltip: {
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
    offset: 20
  },
  series: stackSeries(props.series),
}

const dark_theme_options = {
  textStyle: {
    fontFamily: 'monospace',
    fontSize: 14,
    color: 'white',
  },
  tooltip: {
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
    offset: 20
  },
  series: stackSeries(props.series),
}
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
