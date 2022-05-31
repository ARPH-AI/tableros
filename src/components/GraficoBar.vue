<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart, { THEME_KEY } from 'vue-echarts'
import { isDark } from '@/composables'

interface Props {
  series: object[]
  etiquetas: string[]
  titulo: string
  stacked?: boolean
  tituloX?: string
  tituloY?: string
  colorTheme?: string
}

const props = withDefaults(defineProps<Props>(), { colorTheme: 'primary', stacked: false, tituloY: 'Y', tituloX: 'X' })

const stackSeries = (series) => {
  return series.map((item, index) => {
    let color = index % 2 ? '#00bfcc' : '#ff6c0a'
    return {
      name: item.title,
      realtimeSort: true,
      data: item.series.map(({ value }) => value),
      ...(props.stacked && { stack: 'total' }),
      type: 'bar',
      itemStyle: {
        opacity: 0.7,
        color,
        barBorderRadius: 3,
      },
    }
  })
}

const light_theme_options = {
  textStyle: {
    fontFamily: 'monospace',
    fontSize: 16,
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
    left: '3%',
    right: '10%',
    bottom: '20%',
    containLabel: true,
  },
  legend: {
    width: '80%',
    bottom: 12,
    type: 'plain',
    show: true,
    textStyle: {
      color: 'black',
    },
  },
  toolbox: {
    itemSize: 18,
    top: 1,
    right: 20,
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
  yAxis: {
    type: 'category',
    name: props.tituloY,
    inverse: true,
    nameLocation: 'middle',
    nameGap: 25,
    data: props.etiquetas,
  },
  xAxis: {
    axisLabel: { verticalAlign: 'bottom', padding: 20 },
    type: 'value',
    name: props.tituloX,
    nameLocation: 'middle',
    nameGap: 25,
    boundaryGap: [0, 0.01],
  },
  series: stackSeries(props.series),
}

const dark_theme_options = {
  textStyle: {
    fontFamily: 'monospace',
    fontSize: 16,
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
    left: '3%',
    right: '10%',
    bottom: '20%',
    containLabel: true,
  },
  legend: {
    width: '80%',
    bottom: 12,
    type: 'plain',
    show: true,
    textStyle: {
      color: 'white',
    },
  },
  toolbox: {
    itemSize: 18,
    top: 1,
    right: 20,
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
  yAxis: {
    type: 'category',
    name: props.tituloY,
    inverse: true,
    nameLocation: 'middle',
    nameGap: 25,
    data: props.etiquetas,
  },
  xAxis: {
    axisLabel: { verticalAlign: 'bottom', padding: 20 },
    type: 'value',
    name: props.tituloX,
    nameLocation: 'middle',
    nameGap: 25,
    boundaryGap: [0, 0.01],
  },
  series: stackSeries(props.series),
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
      <v-chart class="chart" :option="isDark ? dark_theme_options : light_theme_options" autoresize />
    </div>
  </div>
</template>

<style scoped>
.chart {
  height: 30rem;
}
</style>
