<script setup>
import { general_sections } from '@/constants'
import { getThemeByDataSource } from '@/composables'
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store.ts'
import { useSectionsStore } from '@/stores/sections-store.ts'
import { isCurrentRoute } from '@/composables'
import { useEnosStore } from '@/stores/enos-store'

const { currentSection } = storeToRefs(useSectionsStore())
const { dataSource } = storeToRefs(useDataSourceStore())
const sectionsStore = useSectionsStore()
const dataSourceStore = useDataSourceStore()
const enosStore = useEnosStore()
const updateStoresValuesToHome = () => {
  enosStore.setCurrentEnoString('')
  dataSourceStore.dataSource = 'hsi'
  sectionsStore.setAxisTitle('')
  sectionsStore.setPageTitle('')
}
const onCliclHandler = (value) => {
  if (value === 'home') {
    updateStoresValuesToHome()
  }
  sectionsStore.setCurrentSection(value)
}
const { current_eno_data } = storeToRefs(useEnosStore())
</script>
<template>
  <nav class="grid grid-cols-1 place-items-center px-2 mt-32 font-sans">
    <BaseMinimalSideBarButton
      :section="general_sections.HOME"
      :color-theme="getThemeByDataSource(dataSource)"
      @click="onCliclHandler(general_sections.HOME.key)"
    ></BaseMinimalSideBarButton>
    <div class="mt-16">
      <BaseMinimalSideBarButton
        v-for="(section, index) in current_eno_data.secciones"
        v-show="currentSection == 'enos' && !isCurrentRoute(currentSection)"
        :key="index"
        :section="section"
        :color-theme="getThemeByDataSource(dataSource)"
      ></BaseMinimalSideBarButton>
    </div>
  </nav>
</template>
