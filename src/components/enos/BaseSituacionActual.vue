<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
import { useEnosStore } from '@/stores/enos-store'

const { dataSource } = storeToRefs(useDataSourceStore())
const { current_eno } = storeToRefs(useEnosStore())

console.log(current_eno, 'current_eno')
</script>

<template>
  <div>
  <div v-if="dataSource == 'hsi'" class="grid px-4 pt-3 w-full md:px-10">
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
          <CasosNuevos7Dias data-source="hsi" />
          <CasosPromedioSemanal data-source="hsi" />
        </div>
        <Suspense><CasosActivosSemanaEpidemiologica data-source="hsi" /></Suspense>
      </div>
    </div>
  </div>
  <div v-if="dataSource == 'snvs'" class="grid px-4 pt-3 w-full md:px-10">
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
          <CasosNuevos7Dias data-source="snvs" />
          <CasosPromedioSemanal data-source="snvs" />
        </div>
        <Suspense><CasosActivosSemanaEpidemiologica data-source="snvs" /></Suspense>
      </div>
    </div>
  </div>
  </div>
</template>

<style scoped></style>
