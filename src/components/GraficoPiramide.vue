<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart, { THEME_KEY } from 'vue-echarts'

const props = defineProps<{ series: object[]; etiquetas: string[]; titulo: string }>()

const createSeries = (series) => {
  return series.map((item, index) => {
    let color = index % 2 ? '#6a34e6' : '#34e6c3'
    let coeficiente = index % 2 ? 1 : -1
    return {
      name: item.title,
      data: item.series.map(({ value }) => value * coeficiente),
      type: 'bar',
      stack: 'Total',
      itemStyle: {
        color,
        shadowColor: '#91cc75',
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
  legend: {},
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
  <div class="card">
    <div class="card-body">
      <h5 class="card-title p-3 border bg-light">{{ titulo }}</h5>
      <v-chart class="chart" :option="option" />
    </div>
  </div>
</template>

<style scoped>
.chart {
  height: 400px;
  width: 100%;
}
</style>
