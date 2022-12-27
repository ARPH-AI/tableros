<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useEnosStore } from '@/stores/enos-store'

const { current_eno_data } = storeToRefs(useEnosStore())

const localeFiles = import.meta.globEager('../components/*.vue')
const componente =
  localeFiles[`../components/${current_eno_data.value.componentes.situacion_actual}.vue`]?.default || null
</script>
<template>
  <Suspense><component :is="componente" /></Suspense>
</template>

<style scoped></style>
