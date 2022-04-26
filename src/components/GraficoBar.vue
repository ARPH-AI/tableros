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
}

const props = withDefaults(defineProps<Props>(), { stacked: false, tituloY: 'Y', tituloX: 'X' })

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
      type: 'shadow', // 'shadow' as default; can also be 'line' or 'shadow'
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
  grid: {
    top: '20%',
    left: '2%',
    right: '2%',
    bottom: '10%',
    containLabel: true,
  },
  legend: {
    show: true,
    textStyle: {
      color: '#00bfcc',
    },
  },
  yAxis: {
    type: 'category',
    name: props.tituloY,
    inverse: true,
    nameLocation: 'middle',
    nameGap: 85,
    data: props.etiquetas,
  },
  xAxis: {
    type: 'value',
    name: props.tituloX,
    nameLocation: 'middle',
    nameGap: 25,
    boundaryGap: [0, 0.01],
  },
  series: stackSeries(props.series),
})
</script>

<template>
  <div
    class="
      border-r-4 border-secondary
      rounded-lg
      shadow-lg
      md:shadow-xl
      relative
      overflow-auto
      bg-light_base
      dark:bg-dark_smooth
      shadow
    "
  >
    <div class="pt-8 pb-10 relative z-10">
      <h5 class="my-4 text-sm uppercase text-light_contrast dark:text-dark_contrast font-extrabold leading-tight">
        {{ titulo }}
      </h5>
      <v-chart class="chart" :option="option" :autoresize="true" />
    </div>
  </div>
</template>

<style scoped>
.chart {
  width: 100%;
  height: 30rem;
}
</style>
