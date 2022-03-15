<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup

import NuevosCasos from '@/components/NuevosCasos.vue'
import CasosAcumulados from '@/components/CasosAcumulados.vue'
import CasosActivos from '@/components/CasosActivos.vue'
import CasosActivosLugar from '@/components/CasosActivosLugar.vue'
import CasosActivosSemanaEpidemiologica from '@/components/CasosActivosSemanaEpidemiologica.vue'
</script>

<template>
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <div class="row">
      <div class="col-md-2">
        <div class="pb-1">
          <CasosActivos />
        </div>
        <div class="pb-1">
          <CasosAcumulados />
        </div>
        <div class="pb-1">
          <CasosActivosSemanaEpidemiologica />
        </div>
      </div>
      <div class="col-md-10">
        <NuevosCasos />
      </div>
      <div class="col">
        <CasosActivosLugar />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
