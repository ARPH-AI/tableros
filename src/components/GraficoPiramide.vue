<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
<<<<<<< HEAD
import VChart from 'vue-echarts'
import { isDark } from '@/composables'

const props = defineProps<{
  colorTheme: string
=======
import VChart, { THEME_KEY } from 'vue-echarts'
import { isDark } from '@/composables'

const props = defineProps<{
  colorTheme: { type: String; default: 'primary' }
>>>>>>> Nueva version de tablero
  series: object[]
  etiquetas: string[]
  titulo: string
}>()

const createSeries = (series) => {
  return series.map((item, index) => {
    let color = index % 2 ? '#00bfcc' : '#ff6c0a'
    let coeficiente = index % 2 ? 1 : -1
    return {
      name: item.title,
      data: item.series.map(({ value }) => value * coeficiente),
      type: 'bar',
      stack: 'Total',
      itemStyle: {
        color,
        borderRadius: 5,
        opacity: 0.8,
      },
      label: {
        show: false,
      },
      emphasis: {
        focus: 'series',
      },
    }
  })
}

const light_theme_options = ref({
  textStyle: {
    fontFamily: 'monospace',
    fontWeight: 500,
    fontSize: 16,
    color: 'black',
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow',
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
    width: '80%',
    bottom: 12,
    type: 'plain',
    show: true,
    textStyle: {
      color: props.colorTheme,
    },
  },
  grid: {
    left: '3%',
    right: '10%',
    bottom: '20%',
    containLabel: true,
  },
  xAxis: [
    {
      type: 'value',
      axisLabel: {
        formatter: function (value) {
          let label
          if (value < 0) {
            label = value *= -1
          } else label = value
          return label
        },
      },
    },
  ],
  yAxis: [
    {
      type: 'category',
      axisTick: {
        show: false,
      },
      data: props.etiquetas,
    },
  ],
  series: createSeries(props.series),
})

const dark_theme_options = ref({
  textStyle: {
    fontFamily: 'monospace',
    fontWeight: 500,
    fontSize: 16,
    color: 'white',
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow',
      crossStyle: {
        color: '#999',
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
    width: '80%',
    bottom: 12,
    type: 'plain',
    show: true,
    textStyle: {
      color: props.colorTheme,
    },
  },
  grid: {
    top: '2%',
    left: '3%',
    right: '10%',
    bottom: '20%',
    containLabel: true,
  },
  xAxis: [
    {
      type: 'value',
      axisLabel: {
        formatter: function (value) {
          let label
          if (value < 0) {
            label = value *= -1
          } else label = value
          return label
        },
      },
    },
  ],
  yAxis: [
    {
      type: 'category',
      axisTick: {
        show: false,
      },
      data: props.etiquetas,
    },
  ],
  series: createSeries(props.series),
})
</script>

<template>
  <div
    :class="`w-full relative rounded-lg border-r-4 shadow-lg  bg-light_smooth-50 md:shadow-xl bg-light_base dark:bg-dark_smooth border-${props.colorTheme}`"
  >
    <div class="relative z-10 px-3 py-8">
      <h5 class="p-3 mt-2 font-semibold uppercase text-light_contrast dark:text-dark_contrast">{{ titulo }}</h5>
      <v-chart class="chart" :option="isDark ? dark_theme_options : light_theme_options" autoresize />
    </div>
  </div>
</template>

<style scoped>
.chart {
<<<<<<< HEAD
  height: 50vh;
=======
  height: 28rem;
>>>>>>> Nueva version de tablero
}
</style>
