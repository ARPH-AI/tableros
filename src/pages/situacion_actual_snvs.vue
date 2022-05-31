<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts"></script>

<template>
  <div class="grid px-4 py-4 mt-8 w-full md:px-10">
    <div class="grid grid-cols-1 gap-3 lg:grid-cols-6 md:grid-cols-4">
      <!-- Left column -->
      <div class="grid grid-cols-1 col-span-1 gap-3 lg:col-span-2">
        <div class="grid grid-cols-1 gap-3 lg:grid-cols-2">
          <CasosActivos dataSource="snvs" />
          <CasosAcumulados dataSource="snvs" />
        </div>
        <CasosActivosSemanaEpidemiologica dataSource="snvs" />
        <CasosActivosLugar dataSource="snvs" />
      </div>
      <!-- Right column -->
      <div class="col-span-4">
        <NuevosCasos dataSource="snvs" />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
