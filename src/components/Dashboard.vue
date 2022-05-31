<template>
  <div class="flex relative h-screen bg-light_base-100 dark:dark_base">
    <!-- Sidebar -->
    <aside
      x-transition:enter="transition transform duration-300"
      x-transition:enter-start="-translate-x-full opacity-30  ease-in"
      x-transition:enter-end="translate-x-0 opacity-100 ease-out"
      x-transition:leave="transition transform duration-300"
      x-transition:leave-start="translate-x-0 opacity-100 ease-out"
      x-transition:leave-end="-translate-x-full opacity-0 ease-in"
      class="flex overflow-visible fixed inset-y-0 z-40 flex-col flex-shrink-0 px-2 w-60 max-h-screen border-r shadow-lg transition-all transform  lg:z-auto lg:static lg:shadow-none bg-light_base-200 dark:bg-dark_base"
      :class="{ '-translate-x-full lg:translate-x-0 lg:w-20': !sidebarState.isOpen }"
    >
      <!-- sidebar header -->
      <!-- <div class="flex justify-center items-center">
        <a href="/" class="mt-3">
          <img alt="ARPHAI logo" src="@/assets/logo.png" class="pb-4 w-40" :class="{ 'w-30': !sidebarState.isOpen }" />
        </a>
      </div> -->
      <!-- Navigation -->
      <nav class="flex px-2 mt-5 font-mono" v-show="sidebarState.isOpen">
        <!-- With sidebar open -->
        <SidebarCollapsible title="TABLERO" :active="isCurrentPath('/situacion_actual_hsi') || isCurrentPath('/')">
          <template #icon>
            <TemplateIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" />
          </template>
          <SidebarCollapsibleItem
            :to="{ name: `situacion_actual_${state.fuente}` }"
            title="Situacion actual"
            :active="isCurrentRoute(`situacion_actual_${state.fuente}`) || isCurrentRoute('index')"
            @click="state.criterio = 'situacion_actual'"
          />
          <SidebarCollapsibleItem
            :to="{ name: `caracterizacion_${state.fuente}` }"
            title="Caracterización"
            :active="isCurrentRoute(`caracterizacion_${state.fuente}`)"
            @click="state.criterio = 'caracterizacion'"
          />
          <SidebarCollapsibleItem
            :to="{ name: `distribucion_espacial_${state.fuente}` }"
            title="Distribución espacial"
            :active="isCurrentRoute(`distribucion_espacial_${state.fuente}`)"
            @click="state.criterio = 'distribucion_espacial'"
          />
        </SidebarCollapsible>
      </nav>
      <nav class="grid grid-cols-1 items-center px-2 mt-32 font-mono" v-show="!sidebarState.isOpen">
        <!-- Without sidebar open -->

        <router-link
          class="flex justify-self-center p-2 m-2 rounded group bg-light_base-200 dark:bg-dark_base"
          :class="[
            isCurrentRoute(`situacion_actual_${state.fuente}`) || isCurrentRoute('index')
              ? `text-${getThemeByDataSource(state.fuente)} hover:text-${getThemeByDataSource(
                  state.fuente
                )} border-3 border-${getThemeByDataSource(state.fuente)}`
              : `border-3 border-${getThemeByDataSource(
                  state.fuente
                )} text-light_contrast hover:text-${getThemeByDataSource(
                  state.fuente
                )} dark:hover:text-${getThemeByDataSource(state.fuente)}  dark:text-dark_contrast`,
          ]"
          v-if="{ name: `situacion_actual_${state.fuente}` }"
          :to="{ name: `situacion_actual_${state.fuente}` }"
          @click="state.criterio = 'situacion_actual'"
          ><Popper arrow disableClickAway hover interactive content="Situación actual"
            ><TrendingUpIcon class="flex-shrink-0 w-6 h-6 group" aria-hidden="true"></TrendingUpIcon>
          </Popper>
        </router-link>

        <router-link
          class="flex justify-self-center p-2 m-2 rounded border-2  group bg-light_base-200 dark:bg-dark_base text-light_contrast dark:text-dark_contrast"
          v-if="{ name: `caracterizacion_${state.fuente}` }"
          :class="[
            isCurrentRoute(`caracterizacion_${state.fuente}`)
              ? `text-${getThemeByDataSource(state.fuente)} hover:text-${getThemeByDataSource(
                  state.fuente
                )} border-3 border-${getThemeByDataSource(state.fuente)}`
              : `border-3 border-${getThemeByDataSource(state.fuente)} hover:text-${getThemeByDataSource(
                  state.fuente
                )} text-light_contrast dark:hover:text-${getThemeByDataSource(state.fuente)}  dark:text-dark_contrast`,
          ]"
          :to="{ name: `caracterizacion_${state.fuente}` }"
          @click="state.criterio = 'caracterizacion'"
          ><Popper arrow disableClickAway hover interactive content="Caracterización"
            ><UserGroupIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" /></Popper
        ></router-link>

        <router-link
          class="flex justify-self-center p-2 m-2 rounded  group bg-light_base-200 dark:bg-dark_base text-light_contrast dark:text-dark_contrast"
          v-if="{ name: `distribucion_espacial_${state.fuente}` }"
          :class="[
            isCurrentRoute(`distribucion_espacial_${state.fuente}`)
              ? `text-${getThemeByDataSource(state.fuente)} hover:text-${getThemeByDataSource(
                  state.fuente
                )} border-3 border-${getThemeByDataSource(state.fuente)}`
              : `border-3 border-${getThemeByDataSource(state.fuente)} hover:text-${getThemeByDataSource(
                  state.fuente
                )} text-light_contrast dark:hover:text-${getThemeByDataSource(state.fuente)}  dark:text-dark_contrast`,
          ]"
          :to="{ name: `distribucion_espacial_${state.fuente}` }"
          @click="state.criterio = 'distribucion_espacial'"
          ><Popper arrow disableClickAway hover interactive content="Geo"
            ><MapIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" /></Popper
        ></router-link>

        <router-link
          class="flex justify-self-center p-2 m-2 rounded  group bg-light_base-200 dark:bg-dark_base text-light_contrast dark:text-dark_contrast"
          v-if="{ name: `about` }"
          :class="[
            isCurrentRoute(`about`)
              ? `text-${getThemeByDataSource(state.fuente)} hover:text-${getThemeByDataSource(
                  state.fuente
                )} border-3 border-${getThemeByDataSource(state.fuente)}`
              : `border-3 border-${getThemeByDataSource(state.fuente)} hover:text-${getThemeByDataSource(
                  state.fuente
                )} text-light_contrast dark:hover:text-${getThemeByDataSource(state.fuente)}  dark:text-dark_contrast`,
          ]"
          :to="{ name: `about` }"
          ><Popper arrow disableClickAway hover interactive content="ARPHAI"
            ><QuestionMarkCircleIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" /></Popper
        ></router-link>
      </nav>
      <!-- To open sidebar -->
      <button
        @click="sidebarState.isOpen = !sidebarState.isOpen"
        class="p-2 rounded-md dark:text-dark_contrast lg:hidden"
      >
        <svg
          class="w-6 h-6 text-gray-600"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    </aside>
    <div class="flex overflow-y-auto flex-col flex-1 h-full dark:bg-dark_base">
      <!-- Navbar -->
      <header class="flex-shrink-0 border-b dark:bg-dark_base">
        <div class="flex justify-between items-center p-2">
          <!-- Navbar left -->
          <div class="flex items-center space-x-3">
            <a href="/" class="p-1">
              <img alt="ARPHAI logo" src="@/assets/logo.png" class="w-28" />
            </a>
            <!-- Toggle sidebar button -->
            <button
              @click="sidebarState.isOpen = !sidebarState.isOpen"
              class="p-2 rounded-md dark:text-dark_contrast focus:outline-none focus:ring"
            >
              <svg
                class="w-4 h-4 text-gray-600"
                :class="{ 'transform transition-transform -rotate-180': sidebarState.isOpen }"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 5l7 7-7 7M5 5l7 7-7 7" />
              </svg>
            </button>
            <!-- Toggle darkmode button -->
            <button @click="toggleDarkMode" class="p-2 rounded-md focus:outline-none focus:ring">
              <!-- light icon -->
              <MoonIcon
                v-show="!isDark"
                class="flex-shrink-0 w-6 h-6 dark:hover:text-secondary dark:text-dark_contrast"
                aria-hidden="true"
              />
              <!-- dark icon -->
              <SunIcon v-show="isDark" class="flex-shrink-0 w-6 h-6 hover:text-secondary" aria-hidden="true" />
            </button>
          </div>
        </div>
      </header>
      <!-- Main Content -->
      <div
        class="font-mono  scrollbar-thin scrollbar-thumb-secondary scrollbar-track-light_base dark:scrollbar-thumb-secondary dark:scrollbar-track-dark_base"
      >
        <div v-show="!isCurrentRoute(`about`)" class="inline-flex grid grid-cols-1 pl-4 mt-4 ml-4 text-left">
          <span class="float-left text-4xl align-middle">COVID-19</span>
          <span class="float-left font-semibold leading-relaxed align-middle">
            Tablero de información epidemiológica
          </span>
          <span class="float-left leading-relaxed align-middle"> Última actualización: 27/05/2022 </span>
        </div>
        <!-- Tabs -->
        <TabGroup>
          <TabList v-show="!isCurrentRoute(`about`)" class="float-right pt-2 pr-20">
            <Popper
              :class="[isCurrentRoute(`${state.criterio}_hsi`) ? 'hsi' : 'snvs']"
              placement="top"
              arrow
              disableClickAway
              hover
              interactive
              content="Los datos de esta sección corresponden 
              a los registros de la atención ambulatoria en historia clínica electrónica"
            >
              <Tab
                as="template"
                v-slot="{ selected }"
                class="px-4 py-2 -mb-px text-white border-3 border-primary bg-primary"
              >
                <router-link
                  @click="state.fuente = 'hsi'"
                  :class="[selected ? 'shadow-inner opacity-100' : 'border-none opacity-50']"
                  class="py-1 font-extrabold group"
                  :to="{ name: `${state.criterio}_hsi` }"
                  tag="button"
                  >HSI</router-link
                >
              </Tab>
            </Popper>
            <Popper
              arrow
              disableClickAway
              hover
              interactive
              content="Los datos de esta sección corresponden a los registros de los eventos de notificación obligatoria en
                  el Sistema Nacional de Vigilancia en Salud"
            >
              <Tab
                class="px-4 py-2 -mb-px font-semibold text-white shadow-lg bg-secondary border-secondary"
                v-slot="{ selected }"
                as="template"
              >
                <router-link
                  @click="state.fuente = 'snvs'"
                  :class="[selected ? 'shadow-inner border-3 border-secondary opacity-100' : 'opacity-50']"
                  class="py-1 font-extrabold group dark:text-dark_contrast"
                  :to="{ name: `${state.criterio}_snvs` }"
                  tag="button"
                  >SNVS</router-link
                >
              </Tab>
            </Popper>
          </TabList>
          <TabPanels>
            <TabPanel><RouterViewTransition></RouterViewTransition></TabPanel>
            <TabPanel><RouterViewTransition></RouterViewTransition></TabPanel>
          </TabPanels>
        </TabGroup>
      </div>
    </div>
  </div>
