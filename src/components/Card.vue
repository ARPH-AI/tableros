<script setup>
const props = defineProps({
  cantidad: { type: String, default: 'third' },
  titulo: { type: String, default: 'third' },
  colorTheme: { type: String, default: 'third' },
  percent: { type: Boolean, default: false },
})
</script>

<template>
  <div
    :class="`sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth-50 dark:bg-dark_smooth border-${props.colorTheme}`"
  >
    <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
      <h3 :class="`text-3xl font-semibold text-${props.colorTheme}`">
        <template v-if="percent">{{
          Number(cantidad / 100).toLocaleString(undefined, { style: 'percent', minimumFractionDigits: 2 })
        }}</template>
        <template v-else>{{ Number(cantidad).toLocaleString() }}</template>
      </h3>
      <h4 class="text-sm uppercase">
        {{ titulo }}
      </h4>
    </div>
  </div>
</template>

<style scoped></style>
