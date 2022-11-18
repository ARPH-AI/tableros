<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart from 'vue-echarts'
import { isDark } from '@/composables'
import { formatLeftDataToNaturalNumber, normalizeArgsDecimals } from '@/utils'
import { getThemeByDataSource } from '@/composables'

const props = defineProps<{
  colorTheme: string
  series: object[]
  etiquetas: string[]
  titulo: string
  chartHeight: string
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

const formatTooltip = (args: any) => formatLeftDataToNaturalNumber(normalizeArgsDecimals(args))

const light_theme_options = ref({
  textStyle: {
    fontFamily: 'sans-serif',
    fontSize: 14,
    color: 'black',
  },
  tooltip: {
    formatter: formatTooltip,
    trigger: 'axis',
    axisPointer: {
      type: 'shadow',
      crossStyle: {
        color: '#999',
      },
    }
  },
  toolbox: {
    itemSize: 14,
    top: 20,
    right: 5,
    showTitle: true,
    orient: 'vertical',
    feature: {
      dataView: { title: 'Ver datos', iconStyle: { borderColor: 'black' }, show: true, readOnly: false },
      magicType: { show: false },
      dataZoom: { show: false },
      restore: { title: 'Estado inicial', iconStyle: { borderColor: 'black' }, show: true },
      saveAsImage: { title: 'Descargar como imágen', iconStyle: { borderColor: 'black' }, show: true },
    },
  },
  legend: {
    width: '100%',
    bottom: 12,
    type: 'plain',
    show: true,
    textStyle: {
      color: 'black',
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

const dark_theme_options = ref({
  textStyle: {
    fontFamily: 'sans-serif',
    fontSize: 14,
    color: 'white',
  },
  tooltip: {
    formatter: formatTooltip,
    trigger: 'axis',
    axisPointer: {
      type: 'shadow',
      crossStyle: {
        color: '#999',
      },
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
      dataZoom: { show: false },
      restore: { title: 'Estado inicial', iconStyle: { borderColor: 'white' }, show: true },
      saveAsImage: { title: 'Descargar como imágen', iconStyle: { borderColor: 'white' }, show: true },
    },
  },
  legend: {
    width: '100%',
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
  <Suspense>
    <div
      :class="`sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth dark:bg-dark_smooth dark:border-${props.colorTheme}_dark border-${props.colorTheme}`"
    >
      <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
        <h5 class="pl-2 text-sm uppercase border-l-4 border-light_contrast dark:border-dark_contrast">
          {{ titulo }}
        </h5>
        <v-chart
          :class="`${props.chartHeight}`"
          autoresize
          :option="isDark ? dark_theme_options : light_theme_options"
        />
      </div>
    </div>
    <template #fallback>
      <BaseGraphSkeleton
        styles="sm:h-[38vh] xl:h-[50vh] 2xl:h-[60vh]"
        :color-theme="getThemeByDataSource(props.dataSource)"
      ></BaseGraphSkeleton>
    </template>
  </Suspense>
</template>
