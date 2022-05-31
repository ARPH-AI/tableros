<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts"></script>

<template>
  <div class="grid gap-3 px-4 py-4 mt-8 w-full md:px-10">
    <CasosEdadSemanaEpidemiologica dataSource="hsi" />
    <div class="grid grid-cols-1 gap-3 lg:grid-cols-6 md:grid-cols-4">
      <!-- Left column -->
      <div class="grid grid-cols-1 col-span-1 gap-3 lg:col-span-2">
        <div class="grid grid-cols-1 gap-3 lg:grid-cols-2">
          <CasosAcumuladosMujeres dataSource="hsi" />
          <CasosAcumuladosVarones dataSource="hsi" />
        </div>
        <ComorbilidadesCantidad dataSource="hsi" />
      </div>
      <!-- Right column -->
      <div class="col-span-1 md:col-span-3 lg:col-span-4">
        <Suspense><CasosAcumuladosSexo dataSource="hsi" /></Suspense>
      </div>
    </div>

    <ComorbilidadesFrecuencia dataSource="hsi" />
  </div>
</template>

<style scoped></style>
