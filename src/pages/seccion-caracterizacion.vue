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

const module = await import(current_eno_data.value.componentes.caracterizacion)
const componente = module.default
</script>
<template>
  <div>
    <Suspense><component :is="componente" :data-source="dataSource"></component></Suspense>
  </div>
</template>
