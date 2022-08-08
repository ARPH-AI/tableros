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
    <div class="grid grid-cols-1 gap-3 w-full lg:grid-cols-2">
      <!-- Left column -->
      <div class="grid grid-cols-1 col-span-1 gap-3">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
          <CasosActivos data-source="hsi" />
          <CasosAcumulados data-source="hsi" />
        </div>
        <NuevosCasos data-source="hsi" />
      </div>
      <!-- Right column -->
      <div class="grid gap-3 lg:grid-cols-1">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
          <CasosActivos data-source="hsi" />
          <CasosAcumulados data-source="hsi" />
        </div>
        <CasosActivosSemanaEpidemiologica data-source="hsi" />
      </div>
    </div>
  </div>
  <div v-if="dataSource == 'snvs'" class="grid px-4 py-4 mt-8 w-full md:px-10">
    <div class="grid grid-cols-1 gap-3 w-full lg:grid-cols-2">
      <!-- Left column -->
      <div class="grid grid-cols-1 col-span-1 gap-3">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
          <CasosActivos class="not" data-source="snvs" />
          <CasosAcumulados data-source="snvs" />
        </div>
        <NuevosCasos data-source="snvs" />
      </div>
      <!-- Right column -->
      <div class="grid gap-3 lg:grid-cols-1">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
          <CasosActivos data-source="snvs" />
          <CasosAcumulados data-source="snvs" />
        </div>
        <CasosActivosSemanaEpidemiologica data-source="snvs" />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
