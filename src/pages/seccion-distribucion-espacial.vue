<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store.js'
const { dataSource } = storeToRefs(useDataSourceStore())
</script>

<template>
  <div v-if="dataSource == 'hsi'" class="grid px-4 py-4 mt-8 w-full md:px-10">
    <Suspense><Localizacion /></Suspense>
  </div>
  <div v-if="dataSource == 'snvs'" class="flex flex-col px-4 py-4 mt-5 w-full h-full md:px-10">
    <Suspense><Coropletico /></Suspense>
  </div>
</template>

<style scoped></style>
