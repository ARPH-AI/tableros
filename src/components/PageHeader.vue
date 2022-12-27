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

const { dataSource } = storeToRefs(useDataSourceStore())
</script>

<template>
  <header class="flex-shrink-0 border-b border-light_contrast dark:border-dark_contrast dark:bg-dark_base"></header>
</template>