</template>

<script>
import { useRouter } from 'vue-router'
import { ref } from 'vue'
import { getColorByDataSource, sidebarState, isDark, toggleDarkMode, useGlobalState } from '@/composables'
import {
  MoonIcon,
  QuestionMarkCircleIcon,
  SunIcon,
  TrendingUpIcon,
  TemplateIcon,
  MapIcon,
  UserGroupIcon,
} from '@heroicons/vue/outline'
import SidebarCollapsible from '@/components/SidebarCollapsible.vue'
import { TabGroup, TabList, Tab, TabPanels, TabPanel } from '@headlessui/vue'
import SidebarCollapsibleItem from '@/components/SidebarCollapsibleItem.vue'
import RouterViewTransition from '@/components/RouterViewTransition.vue'
import Popper from 'vue3-popper'
import { getThemeByDataSource } from '@/composables'

const isCurrentRoute = (routeName) => {
  return useRouter().currentRoute.value.name == routeName
}

const isCurrentPath = (path) => {
  return useRouter().currentRoute.value.path.startsWith(path)
}

export default {
  components: {
    SidebarCollapsible,
    SidebarCollapsibleItem,
    MoonIcon,
    SunIcon,
    TemplateIcon,
    MapIcon,
    UserGroupIcon,
    TrendingUpIcon,
    TabGroup,
    TabList,
    Tab,
    TabPanels,
    TabPanel,
    RouterViewTransition,
    Popper,
    QuestionMarkCircleIcon,
  },
  setup() {
    const state = useGlobalState()
    return {
      isCurrentPath,
      isCurrentRoute,
      sidebarState,
      isDark,
      toggleDarkMode,
      state,
      getThemeByDataSource,
    }
  },
}
</script>
<style scoped>
:deep(.popper) {
  background: #f1e5e2;
  padding: 10px;
  border-radius: 3px;
  color: #605e5d;
  font-weight: bold;
  max-width: 30rem;
  font-size: 14px;
  margin-right: 5rem;
}

:deep(.popper #arrow::before) {
  background: #f1e5e2;
}

:deep(.popper:hover),
:deep(.popper:hover > #arrow::before) {
  background: #f1e5e2;
}
</style>
