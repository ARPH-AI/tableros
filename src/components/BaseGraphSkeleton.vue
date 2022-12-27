<script setup lang="ts">
defineProps({
  colorTheme: { type: String, default: 'third' },
  height: { type: String, default: '' },
})
</script>

<template>
  <div
    :class="`${height} w-full sm:p-2 xl:p-4 2xl:p-5 rounded-3xl border-r-4 shadow-2xl bg-light_smooth dark:bg-dark_smooth dark:border-${colorTheme}_dark border-${colorTheme}`"
  >
    <div class="flex justify-around flex-col">
      <div class="animate-pulse rounded m-2 w-2/3 h-4 text-left bg-slate-200 dark:bg-slate-400"></div>
      <div class="flex space-x-4 m-2 p-3 items-baseline 2xl:m-8 2xl:p-6 2xl:pb-4">
        <div class="flex-1 h-12 2xl:h-24 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-24 2xl:h-36 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-36 2xl:h-48 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-48 2xl:h-64 bg-gray-300 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-36 2xl:h-72 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-24 2xl:h-64 bg-gray-300 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-12 2xl:h-48 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-24 2xl:h-36 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-36 2xl:h-72 bg-gray-300 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-48 2xl:h-36 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-36 2xl:h-48 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-24 2xl:h-64 bg-gray-300 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-12 2xl:h-72 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-24 2xl:h-64 bg-gray-300 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-36 2xl:h-48 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-36 2xl:h-48 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-24 2xl:h-36 bg-gray-200 rounded dark:bg-slate-400"></div>
        <div class="flex-1 h-48 2xl:h-24 bg-gray-200 rounded dark:bg-slate-400"></div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
