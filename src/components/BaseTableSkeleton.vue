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
    <div class="flex justify-around flex-col text-left">
      <div class="animate-pulse w-2/3 h-4 bg-slate-200 my-2 2xl:my-4"></div>
      <div class="animate-pulse">
        <div class="flex space-x-3 items-baseline">
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
        </div>
        <div class="flex space-x-3 items-baseline">
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
        </div>
        <div class="flex space-x-3 items-baseline">
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
        </div>
        <div class="flex space-x-3 items-baseline">
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
        </div>
        <div class="flex space-x-3 items-baseline">
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
        </div>
        <div class="flex space-x-3 items-baseline">
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
        </div>
        <div class="flex space-x-3 items-baseline">
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h-3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
        </div>
        <div class="flex space-x-3 items-baseline">
          <div class="flex-1 h:3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h:3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
          <div class="flex-1 h:3 2xl:h-6 bg-gray-200 dark:bg-slate-400 rounded m-2"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
