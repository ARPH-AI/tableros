<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
import { enos } from '@/data/enos/enos'
import { getThemeByDataSource } from '@/composables'

const { dataSource } = storeToRefs(useDataSourceStore())
const lista_enos = enos
</script>
<template>
  <div class="grid grid-rows-1 grid-flow-col grid gap-4 px-4 pt-3 w-full md:px-10">
    <Suspense>
      <BaseComponentePrincipal v-for="(eno, index) in lista_enos" :key="index" :eno="{ eno }" />
      <template #fallback>
        <BaseGraphSkeleton
          styles="sm:h-[38vh] xl:h-[50vh] 2xl:h-[60vh]"
          :color-theme="getThemeByDataSource(dataSource)"
        ></BaseGraphSkeleton>
      </template>
    </Suspense>
  </div>
</template>

<style scoped></style>
