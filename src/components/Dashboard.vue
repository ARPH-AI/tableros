<template>
  <div class="flex relative h-full bg-light_base dark:dark_base">
    <!-- Sidebar -->
    <aside
      x-transition:enter="transition transform duration-300"
      x-transition:enter-start="-translate-x-full opacity-30 ease-in"
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
        flex-col flex-shrink-0
        px-2
        w-60
        border-r
        border-light_contrast
        dark:border-dark_contrast
        shadow-lg
        transition-all
        transform
        lg:z-auto lg:static lg:shadow-none
        bg-light_base-200
        dark:bg-dark_base
        -translate-x-full
        lg:translate-x-0 lg:w-20
        font-sans
      "
    >
      <!-- Expanded Sidebar Navigation -->
      <!-- <Sidebar v-show="sidebarState.isOpen && !isCurrentRoute(general_sections.HOME.key)" /> -->
      <!-- Minimal Sidebar Navigation -->
      <MinimalSidebar />
    </aside>
    <div class="flex overflow-y-auto flex-col flex-1 h-full dark:bg-dark_base">
      <!-- Header -->
      <TheHeader />
      <!-- Main Content -->
      <main
        class="
          h-full
          font-sans
          flew-row
          scrollbar-thin
          scrollbar-thumb-color_1
          scrollbar-track-light_base
          dark:scrollbar-thumb-color_1_dark dark:scrollbar-track-dark_base
        "
      >
        <!-- ENOs -->
        <div v-if="currentSection == 'enos'"><Base /></div>

        <!-- Vigilancia Sindromica  -->
        <div v-else><RouterViewTransition></RouterViewTransition></div>
      </main>
    </div>
  </div>
</template>

<script setup>
import RouterViewTransition from '@/components/RouterViewTransition.vue'
import { storeToRefs } from 'pinia'
import { useSectionsStore } from '@/stores/sections-store.ts'
const { currentSection } = storeToRefs(useSectionsStore())
</script>
