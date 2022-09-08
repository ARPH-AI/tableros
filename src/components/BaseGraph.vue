<template>
  <div
    :class="`sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth dark:bg-dark_smooth dark:border-${props.colorTheme}_dark border-${props.colorTheme}`"
  >
    <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
      <h5 class="pl-2 text-sm uppercase border-l-4 border-light_contrast dark:border-dark_contrast">
        {{ props.titulo }}
      </h5>
      <v-chart :class="`inline-block ${props.chartStyles}`" autoresize :option="props.options" />
    </div>
  </div>
</template>

<script setup>
const props = defineProps({
  titulo: {
    type: String,
    required: true,
  },
  colorTheme: {
    type: String,
    required: true,
  },
  chartStyles: {
    type: String,
    required: true,
  },
  options: {
    type: Array,
    required: true,
  },
})
</script>
