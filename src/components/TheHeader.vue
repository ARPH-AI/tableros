<route lang="yaml">
meta:
  public: true
</route>
<script setup>
import Popper from 'vue3-popper'
import { MoonIcon, SunIcon, LogoutIcon } from '@heroicons/vue/outline'
import ProfileAvatar from 'vue-profile-avatar'
import { sidebarState, isDark, toggleDarkMode } from '@/composables'
import { getThemeByDataSource } from '@/composables'
import { storeToRefs } from 'pinia'
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'
import { useDataSourceStore } from '@/stores/data-source-store.ts'
import { isCurrentRoute } from '@/composables'
import { general_sections } from '@/constants'
import { QuestionMarkCircleIcon } from '@heroicons/vue/outline'
import { useSectionsStore } from '@/stores/sections-store'

const { dataSource } = storeToRefs(useDataSourceStore())
const { axisTitle } = storeToRefs(useSectionsStore())
</script>

<template>
  <header class="flex-shrink-0 border-b border-light_contrast dark:border-dark_contrast dark:bg-dark_base">
    <div class="flex justify-between items-center p-2">
      <!-- Navbar left -->
      <div class="flex items-center space-x-3">
        <a aria-label="Navegar al inicio del sitio" href="/" class="p-1">
          <img alt="ARPHAI logo" src="@/assets/logo.png" class="w-20" />
        </a>

        <span class="float-left font-sans font-semibold leading-relaxed align-middle">
          Tablero de información epidemiológica
        </span>
        <span v-show="axisTitle" class="float-left font-sans font-semibold leading-relaxed align-middle"
          >/ {{ axisTitle }}</span
        >
        <span v-show="$auth.user.userDepartment" class="float-left font-sans font-semibold leading-relaxed align-middle"
          >/ {{ $auth.user.userDepartment }}</span
        >
      </div>
      <div class="flex items-center space-x-3">
        <router-link
          :aria-label="`Navegar hacia la sección ${general_sections.INFORMACION.title}`"
          class="flex justify-self-center p-2 group text-light_contrast dark:text-dark_contrast"
          :class="[
            isCurrentRoute(general_sections.INFORMACION.key)
              ? `text-${getThemeByDataSource(dataSource)}`
              : `hover:text-${getThemeByDataSource(
                  dataSource
                )} text-light_contrast dark:hover:text-${getThemeByDataSource(dataSource)}  dark:text-dark_contrast`,
          ]"
          :to="general_sections.INFORMACION.key"
          ><Popper arrow disable-click-away hover interactive :content="general_sections.INFORMACION.title"
            ><QuestionMarkCircleIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" /></Popper
        ></router-link>
        <!-- Toggle darkmode button -->
        <button aria-label="Cambiar tema" class="p-2" @click="toggleDarkMode">
          <!-- light icon -->
          <MoonIcon v-show="!isDark" class="flex-shrink-0 w-6 h-6 text-light_contrast" aria-hidden="true" />
          <!-- dark icon -->
          <SunIcon v-show="isDark" class="flex-shrink-0 w-6 h-6" aria-hidden="true" />
        </button>

        <!-- User menu dropdown -->
        <Menu as="div" class="inline-block relative z-50 font-sans">
          <MenuButton class="inline-flex justify-center w-full">
            <ProfileAvatar
              :bg-color="isDark ? '#FFFF' : '#000'"
              border-color="isDark ? '#FFFF' : '#000'"
              border
              :username="$auth.user.email"
              :text-color="isDark ? '#000' : '#FFF'"
            ></ProfileAvatar>
          </MenuButton>
          <transition
            enter-active-class="transition duration-100 ease-out"
            enter-from-class="opacity-0 transform scale-95"
            enter-to-class="opacity-100 transform scale-100"
            leave-active-class="transition duration-75 ease-in"
            leave-from-class="opacity-100 transform scale-100"
            leave-to-class="opacity-0 transform scale-95"
          >
            <MenuItems
              :class="`absolute right-0 mt-1 w-56 bg-white rounded-md divide-y divide-black ring-1 ring-black text-bold ring-opacity-5 shadow-lg origin-top-right focus:outline-none`"
            >
              <div class="px-1 py-1">
                <MenuItem class="flex items-center px-2 py-2 w-full text-sm first-line:rounded-md group">
                  <span class="dark:text-light_contrast">{{ $auth.user.email }}</span>
                </MenuItem>
                <MenuItem v-slot="{ active }">
                  <button
                    aria-label="Desplegar menú de usuarie"
                    :class="[
                      active ? `bg-light_smooth text-${getThemeByDataSource(dataSource)}` : 'bg-white text-dark_smooth',
                      'group flex w-full items-center rounded-md px-2 py-2 text-sm',
                    ]"
                    @click="$auth.logout"
                  >
                    <LogoutIcon :active="active" class="mr-2 w-5 h-5 text-third" aria-hidden="true" />
                    Cerrar sesión
                  </button>
                </MenuItem>
              </div>
            </MenuItems>
          </transition>
        </Menu>
      </div>
    </div>
  </header>
</template>
