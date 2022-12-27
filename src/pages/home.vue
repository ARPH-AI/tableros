<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { useSectionsStore } from '@/stores/sections-store'
import { computed } from 'vue'
const sectionsStore = useSectionsStore()
const axis = computed(() => {
  return sectionsStore.getAxis
})
</script>

<template>
  <div class="font-sans h-[91vh] px-40 pt-20 w-full bg-light_base dark:bg-dark_base grid grid-rows-3">
    <div class="grid content-center h-full justify-left">
      <h1 class="font-medium float-left text-2xl">Vigilancia epidemiológica</h1>
    </div>
    <div class="grid md:grid-cols-2 gap-3">
      <AxisCover v-for="(section, index) in axis" :key="index" class="" :section="section"></AxisCover>
    </div>
  </div>
</template>

<style scoped></style>
