<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart, { THEME_KEY } from 'vue-echarts'

const props = defineProps<{ series: object[]; etiquetas: string[]; titulo: string }>()

const stackSeries = (series) => {
  return series.map((item) => {
    return {
      name: item.title,
      data: item.series.map(({ value }) => value),
      stack: 'total',
      type: 'bar',
      itemStyle: { opacity: 0.7 },
    }
  })
}

const option = ref({
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow', // 'shadow' as default; can also be 'line' or 'shadow'
    },
  },
  legend: {},
  yAxis: {
    type: 'value',
  },
  xAxis: {
    data: props.etiquetas,
  },
  series: stackSeries(props.series),
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
