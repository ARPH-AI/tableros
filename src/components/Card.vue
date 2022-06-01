<script setup lang="ts">
const props = defineProps({
  cantidad: { type: String, default: '0' },
  titulo: { type: String, default: 'Tablero ARPHAI' },
  colorTheme: { type: String, default: 'third' },
})
</script>

<template>
  <div
    :class="`rounded-lg border-r-4 shadow-lg bg-light_smooth-50 dark:bg-dark_smooth md:shadow-xl border-${props.colorTheme}`"
  >
    <div class="relative z-10 pt-2 pb-4 text-center text-light_contrast dark:text-dark_contrast">
      <h3 :class="`my-3 text-3xl font-semibold leading-tight text-${props.colorTheme}`">
        {{ Number(cantidad).toLocaleString() }}
      </h3>
      <h4 class="text-sm font-extrabold leading-tight uppercase">
        {{ titulo }}
      </h4>
    </div>
  </div>
</template>

<style scoped></style>
