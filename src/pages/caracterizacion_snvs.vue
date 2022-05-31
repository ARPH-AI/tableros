<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts"></script>

<template>
  <div class="grid gap-3 px-4 py-4 mt-8 w-full md:px-10">
    <CasosEdadSemanaEpidemiologica dataSource="snvs" />
    <div class="grid grid-cols-1 gap-3 lg:grid-cols-6 md:grid-cols-4">
      <!-- Left column -->
      <div class="grid grid-cols-1 col-span-1 gap-3 lg:col-span-1">
        <div class="grid grid-cols-1">
          <CasosAcumuladosMujeres dataSource="snvs" />
          <CasosAcumuladosVarones dataSource="snvs" />
        </div>
      </div>
      <!-- Right column -->
      <div class="col-span-5">
        <Suspense><CasosAcumuladosSexo dataSource="snvs" /></Suspense>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
