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
        border-light_contrast
        dark:border-dark_contrast
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
          scrollbar-thin
          scrollbar-thumb-color_1
          scrollbar-track-light_base
          dark:scrollbar-thumb-color_1_dark dark:scrollbar-track-dark_base
        "
      >
        <!-- Data Sources Tabs -->
        <TabGroup :default-index="dataSource == 'hsi' ? 0 : 1">
          <div
            v-show="!isCurrentRoute(general_sections.INFORMACION.key)"
            class="grid float-left grid-cols-1 pl-4 mt-4 ml-4 text-left h-fit"
          >
            <span class="float-left text-4xl align-middle">{{ enos.COVID.title }}</span>
            <span class="float-left leading-relaxed align-middle"> Actualizado: {{ currentTime }}</span>
          </div>
          <div class="grid float-right grid-cols-1 mt-3 text-left h-fit">
            <span v-show="!isCurrentRoute(general_sections.INFORMACION.key)" class="inline-flex float-right pr-14 mb-2"
              >Fuente de datos</span
            >
            <!-- <TabList v-show="!isCurrentRoute(general_sections.INFORMACION.key)" class="inline-flex float-right pr-14">
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
                  class="px-4 py-1 -mb-px border-3 dark:border-color_0_dark border-color_0"
                >
                  <button
                    :aria-label="`Seleccionar ${data_sources.HSI.key} como fuente de datos`"
                    :class="[
                      selected
                        ? 'text-dark_contrast dark:text-light_contrast dark:bg-color_0_dark bg-color_0 opacity-100'
                        : 'opacity-50',
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
                  class="border-color_1 dark:border-color_1_dark px-4 py-1 -mb-px font-semibold shadow-2xl"
                  as="template"
                >
                  <button
                    :aria-label="`Seleccionar ${data_sources.SNVS.key} como fuente de datos`"
                    :class="[selected ? 'bg-color_1 dark:bg-color_1_dark opacity-100' : 'opacity-50 ']"
                    class="border-3 shadow-inner py-1 font-extrabold text-black group dark:text-dark_contrast"
                    @click="dataSource = 'snvs'"
                  >
                    SNVS
                  </button>
                </Tab>
              </Popper>
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
                  class="
                    px-4
                    py-2
                    -mb-px
                    border-3
                    dark:border-color_0_dark
                    border-color_0
                    dark:bg-color_0_dark
                    bg-color_0
                  "
                >
                  <button
                    :aria-label="`Seleccionar ${data_sources.HSI.key} como fuente de datos`"
                    :class="[selected ? 'opacity-100' : 'border-none opacity-50']"
                    class="shadow-inner py-1 font-extrabold text-white group"
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
                  class="
                    px-4
                    py-2
                    -mb-px
                    font-semibold
                    shadow-2xl
                    dark:bg-color_1_dark dark:border-color_1_dark
                    bg-color_1
                    border-color_1
                  "
                  as="template"
                >
                  <button
                    :aria-label="`Seleccionar ${data_sources.SNVS.key} como fuente de datos`"
                    :class="[
                      selected
                        ? 'shadow-xl border-3 border-color_1 dark:border-color_1_dark opacity-100'
                        : 'opacity-50',
                    ]"
                    class="shadow-inner py-1 font-extrabold text-black group dark:text-dark_contrast"
                    @click="dataSource = 'snvs'"
                  >
                    SNVS
                  </button>
                </Tab>
              </Popper>
            </TabList> -->
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
            <TabPanel><RouterViewTransition></RouterViewTransition></TabPanel>
            <TabPanel><RouterViewTransition></RouterViewTransition></TabPanel>
          </TabPanels>
        </TabGroup>
      </div>
    </div>
  </div>
</template>

<script setup>
import { sidebarState } from '@/composables'
import { TabGroup, TabList, Tab, TabPanels, TabPanel } from '@headlessui/vue'
import RouterViewTransition from '@/components/RouterViewTransition.vue'
import Popper from 'vue3-popper'
import { general_sections, data_sources, enos } from '@/constants'
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store.js'
import { isCurrentRoute } from '@/composables'

const { dataSource } = storeToRefs(useDataSourceStore())

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
