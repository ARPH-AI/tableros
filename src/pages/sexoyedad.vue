<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import CasosAcumuladosVarones from '@/components/CasosAcumuladosVarones.vue'
import CasosAcumuladosMujeres from '@/components/CasosAcumuladosMujeres.vue'
import CasosEdadSemanaEpidemiologica from '@/components/CasosEdadSemanaEpidemiologica.vue'
import CasosAcumuladosSexo from '@/components/CasosAcumuladosSexo.vue'
</script>

<template>
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <div class="row">
      <div class="col-md-2">
        <div class="pb-1">
          <CasosAcumuladosMujeres />
        </div>
        <div class="pb-1">
          <CasosAcumuladosVarones />
        </div>
      </div>
      <div class="col-md-10">
        <CasosEdadSemanaEpidemiologica />
      </div>
      <div class="col">
        <Suspense><CasosAcumuladosSexo /></Suspense>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
