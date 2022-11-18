<script setup>
import { sections, general_sections } from '@/constants'
import { getThemeByDataSource } from '@/composables'
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store.ts'
import { useSectionsStore } from '@/stores/sections-store.ts'
import { isCurrentRoute } from '@/composables'

const { currentSection } = storeToRefs(useSectionsStore())
console.log()
const { dataSource } = storeToRefs(useDataSourceStore())
</script>
<template>
  <nav class="grid grid-cols-1 place-items-center px-2 mt-32 font-sans">
    <BaseMinimalSideBarButton
      :section="general_sections.HOME"
      :color-theme="getThemeByDataSource(dataSource)"
      @click="currentSection = general_sections.HOME.key"
    ></BaseMinimalSideBarButton>
    <!-- <BaseMinimalSideBarButton
      :key="index"
      :section="main_axis.VIGILANCIA_SINDROMICA"
      :color-theme="getThemeByDataSource(dataSource)"
    ></BaseMinimalSideBarButton>
    <BaseMinimalSideBarButton
      :key="index"
      :section="main_axis.ENOS"
      :color-theme="getThemeByDataSource(dataSource)"
    ></BaseMinimalSideBarButton> -->
    <div class="mt-16">
      <BaseMinimalSideBarButton
        v-for="(section, index) in sections"
        v-show="currentSection == 'enos' && !isCurrentRoute(currentSection)"
        :key="index"
        :section="section"
        :color-theme="getThemeByDataSource(dataSource)"
      ></BaseMinimalSideBarButton>
    </div>
  </nav>
</template>
