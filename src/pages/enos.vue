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
  <div class="h-[91vh] gap-10 p-10 place-items-center bg-light_base dark:bg-dark_base grid grid-cols-1 md:grid-cols-2">
    <BaseComponentePrincipal v-for="(eno, index) in lista_enos" :key="index" :eno="{ eno }" />
    <!-- <p>hola</p> -->
  </div>
</template>

<style scoped></style>
