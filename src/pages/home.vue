<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { main_axis } from '@/constants'
</script>

<template>
  <div class="h-[91vh] place-items-center bg-light_base dark:bg-dark_base grid grid-rows-1">
    <div class="grid grid-cols-1 md:grid-cols-2">
      <AxisCover v-for="(section, index) in main_axis" :key="index" class="" :section="section"></AxisCover>
    </div>
  </div>
</template>

<style scoped></style>
