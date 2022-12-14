<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
import { getThemeByDataSource } from '@/composables'
import { useEnosStore } from '@/stores/enos-store'

const { dataSource } = storeToRefs(useDataSourceStore())
const { enos_data } = storeToRefs(useEnosStore())
</script>
<template>
  <div class="grid grid-rows-2 grid-flow-col gap-4 px-4 pt-3 w-full md:px-10">
    <Suspense>
      <BaseComponentePrincipal v-for="(eno, index) in enos_data" :key="index" :eno="{ eno }" />
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
