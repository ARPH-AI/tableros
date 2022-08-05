<script setup lang="ts">
const props = defineProps({
  colorTheme: { type: String, default: 'third' },
  styles: { type: String, default: '' },
})
</script>

<template>
  <div
    :class="`${props.styles} w-full sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth-50 dark:bg-dark_smooth border-${props.colorTheme}`"
  >
    <div class="flex justify-around flex-col">
      <div class="animate-pulse w-2/3 h-4 text-left bg-slate-200"></div>
      <div class="animate-pulse">
        <div class="flex space-x-4 m-2 p-3 items-baseline 2xl:m-6 2xl:p-6 2xl:pb-4">
          <div class="flex-1 h-12 2xl:h-24 bg-gray-200 rounded"></div>
          <div class="flex-1 h-24 2xl:h-36 bg-gray-200 rounded"></div>
          <div class="flex-1 h-36 2xl:h-48 bg-gray-200 rounded"></div>
          <div class="flex-1 h-48 2xl:h-64 bg-gray-300 rounded"></div>
          <div class="flex-1 h-36 2xl:h-72 bg-gray-200 rounded"></div>
          <div class="flex-1 h-24 2xl:h-64 bg-gray-300 rounded"></div>
          <div class="flex-1 h-12 2xl:h-48 bg-gray-200 rounded"></div>
          <div class="flex-1 h-24 2xl:h-36 bg-gray-200 rounded"></div>
          <div class="flex-1 h-36 2xl:h-72 bg-gray-300 rounded"></div>
          <div class="flex-1 h-48 2xl:h-36 bg-gray-200 rounded"></div>
          <div class="flex-1 h-36 2xl:h-48 bg-gray-200 rounded"></div>
          <div class="flex-1 h-24 2xl:h-64 bg-gray-300 rounded"></div>
          <div class="flex-1 h-12 2xl:h-72 bg-gray-200 rounded"></div>
          <div class="flex-1 h-24 2xl:h-64 bg-gray-300 rounded"></div>
          <div class="flex-1 h-36 2xl:h-48 bg-gray-200 rounded"></div>
          <div class="flex-1 h-24 2xl:h-36 bg-gray-200 rounded"></div>
          <div class="flex-1 h-48 2xl:h-24 bg-gray-200 rounded"></div>
        </div>
      </div>
      <div class="animate-pulse mx-40 2xl:mx-60 h-4 bg-slate-200"></div>
    </div>
  </div>
</template>

<style scoped></style>
