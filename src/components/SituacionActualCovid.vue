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
  <div class="select-none outline-0 grid px-4 pt-3 w-full md:px-10">
    <div class="grid grid-row-1 gap-3 w-full">
      <div class="grid grid-row-1 col-span-1 gap-3">
        <div class="grid grid-cols-4 gap-3">
          <CasosActivos :data-source="dataSource" />
          <CasosAcumulados :data-source="dataSource" />
          <CasosNuevos7Dias :data-source="dataSource" />
          <CasosPromedioSemanal :data-source="dataSource" />
        </div>
      </div>
      <div class="grid gap-3 grid-rows-1">
        <div class="grid grid-cols-2 gap-3">
          <NuevosCasos :data-source="dataSource" />
          <CasosActivosSemanaEpidemiologica :data-source="dataSource" />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
