<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import CasosAcumuladosVarones from '@/components/CasosAcumuladosVarones.vue'
import CasosAcumuladosMujeres from '@/components/CasosAcumuladosMujeres.vue'
import CasosEdadSemanaEpidemiologica from '@/components/CasosEdadSemanaEpidemiologica.vue'
import CasosAcumuladosSexo from '@/components/CasosAcumuladosSexo.vue'
import ComorbilidadesFrecuencia from '@/components/ComorbilidadesFrecuencia.vue'
import ComorbilidadesCantidad from '@/components/ComorbilidadesCantidad.vue'
</script>

<template>
  <div class="main mt-8 flex grid px-16 py-6 bg-gray-100">
    <div class="flex items-stretch grid grid-cols-2 px-16 py-6">
      <div class="p-3">
        <CasosAcumuladosMujeres />
      </div>
      <div class="p-3">
        <CasosAcumuladosVarones />
      </div>
      <div>
        <ComorbilidadesFrecuencia />
      </div>
      <div>
        <ComorbilidadesCantidad />
      </div>
    </div>
    <div class="">
      <CasosEdadSemanaEpidemiologica />
    </div>
    <div class="">
      <Suspense><CasosAcumuladosSexo /></Suspense>
    </div>
  </div>
</template>

<style scoped></style>
