<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import CasosAcumuladosVaronesSNVS from '@/components/CasosAcumuladosVaronesSNVS.vue'
import CasosAcumuladosMujeresSNVS from '@/components/CasosAcumuladosMujeresSNVS.vue'
import CasosEdadSemanaEpidemiologica from '@/components/CasosEdadSemanaEpidemiologicaSNVS.vue'
import CasosAcumuladosSexo from '@/components/CasosAcumuladosSexoSNVS.vue'
</script>

<template>
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <div class="row">
      <div class="col-md-2">
        <div class="pb-1">
          <CasosAcumuladosMujeresSNVS />
        </div>
        <div class="pb-1">
          <CasosAcumuladosVaronesSNVS />
        </div>
      </div>
      <div class="col-md-10">
        <CasosEdadSemanaEpidemiologicaSNVS />
      </div>
      <div class="col">
        <Suspense><CasosAcumuladosSexoSNVS /></Suspense>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
