<script setup lang="ts">
const props = defineProps({
  colorTheme: { type: String, default: 'third' },
})
</script>

<template>
  <div
    :class="`w-full sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth-50 dark:bg-dark_smooth border-${props.colorTheme}`"
  >
    <div class="flex justify-around flex-col text-left text-light_contrast dark:text-dark_contrast">
      <div class="animate-pulse mb-2 w-7 h-7 text-base bg-slate-200 rounded-full"></div>
      <div class="animate-pulse w-2/3 h-4 bg-slate-200"></div>
    </div>
  </div>
</template>

<style scoped></style>
