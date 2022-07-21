<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts"></script>

<template>
  <div class="grid px-4 py-4 mt-8 w-full md:px-10">
    <div class="grid grid-cols-1 gap-3 w-full lg:grid-cols-2 2xl:grid-cols-5">
      <!-- Left column -->
      <div class="grid grid-cols-1 col-span-1 gap-3 2xl:col-span-3">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-2 2xl:grid-cols-4">
          <CasosActivos class="not" data-source="snvs" />
          <CasosAcumulados data-source="snvs" />
        </div>
        <NuevosCasos data-source="snvs" />
      </div>
      <!-- Right column -->
      <div class="grid gap-3 2xl:grid-cols-1 2xl:col-span-2 lg:grid-cols-1">
        <div class="grid grid-cols-1 gap-3 md:grid-cols-2 2xl:grid-cols-4">
          <CasosActivos data-source="snvs" />
          <CasosAcumulados data-source="snvs" />
        </div>
        <CasosActivosSemanaEpidemiologica data-source="snvs" />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
