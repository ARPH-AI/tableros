<script setup lang="ts">
import { ref } from 'vue'
import 'echarts'
import VChart from 'vue-echarts'
import { isDark } from '@/composables'

const props = defineProps<{
  colorTheme: string
  series: object[]
  etiquetas: string[]
  titulo: string
  tituloX: string
  tituloY: string
}>()

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
const light_theme_options = ref({
  textStyle: {
    fontFamily: 'monospace',
    fontSize: 16,
    color: 'black',
  },
  xAxis: {
    type: 'category',
    name: props.tituloX || 'X',
    nameLocation: 'middle',
    nameGap: 35,
    data: props.etiquetas,
  },
  yAxis: {
    type: 'value',
    name: props.tituloY || 'Y',
    nameLocation: 'middle',
    nameGap: 65,
  },
  grid: {
    top: '8%',
    left: '4%',
    right: '10%',
    bottom: '30%',
    containLabel: true,
  },
  legend: {
    width: '100%',
    bottom: 1,
    type: 'plain',
    show: true,
    textStyle: {
      color: 'black',
    },
  },
  toolbox: {
    itemSize: 18,
    top: 1,
    right: 5,
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
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow',
      crossStyle: {
        color: '#999',
      },
    },
  },
  series: stackSeries(props.series),
})

const dark_theme_options = ref({
  textStyle: {
    fontFamily: 'monospace',
    fontWeight: 500,
    fontSize: 16,
    color: 'white',
  },
  xAxis: {
    type: 'category',
    name: props.tituloX || 'X',
    nameLocation: 'middle',
    nameGap: 35,
    data: props.etiquetas,
  },
  yAxis: {
    type: 'value',
    name: props.tituloY || 'Y',
    nameLocation: 'middle',
    nameGap: 65,
  },
  grid: {
    top: '8%',
    left: '4%',
    right: '10%',
    bottom: '30%',
    containLabel: true,
  },
  legend: {
    width: '100%',
    bottom: 1,
    type: 'plain',
    show: true,
    textStyle: {
      color: 'white',
    },
  },
  toolbox: {
    itemSize: 18,
    top: 1,
    right: 5,
    showTitle: true,
    orient: 'vertical',
    feature: {
      dataView: {
        iconStyle: { borderColor: 'white' },
        title: 'Ver datos',
        show: true,
        readOnly: false,
        optionToContent: function (opt) {
          var axisData = opt.xAxis[0].data
          var series = opt.series
          var table =
            '<table style="width:100%;text-align:center; color:black"><tbody><tr>' +
            '<td>Time:</td>' +
            '<td>' +
            series[0].name +
            '</td>' +
            '<td>' +
            series[1].name +
            '</td>' +
            '</tr>'
          for (var i = 0, l = axisData.length; i < l; i++) {
            table +=
              '<tr>' +
              '<td>' +
              axisData[i] +
              '</td>' +
              '<td>' +
              series[0].data[i] +
              '</td>' +
              '<td>' +
              series[1].data[i] +
              '</td>' +
              '</tr>'
          }
          table += '</tbody></table>'
          return table
        },
      },
      magicType: { iconStyle: { borderColor: 'white' }, show: true, type: ['line', 'bar'] },
      dataZoom: {
        iconStyle: { borderColor: 'white' },
        yAxisIndex: 'none',
      },
      restore: { iconStyle: { borderColor: 'white' }, show: true },
      saveAsImage: { iconStyle: { borderColor: 'white' }, show: true, title: 'Descargar' },
    },
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
  series: stackSeries(props.series),
})
</script>

<template>
  <div
    :class="`sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth-50 dark:bg-dark_smooth dark:border-${props.colorTheme}_dark `"
  >
    <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
      <h5 class="pl-2 text-sm uppercase border-l-4 border-light_contrast dark:border-dark_contrast">
        {{ titulo }}
      </h5>
      <v-chart
        class="sm:h-[38vh] xl:h-[40vh] 2xl:h-[54vh]"
        autoresize
        :option="isDark ? dark_theme_options : light_theme_options"
      />
    </div>
  </div>
</template>
