<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { main_axis } from '@/constants'
const title = main_axis.VIGILANCIA_SINDROMICA.title
const description = main_axis.VIGILANCIA_SINDROMICA.description
</script>

<template>
  <!-- <div class="h-[91vh] gap-10 p-10 bg-light_base dark:bg-dark_base grid grid-cols-1 md:grid-cols-2">
    <div>
      <h2 class="font-sans text-3xl mb-4">{{ title }}</h2>
      <p class="font-sans text-base mt-4 w-3/4">{{ description }}</p>
    </div>
    <div class="grid w-full content-center">
      <Suspense><CasosActivosSemanaEpidemiologica data-source="hsi" /></Suspense>
    </div>
  </div> -->
  <div class="h-[91vh] content-center gap-10 p-10 bg-light_base dark:bg-dark_base grid grid-cols-1">
    <div>
      <h2 class="font-sans text-3xl mb-4">{{ title }}</h2>
    </div>
    <div class="grid w-3/5 content-center">
      <Suspense><CasosActivosSemanaEpidemiologica data-source="hsi" /></Suspense>
    </div>
  </div>
</template>
