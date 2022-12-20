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
    <div class="grid grid-cols-1 gap-3 w-full lg:grid-cols-2">
      <!-- Left column -->
      <div class="grid grid-cols-1 col-span-1 gap-3">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
          <CasosActivos data-source="hsi" enfermedad="Dengue" />
          <CasosAcumulados data-source="hsi" enfermedad="Dengue" />
        </div>
        <NuevosCasos data-source="hsi" enfermedad="Dengue" />
      </div>
      <!-- Right column -->
      <div class="grid gap-3 lg:grid-cols-1">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
          <CasosNuevos7Dias data-source="hsi" enfermedad="Dengue" />
          <CasosPromedioSemanal data-source="hsi" enfermedad="Dengue" />
        </div>
        <Suspense><CasosActivosSemanaEpidemiologica data-source="hsi" enfermedad="Dengue" /></Suspense>
      </div>
    </div>
  </div>
  <div v-if="dataSource == 'snvs'" class="grid px-4 pt-3 w-full md:px-10">
    <div class="grid grid-cols-1 gap-3 w-full lg:grid-cols-2">
      <!-- Left column -->
      <div class="grid grid-cols-1 col-span-1 gap-3">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
          <CasosActivos class="not" data-source="snvs" enfermedad="Dengue" />
          <CasosAcumulados data-source="snvs" enfermedad="Dengue" />
        </div>
        <NuevosCasos data-source="snvs" enfermedad="Dengue" />
      </div>
      <!-- Right column -->
      <div class="grid gap-3 lg:grid-cols-1">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
          <CasosNuevos7Dias data-source="snvs" enfermedad="Dengue" />
          <CasosPromedioSemanal data-source="snvs" enfermedad="Dengue" />
        </div>
        <Suspense><CasosActivosSemanaEpidemiologica data-source="snvs" enfermedad="Dengue" /></Suspense>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
