<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
const { dataSource } = storeToRefs(useDataSourceStore())
</script>

<template>
  <div v-if="dataSource == 'hsi'" class="grid px-4 pt-3 w-full md:px-10">
    <Suspense><Localizacion enfermedad="Dengue" /></Suspense>
  </div>
  <div v-if="dataSource == 'snvs'" class="flex flex-col px-4 pt-3 w-full h-full md:px-10">
    <Suspense><Coropletico enfermedad="Dengue" /></Suspense>
  </div>
</template>

<style scoped></style>
