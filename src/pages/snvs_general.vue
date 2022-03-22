<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup

import NuevosCasosSNVS from '@/components/NuevosCasosSNVS.vue'
import CasosAcumuladosSNVS from '@/components/CasosAcumuladosSNVS.vue'
import CasosActivosSNVS from '@/components/CasosActivosSNVS.vue'
import CasosActivosLugarSNVS from '@/components/CasosActivosLugarSNVS.vue'
import CasosActivosSemanaEpidemiologicaSNVS from '@/components/CasosActivosSemanaEpidemiologicaSNVS.vue'
</script>

<template>
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <div class="row">
      <div class="col-md-2">
        <div class="pb-1">
          <CasosActivosSNVS />
        </div>
        <div class="pb-1">
          <CasosAcumuladosSNVS />
        </div>
        <div class="pb-1">
          <CasosActivosSemanaEpidemiologicaSNVS />
        </div>
      </div>
      <div class="col-md-10">
        <NuevosCasosSNVS />
      </div>
      <div class="col">
        <CasosActivosLugarSNVS />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
