<template>
  <div class="flex relative h-screen bg-light_base-100 dark:dark_base">
    <!-- Sidebar -->
    <aside
      x-transition:enter="transition transform duration-300"
      x-transition:enter-start="-translate-x-full opacity-30  ease-in"
      x-transition:enter-end="translate-x-0 opacity-100 ease-out"
      x-transition:leave="transition transform duration-300"
      x-transition:leave-start="translate-x-0 opacity-100 ease-out"
      x-transition:leave-end="-translate-x
      -full opacity-0 ease-in"
      class="
        flex
        overflow-visible
        fixed
        inset-y-0
        z-40
        flex-col flex-shrink-0
        px-2
        w-60
        max-h-screen
        border-r
        shadow-lg
        transition-all
        transform
        lg:z-auto lg:static lg:shadow-none
        bg-light_base-200
        dark:bg-dark_base
      "
      :class="{ '-translate-x-full lg:translate-x-0 lg:w-20': !sidebarState.isOpen }"
    >
      <!-- Expanded Sidebar Navigation -->
      <Sidebar v-show="sidebarState.isOpen" />
      <!-- Minimal Sidebar Navigation -->
      <MinimalSidebar v-show="!sidebarState.isOpen" />
    </aside>
    <div class="flex overflow-y-auto flex-col flex-1 h-full dark:bg-dark_base">
      <!-- Header -->
      <TheHeader />
      <!-- Main Content -->
      <div
        class="
          h-full
          font-mono
          flew-row
          scrollbar-thin scrollbar-thumb-secondary
          scrollbar-track-light_base
          dark:scrollbar-thumb-secondary dark:scrollbar-track-dark_base
        "
      >
        <!-- Data Sources Tabs -->
        <TabGroup :default-index="dataSource == 'hsi' ? 0 : 1">
          <div
            v-show="!isCurrentRoute(sections.INFORMACION.key)"
            class="grid float-left grid-cols-1 pl-4 mt-4 ml-4 text-left h-fit"
          >
            <span class="float-left text-4xl align-middle">{{ enos.COVID.title }}</span>
            <span class="float-left leading-relaxed align-middle"> Actualizado: {{ currentTime }}</span>
          </div>
          <div class="grid float-right grid-cols-1 mt-3 text-left h-fit">
            <span v-show="!isCurrentRoute(sections.INFORMACION.key)" class="inline-flex float-right pr-14 mb-3"
              >Fuente de datos</span
            >
            <TabList
              v-show="!isCurrentRoute(sections.INFORMACION.key)"
              class="inline-flex float-right pr-14 shadow-2xl"
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
                <Tab
                  v-slot="{ selected }"
                  as="template"
                  class="px-4 py-2 -mb-px shadow-2xl border-3 border-primary bg-primary"
                >
                  <button
                    :aria-label="`Seleccionar ${data_sources.HSI.key} como fuente de datos`"
                    :class="[selected ? 'opacity-100' : 'border-none opacity-50']"
                    class="py-1 font-extrabold text-white group"
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
                  class="px-4 py-2 -mb-px font-semibold shadow-2xl bg-secondary border-secondary"
                  as="template"
                >
                  <button
                    :aria-label="`Seleccionar ${data_sources.SNVS.key} como fuente de datos`"
                    :class="[selected ? 'shadow-xl border-3 border-secondary opacity-100' : 'opacity-50']"
                    class="py-1 font-extrabold text-black group dark:text-dark_contrast"
                    @click="dataSource = 'snvs'"
                  >
                    SNVS
                  </button>
                </Tab>
              </Popper>
            </TabList>
          </div>
          <TabPanels>
            <TabPanel><RouterViewTransition></RouterViewTransition></TabPanel>
            <TabPanel><RouterViewTransition></RouterViewTransition></TabPanel>
          </TabPanels>
        </TabGroup>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { sidebarState } from '@/composables'
import { TabGroup, TabList, Tab, TabPanels, TabPanel } from '@headlessui/vue'
import RouterViewTransition from '@/components/RouterViewTransition.vue'
import Popper from 'vue3-popper'
import { sections, data_sources, enos } from '@/constants'
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store.js'

const { dataSource } = storeToRefs(useDataSourceStore())
const isCurrentRoute = (routeName) => {
  return useRouter().currentRoute.value.name == routeName
}
var today = new Date()
var dd = String(today.getDate()).padStart(2, '0')
var mm = String(today.getMonth() + 1).padStart(2, '0') //January is 0!
var yyyy = today.getFullYear()
var currentTime = dd + '/' + mm + '/' + yyyy
</script>

<style scoped>
:deep(.popper) {
  background: #000000;
  padding: 8px;
  border-radius: 3px;
  color: #ffffff;
  font-weight: bold;
  max-width: 25rem;
  font-size: 14px;
  margin-right: 5rem;
  z-index: 50;
}

:deep(.popper #arrow::before) {
  background: #000000;
}

:deep(.popper:hover),
:deep(.popper:hover > #arrow::before) {
  background: #000000;
}
</style>
