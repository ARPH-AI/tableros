<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts"></script>

<template>
  <div class="main mt-8 grid gap-3 px-4 py-4">
    <div class="grid grid-flow-col gap-3">
      <!-- Left column -->
      <div class="grid grid-cols-1 col-span-1 gap-3">
        <div class="grid grid-cols-2 gap-3">
          <CasosAcumuladosMujeres />
          <CasosAcumuladosVarones />
        </div>
        <ComorbilidadesCantidad />
      </div>
      <!-- Right column -->
      <div class="col-span-4 gap-2">
        <Suspense><CasosAcumuladosSexo /></Suspense>
      </div>
    </div>
    <ComorbilidadesFrecuencia />
    <CasosEdadSemanaEpidemiologica />
  </div>
</template>

<style scoped></style>
