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
  <div>
  <div v-if="dataSource == 'hsi'" class="select-none outline-0 grid px-4 pt-3 w-full md:px-10">
    <div class="grid grid-row-1 gap-3 w-full">
      <div class="grid grid-row-1 col-span-1 gap-3">
        <div class="grid grid-cols-4 gap-3">
          <CasosActivos data-source="hsi" />
          <CasosAcumulados data-source="hsi" />
          <CasosNuevos7Dias data-source="hsi" />
          <CasosPromedioSemanal data-source="hsi" />
        </div>
      </div>
      <div class="grid gap-3 grid-rows-1">
        <div class="grid grid-cols-2 gap-3">
          <NuevosCasos data-source="hsi" />
          <CasosActivosSemanaEpidemiologica data-source="hsi" />
        </div>
      </div>
    </div>
  </div>
  <div v-if="dataSource == 'snvs'" class="select-none outline-0 grid px-4 pt-3 w-full md:px-10">
    <div class="grid grid-row-1 gap-3 w-full">
      <div class="grid grid-row-1 col-span-1 gap-3">
        <div class="grid grid-cols-4 gap-3">
          <CasosActivos data-source="snvs" />
          <CasosAcumulados data-source="snvs" />
          <CasosNuevos7Dias data-source="snvs" />
          <CasosPromedioSemanal data-source="snvs" />
        </div>
      </div>
      <div class="grid gap-3 grid-rows-1">
        <div class="grid grid-cols-2 gap-3">
          <NuevosCasos data-source="snvs" />
          <CasosActivosSemanaEpidemiologica data-source="snvs" />
        </div>
      </div>
    </div>
  </div>
  </div>
</template>

<style scoped></style>
