<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
import { enos } from '@/data/enos/enos'
const { dataSource } = storeToRefs(useDataSourceStore())
const lista_enos = enos
</script>
<template>
  <div class="grid grid-rows-1 grid-flow-col grid gap-4 px-4 pt-3 w-full md:px-10">
    <BaseComponentePrincipal v-for="(eno, index) in lista_enos" :key="index" :eno="{ eno }" />
  </div>
</template>

<style scoped></style>
