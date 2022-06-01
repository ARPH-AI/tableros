<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts"></script>

<template>
  <div class="grid gap-3 px-4 py-4 mt-8 w-full h-full md:px-10">
    <div class="grid grid-cols-1 gap-3 lg:grid-cols-6 md:grid-cols-4">
      <!-- Left column -->
      <div class="grid grid-cols-1 col-span-1 gap-3 lg:col-span-2">
        <div class="grid grid-cols-1 gap-3 lg:grid-cols-2">
          <CasosAcumuladosMujeres data-source="snvs" />
          <CasosAcumuladosVarones data-source="snvs" />
        </div>
        <Suspense><CasosAcumuladosSexo data-source="snvs" /></Suspense>
      </div>
      <!-- Right column -->
      <div class="col-span-1 md:col-span-3 lg:col-span-4">
        <CasosEdadSemanaEpidemiologica data-source="snvs" />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
