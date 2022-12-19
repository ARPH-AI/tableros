<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { main_axis } from '@/constants'
const title = main_axis.find((axis) => axis.key === 'vigilancia-sindromica')?.title
const description = main_axis.find((axis) => axis.key === 'vigilancia-sindromica')?.description
</script>

<template>
  <div class="content-center gap-10 p-10 bg-light_base dark:bg-dark_base grid grid-cols-1">
    <div>
      <h2 class="font-sans text-3xl mb-4">{{ title }}</h2>
    </div>
    <div class="grid w-full content-center">
      <Suspense><ConsultasFebrilesSemanaEpidemiologica /></Suspense>
    </div>
  </div>
</template>
