<script setup lang="ts">
defineProps({
  colorTheme: {
    type: String,
    required: true,
  },
})
</script>

<template>
  <div
    :class="`w-full sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth dark:bg-dark_smooth dark:border-${colorTheme}_dark border-${colorTheme}`"
  >
    <div class="flex justify-around flex-col text-left text-light_contrast dark:text-dark_contrast">
      <div class="animate-pulse mb-2 w-7 h-5 text-base bg-slate-200 rounded-full dark:bg-slate-400"></div>
      <div class="animate-pulse rounded m-2 w-2/3 h-3 bg-slate-200 dark:bg-slate-400"></div>
    </div>
  </div>
</template>

<style scoped></style>
