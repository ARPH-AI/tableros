<script setup>
const props = defineProps({
  cantidad: { type: String, default: 'third' },
  titulo: { type: String, default: 'third' },
  colorTheme: { type: String, default: 'third' },
})
</script>

<template>
  <div
    :class="`sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth-50 dark:bg-dark_smooth dark:border-${props.colorTheme}_dark border-${props.colorTheme}`"
  >
    <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
      <h3 :class="`text-3xl font-semibold dark:text-${props.colorTheme}_dark text-${props.colorTheme}`">
        {{ Number(cantidad).toLocaleString() }}
      </h3>
      <h4 class="text-sm uppercase">
        {{ titulo }}
      </h4>
    </div>
  </div>
</template>

<style scoped></style>
