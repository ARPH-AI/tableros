<script setup>
import { sections } from '@/constants'
import { getThemeByDataSource } from '@/composables'
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store.js'

const { dataSource } = storeToRefs(useDataSourceStore())
</script>
<template>
  <nav class="grid grid-cols-1 items-center px-2 mt-32 font-mono">
    <BaseMinimalSideBarButton
      v-for="(section, index) in sections"
      :key="index"
      :section="section"
      :color-theme="getThemeByDataSource(dataSource)"
    ></BaseMinimalSideBarButton>
  </nav>
</template>
