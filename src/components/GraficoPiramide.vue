<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart, { THEME_KEY } from 'vue-echarts'

const props = defineProps<{ series: object[]; etiquetas: string[]; titulo: string }>()

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
        barBorderRadius: 5,
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

const option = ref({
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow',
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
    textStyle: {
      color: '#00bfcc',
    },
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
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
    class="
      border-r-4 border-secondary
      rounded-lg
      bg-light_smooth-50
      shadow-lg
      md:shadow-xl
      relative
      bg-light_base
      dark:bg-dark_smooth
      shadow
    "
  >
    <div class="p-3 pt-8 pb-10 relative z-10">
      <h5 class="p-3 font-semibold">{{ titulo }}</h5>
      <v-chart class="chart" :option="option" :autoresize="true" />
    </div>
  </div>
</template>

<style scoped>
.chart {
  height: 25rem;
}
</style>
