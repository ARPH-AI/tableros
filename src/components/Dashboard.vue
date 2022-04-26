<template>
  <div class="flex h-screen overflow-y-hidden bg-light_base-100 dark:dark_base">
    <!-- Sidebar -->
    <aside
      x-transition:enter="transition transform duration-300"
      x-transition:enter-start="-translate-x-full opacity-30  ease-in"
      x-transition:enter-end="translate-x-0 opacity-100 ease-out"
      x-transition:leave="transition transform duration-300"
      x-transition:leave-start="translate-x-0 opacity-100 ease-out"
      x-transition:leave-end="-translate-x-full opacity-0 ease-in"
      class="
        fixed
        inset-y-0
        z-10
        flex flex-col flex-shrink-0
        max-h-screen
        overflow-hidden
        transition-all
        transform
        border-r
        shadow-lg
        lg:z-auto lg:static lg:shadow-none
        bg-light_base-200
        dark:bg-dark_base dark:border-r-secondary
        px-2
        w-60
      "
      :class="{ '-translate-x-full lg:translate-x-0 lg:w-20': !sidebarState.isOpen }"
    >
      <!-- sidebar header -->
      <div class="flex items-center justify-center">
        <a href="/" class="mt-3">
          <img alt="ARPHAI logo" src="@/assets/logo.png" class="w-40 pb-4" :class="{ 'w-30': !sidebarState.isOpen }" />
        </a>
      </div>
      <!-- Navigation -->
      <nav v-show="sidebarState.isOpen" class="font-mono flex mt-5 px-2">
        <!-- With sidebar open -->
        <SidebarCollapsible title="DASHBOARD" :active="isCurrentPath('/situacion_actual_hsi') || isCurrentPath('/')">
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
      <nav v-show="!sidebarState.isOpen" class="font-mono grid grid-cols-1 items-center mt-5 px-2">
        <!-- Without sidebar open -->
        <router-link
          v-if="{ name: `situacion_actual_${state.fuente}` }"
          class="
            group
            flex
            justify-self-center
            m-2
            p-2
            bg-light_base-200
            dark:bg-dark_base
            rounded
            border-2
            text-light_contrast
            hover:text-secondary
            dark:text-dark_contrast dark:border-secondary dark:hover:text-secondary
          "
          :class="[
            isCurrentRoute(`situacion_actual_${state.fuente}`) || isCurrentRoute('index')
              ? 'text-secondary dark:text-dark_contrast'
              : 'text-light_contrast hover:text-secondary dark:text-dark_contrast dark:border-secondary',
          ]"
          :to="{ name: `situacion_actual_${state.fuente}` }"
          @click="state.criterio = 'situacion_actual'"
          ><TrendingUpIcon class="group flex-shrink-0 w-6 h-6" aria-hidden="true"
            ><span
              class="
                tooltip-text
                bg-blue-200
                p-3
                -mt-16
                -ml-6
                rounded
                hidden
                group-hover:block
                absolute
                text-center
                py-2
                px-6
                z-50
              "
              >Look at this!</span
            ></TrendingUpIcon
          >
          <span
            class="
              tooltip-text
              bg-blue-200
              p-3
              -mt-16
              -ml-6
              rounded
              hidden
              group-hover:block
              absolute
              text-center
              py-2
              px-6
              z-50
            "
            >Look at this!</span
          ></router-link
        >
        <router-link
          v-if="{ name: `caracterizacion_${state.fuente}` }"
          class="
            flex
            justify-self-center
            m-2
            p-2
            bg-light_base-200
            dark:bg-dark_base
            rounded
            border-2
            text-light_contrast
            hover:text-secondary
            dark:text-dark_contrast dark:border-secondary dark:hover:text-secondary
          "
          :class="[
            isCurrentRoute(`caracterizacion_${state.fuente}`)
              ? 'text-secondary dark:text-dark_contrast'
              : 'text-light_contrast hover:text-secondary dark:text-dark_contrast dark:border-secondary',
          ]"
          :to="{ name: `caracterizacion_${state.fuente}` }"
          @click="state.criterio = 'caracterizacion'"
          ><UserGroupIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true"
        /></router-link>
        <router-link
          v-if="{ name: `distribucion_espacial_${state.fuente}` }"
          class="
            flex
            justify-self-center
            m-2
            p-2
            bg-light_base-200
            dark:bg-dark_base
            rounded
            border-2
            text-light_contrast
            hover:text-secondary
            dark:text-dark_contrast dark:border-secondary dark:hover:text-secondary
          "
          :class="[
            isCurrentRoute(`distribucion_espacial_${state.fuente}`)
              ? 'text-secondary dark:text-dark_contrast'
              : 'text-light_contrast hover:text-secondary dark:text-dark_contrast dark:border-secondary',
          ]"
          :to="{ name: `distribucion_espacial_${state.fuente}` }"
          @click="state.criterio = 'distribucion_espacial'"
          ><MapIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true"
        /></router-link>
      </nav>
      <!-- To open sidebar -->
      <button
        class="dark:text-dark_contrast p-2 rounded-md lg:hidden"
        @click="sidebarState.isOpen = !sidebarState.isOpen"
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
    <div class="flex flex-col flex-1 h-full overflow-hidden dark:bg-dark_base">
      <!-- Navbar -->
      <header class="dark:bg-dark_base flex-shrink-0 border-b dark:border-b-secondary">
        <div class="flex items-center justify-between p-2">
          <!-- Navbar left -->
          <div class="flex items-center space-x-3">
            <span class="p-2 text-xl font-semibold tracking-wider uppercase lg:hidden">ARPHAI</span>
            <!-- Toggle sidebar button -->
            <button
              class="dark:text-dark_contrast p-2 rounded-md focus:outline-none focus:ring"
              @click="sidebarState.isOpen = !sidebarState.isOpen"
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
            <button class="p-2 rounded-md focus:outline-none focus:ring" @click="toggleDarkMode">
              <!-- light icon -->
              <MoonIcon
                v-show="isDark"
                class="dark:hover:text-secondary dark:text-dark_contrast flex-shrink-0 w-6 h-6"
                aria-hidden="true"
              />
              <!-- dark icon -->
              <SunIcon v-show="!isDark" class="hover:text-secondary flex-shrink-0 w-6 h-6" aria-hidden="true" />
            </button>
          </div>
        </div>
      </header>
      <!-- Main Content -->
      <div
        class="
          font-mono
          flex-1
          scrollbar-thin scrollbar-thumb-secondary
          scrollbar-track-light_base
          overflow-y-auto
          dark:scrollbar-thumb-secondary dark:scrollbar-track-dark_base
        "
      >
        <!-- Tabs -->
        <TabGroup>
          <div class="grid grid-cols-2 mt-2 border-b border-b-secondary">
            <TabList class="inline-flex w-full px-1 pt-2">
              <Tab
                v-slot="{ selected }"
                as="template"
                class="px-4 py-2 -mb-px font-semibold border-b-2 border-secondary rounded-t opacity-90"
              >
                <router-link
                  :class="[
                    selected
                      ? 'hover:text-secondary from-primary to-secondary via-third bg-gradient-to-r dark:text-dark_contrast text-dark_contrast'
                      : 'dark:bg-dark_base bg-light_base-200 border text-light_contrast dark:hover:text-secondary hover:text-secondary',
                  ]"
                  class="font-extrabold py-1 dark:text-dark_contrast"
                  :to="{ name: `${state.criterio}_hsi` }"
                  tag="button"
                  @click="state.fuente = 'hsi'"
                  >HSI</router-link
                >
              </Tab>
              <Tab
                v-slot="{ selected }"
                class="px-4 py-2 -mb-px font-semibold border-b-2 border-secondary rounded-t opacity-90"
                as="template"
              >
                <router-link
                  :class="[
                    selected
                      ? 'hover:text-secondary from-primary to-secondary via-third bg-gradient-to-r text-dark_contrast'
                      : 'dark:bg-dark_base bg-light_base-200 border text-light_contrast dark:hover:text-secondary hover:text-secondary',
                  ]"
                  class="font-extrabold py-1 dark:text-dark_contrast"
                  :to="{ name: `${state.criterio}_snvs` }"
                  tag="button"
                  @click="state.fuente = 'snvs'"
                  >SNVS</router-link
                >
              </Tab>
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

<script>
import { useRouter } from 'vue-router'
import { sidebarState, isDark, toggleDarkMode, useGlobalState } from '@/composables'
import { MoonIcon, SunIcon, TrendingUpIcon, TemplateIcon, MapIcon, UserGroupIcon } from '@heroicons/vue/outline'
import SidebarCollapsible from '@/components/SidebarCollapsible.vue'
import { TabGroup, TabList, Tab, TabPanels, TabPanel } from '@headlessui/vue'
import SidebarCollapsibleItem from '@/components/SidebarCollapsibleItem.vue'
import RouterViewTransition from '@/components/RouterViewTransition.vue'

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
    }
  },
}
</script>
