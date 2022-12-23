<script setup lang="ts">
defineProps<{
  chartHeight: string
}>()
</script>

<template>
  <div class="">
    <div :class="`${chartHeight} w-full text-xl text-gray-400 text-center pt-20 align-middle dark:text-white`">
      <h4 class="text-base font-thin dark:text-gray-200 text-gray-900 text-center dark:text-gray-300 italic">
        No hay datos disponibles actualmente
      </h4>
    </div>
  </div>
</template>

<style scoped></style>
