<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useEnosStore } from '@/stores/enos-store'

const { enos_data } = storeToRefs(useEnosStore())
</script>
<template>
  <div class="grid grid-rows-1 grid-flow-col gap-4 px-4 pt-3 w-full md:px-10">
    <Suspense>
      <BaseComponentePrincipal v-for="(eno, index) in enos_data" :key="index" :eno="{ eno }" />
    </Suspense>
  </div>
</template>

<style scoped></style>
