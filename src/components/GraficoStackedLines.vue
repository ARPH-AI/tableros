<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart, { THEME_KEY } from 'vue-echarts'

const props = defineProps<{ series: object[]; etiquetas: string[]; titulo: string; tituloX: string; tituloY: string }>()

const emphasisStyle = {
  focus: 'series',
  lineStyle: {
    width: 3,
  },
}

const stackSeries = (series) => {
  return series.map((item) => {
    return {
      name: item.title,
      data: item.series.map(({ value }) => value),
      type: 'line',
      showSymbol: false,
      emphasis: emphasisStyle,
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
  xAxis: {
    type: 'category',
    name: props.tituloX || 'X',
    nameLocation: 'middle',
    nameGap: 30,
    data: props.etiquetas,
  },
  yAxis: {
    type: 'value',
    name: props.tituloY || 'Y',
    nameLocation: 'middle',
    nameGap: 8,
  },
  grid: {
    top: '30%',
    left: '3%',
    right: '4%',
    bottom: '10%',
    containLabel: true,
  },
  legend: {
    show: true,
    textStyle: {
      color: '#00bfcc',
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
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow',
    },
  },
  series: stackSeries(props.series),
})
</script>

<template>
  <div
    class="
      p-2
      bg-light_smooth-50
      dark:bg-dark_smooth
      shadow
      border-r-4 border-secondary
      rounded-lg
      shadow-lg
      md:shadow-xl
      relative
      w-full
    "
  >
    <h5 class="my-4 text-sm uppercase text-light_contrast dark:text-dark_contrast font-extrabold leading-tight">
      {{ titulo }}
    </h5>
    <div class="justify-center align-center">
      <v-chart class="chart" :option="option" />
    </div>
  </div>
</template>

<style scoped>
.chart {
  height: 30rem;
}
</style>
