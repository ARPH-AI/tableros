<template>
  <!-- Data Sources Tabs -->
  <TabGroup :default-index="dataSource == 'hsi' ? 0 : 1">
    <div
      v-show="!isCurrentRoute(general_sections.INFORMACION.key)"
      class="grid float-left grid-cols-1 pl-4 mt-4 ml-4 text-left h-fit"
    >
      <span class="float-left text-4xl align-middle">{{}}</span>
    </div>

    <div
      v-show="!isCurrentRoute(general_sections.INFORMACION.key)"
      class="grid float-right grid-cols-2 mt-3 text-left h-fit"
    >
      <!-- Data Sources information -->
      <div class="grid grid-cols-1 mt-3 text-xs">
        <span class="float-left leading-relaxed align-middle">
          Fuente de datos: <span class="uppercase text-">{{ dataSource }}</span></span
        >
        <span class="float-left leading-relaxed align-middle"> Actualizacion: {{ currentTime }}</span>
      </div>
      <!-- tab list tiene que ser dinamica -->
      <TabList
        v-show="!isCurrentRoute(general_sections.INFORMACION.key)"
        class="dark:bg-dark_smooth bg-light_smooth rounded-xl p-2 inline-flex float-right mr-6"
      >
        <Popper
          placement="left"
          arrow
          disable-click-away
          hover
          interactive
          :content="`Los datos de esta sección corresponden
             a los registros de la atención ambulatoria en ${data_sources.HSI.title}`"
        >
          <Tab v-slot="{ selected }" as="template" class="rounded-xl px-4 py-2 -mb-px">
            <button
              :aria-label="`Seleccionar ${data_sources.HSI.key} como fuente de datos`"
              :class="[
                selected
                  ? 'border-3 border-color_0 dark:bg-color_0_dark bg-color_0 opacity-100 dark:text-light_contrast text-dark_contrast'
                  : 'border-none opacity-50 dark:text-color_0_dark text-color_0',
              ]"
              class="shadow-inner py-1 font-extrabold group"
              @click="dataSource = 'hsi'"
            >
              HSI
            </button>
          </Tab>
        </Popper>
        <Popper
          arrow
          disable-click-away
          hover
          interactive
          content="Los datos de esta sección corresponden a los registros de los eventos de notificación obligatoria en
                 el Sistema Nacional de Vigilancia en Salud"
        >
          <Tab
            v-slot="{ selected }"
            class="rounded-xl px-4 py-2 -mb-px font-semibold shadow-2xl border-3"
            as="template"
          >
            <button
              :aria-label="`Seleccionar ${data_sources.SNVS.key} como fuente de datos`"
              :class="[
                selected
                  ? 'bg-color_1 dark:bg-color_1_dark border-color_1 shadow-xl opacity-100 dark:text-light_contrast text-dark_contrast'
                  : 'border-none opacity-50 dark:text-color_1_dark text-color_1',
              ]"
              class="shadow-inner py-1 font-extrabol"
              @click="dataSource = 'snvs'"
            >
              SNVS
            </button>
          </Tab>
        </Popper>
      </TabList>
    </div>
    <TabPanels>
      <!-- reproducir uno de estos por cada cant de tabs -->
      <TabPanel><RouterViewTransition></RouterViewTransition></TabPanel>
      <TabPanel><RouterViewTransition></RouterViewTransition></TabPanel>
    </TabPanels>
  </TabGroup>
</template>

<script setup>
import { TabGroup, TabList, Tab, TabPanels, TabPanel } from '@headlessui/vue'
import RouterViewTransition from '@/components/RouterViewTransition.vue'
import Popper from 'vue3-popper'
import { general_sections, data_sources } from '@/constants'
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store.ts'
import { useEnosStore } from '@/stores/enos-store.ts'

import { isCurrentRoute } from '@/composables'
import { getCurrentEnoDataSources } from '@/composables'
const { dataSource } = storeToRefs(useDataSourceStore())

const { current_eno } = storeToRefs(useEnosStore())
console.log(current_eno, 'ddd')
console.log(getCurrentEnoDataSources(current_eno), 'FFFFFF')

var today = new Date()
var dd = String(today.getDate()).padStart(2, '0')
var mm = String(today.getMonth() + 1).padStart(2, '0') //January is 0!
var yyyy = today.getFullYear()
var currentTime = dd + '/' + mm + '/' + yyyy
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
