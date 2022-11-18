<template>
  <div class="hover:opacity-50">
    <router-link
      class="rounded-2xl grid grid-cols-1 gap-3 place-items-center"
      :aria-label="`Navegar hacia la sección ${props.section.title}`"
      :to="props.section.key"
      @click="currentSection = props.section.key"
    >
      <h3 class="w-full p-3 bg-light_smooth dark:bg-dark_smooth rounded-lg font-medium">
        {{ props.section.title }}
      </h3>

      <div
        class="
          p-3
          h-full
          bg-light_smooth
          dark:bg-dark_smooth
          rounded-3xl
          w-full
          place-items-center
          text-justify
          rounded-2xl
        "
      >
        <p class="line-clamp-5">{{ props.section.description }}</p>
      </div>
    </router-link>
  </div>
</template>

<script setup>
import { storeToRefs } from 'pinia'

import { useSectionsStore } from '@/stores/sections-store.ts'

const { currentSection } = storeToRefs(useSectionsStore())

const props = defineProps({
  section: {
    type: Object,
    required: true,
  },
})
</script>
