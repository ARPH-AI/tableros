<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
import { useEnosStore } from '@/stores/enos-store'

const { current_eno_data } = storeToRefs(useEnosStore())
const { dataSource } = storeToRefs(useDataSourceStore())

const localeFiles = import.meta.globEager('../components/*.vue')
const componente =
  localeFiles[`../components/${current_eno_data.value.componentes.caracterizacion}.vue`]?.default || null
</script>
<template>
  <div>
    <Suspense><component :is="componente" :data-source="dataSource"></component></Suspense>
  </div>
</template>
