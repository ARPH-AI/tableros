<script setup>
import { sections, general_sections, main_axis } from '@/constants'
import { getThemeByDataSource } from '@/composables'
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store.ts'
import { isCurrentRoute } from '@/composables'

const { dataSource } = storeToRefs(useDataSourceStore())
</script>
<template>
  <nav class="grid grid-cols-1 items-center px-2 mt-32 font-sans">
    <BaseMinimalSideBarButton
      :key="index"
      :section="general_sections.HOME"
      :color-theme="getThemeByDataSource(dataSource)"
    ></BaseMinimalSideBarButton>
    <BaseMinimalSideBarButton
      :key="index"
      :section="main_axis.VIGILANCIA_SINDROMICA"
      :color-theme="getThemeByDataSource(dataSource)"
    ></BaseMinimalSideBarButton>
    <BaseMinimalSideBarButton
      :key="index"
      :section="main_axis.ENOS"
      :color-theme="getThemeByDataSource(dataSource)"
    ></BaseMinimalSideBarButton>
    <div class="mt-16">
      <BaseMinimalSideBarButton
        v-for="(section, index) in sections"
        v-show="!isCurrentRoute(general_sections.HOME.key)"
        :key="index"
        :section="section"
        :color-theme="getThemeByDataSource(dataSource)"
      ></BaseMinimalSideBarButton>
    </div>
  </nav>
</template>
