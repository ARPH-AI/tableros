<template>
  <!-- Data Sources Tabs -->
  <TabGroup :default-index="dataSource == 'hsi' ? 0 : 1" :selected-index="selectedTab">
    <div
      v-show="!isCurrentRoute(general_sections.INFORMACION.key)"
      class="grid justify-between grid-cols-2 pl-4 mt-4 ml-4 text-left h-fit"
    >
      <!-- Section title -->
      <div class="grid-cols-1 float-left">
        <h2 class="font-medium float-left text-2xl">{{ current_section }}</h2>
      </div>
      <!-- tab list tiene que ser dinamica -->
      <TabList
        v-show="!isCurrentRoute(general_sections.INFORMACION.key) && !isCurrentRoute(general_sections.HOME.key)"
        class="dark:bg-dark_smooth bg-light_smooth rounded-xl p-2 flex-row float-right mr-6 justify-self-end"
      >
        <Popper
          v-for="data in data_sources"
          :key="data.label"
          placement="bottom"
          arrow
          disable-click-away
          hover
          interactive
          :content="data.content"
        >
          <Tab v-slot="{ selected }" as="template" class="rounded-xl px-4 py-2 -mb-px flex-auto">
            <button
              :aria-label="`Seleccionar ${data.key} como fuente de datos`"
              :class="selected ? tab_styles[data.key]?.selected : tab_styles[data.key]?.non_selected"
              class="shadow-inner py-1 font-extrabold group align-middle"
              @click="setDataSource(data.key)"
            >
              {{ data.label }}
            </button>
          </Tab>
        </Popper>
      </TabList>
    </div>
    <TabPanels>
      <!-- reproducir uno de estos por cada cant de tabs -->
      <TabPanel v-for="data in data_sources" :key="data.label"><RouterViewTransition></RouterViewTransition></TabPanel>
    </TabPanels>
  </TabGroup>
</template>

<script setup>
import { computed } from 'vue'
import { TabGroup, TabList, Tab, TabPanels, TabPanel } from '@headlessui/vue'
import RouterViewTransition from '@/components/RouterViewTransition.vue'
import Popper from 'vue3-popper'
import { general_sections } from '@/constants'
import { useDataSourceStore } from '@/stores/data-source-store.ts'
import { useEnosStore } from '@/stores/enos-store.ts'
import { useSectionsStore } from '@/stores/sections-store'
import { isCurrentRoute } from '@/composables'
import { storeToRefs } from 'pinia'
const { dataSource } = storeToRefs(useDataSourceStore())
const dataSourceStore = useDataSourceStore()
const enosStore = useEnosStore()
const sectionsStores = useSectionsStore()

const tab_styles = {
  hsi: {
    selected:
      'border-3 border-color_0 dark:bg-color_0_dark bg-color_0 opacity-100 dark:text-light_contrast text-dark_contrast',
    non_selected: 'border-none opacity-50 dark:text-color_0_dark text-color_0',
  },
  snvs: {
    selected:
      'bg-color_1 dark:bg-color_1_dark border-color_1 shadow-xl opacity-100 dark:text-light_contrast text-dark_contrast',
    non_selected: 'border-none opacity-50 dark:text-color_1_dark text-color_1',
  },
}

const data_sources = computed(() => {
  return enosStore.getCurrentEnoDataSources
})

const current_section = computed(() => {
  return sectionsStores.getSectionTitle
})

const setDataSource = (value) => {
  dataSourceStore.setCurrentDataSource(value)
  enosStore.updateEnosDataBySource(value)
}
</script>

<style>
.popper {
  max-width: 25rem;
}
:root {
  --popper-theme-background-color: #000000;
  --popper-theme-background-color-hover: #000000;
  --popper-theme-text-color: #ffffff;
  --popper-theme-text-weight: #ffffff;
  --popper-theme-border-width: 0px;
  --popper-theme-border-style: solid;
  --popper-theme-border-radius: 3px;
  --popper-theme-padding: 8px;
  --popper-theme-box-shadow: 0 6px 30px -6px rgba(0, 0, 0, 0.25);
}
</style>
