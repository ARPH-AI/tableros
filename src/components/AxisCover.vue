<template>
  <div class="hover:opacity-50">
    <router-link
      class="rounded-2xl grid hover:text-light_contrast grid-cols-1 gap-3 place-items-center"
      :aria-label="`Navegar hacia la sección ${props.section.title}`"
      :to="props.section.key"
      @click="onClickHandler()"
    >
      <h2 class="dark:text-dark_contrast w-full p-3 bg-light_smooth dark:bg-dark_smooth rounded-lg font-medium">
        {{ props.section.title }}
      </h2>

      <div
        class="
          dark:text-dark_contrast
          p-3
          h-40
          bg-light_smooth
          dark:bg-dark_smooth
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
import { useSectionsStore } from '@/stores/sections-store.ts'
const sectionsStore = useSectionsStore()

const onClickHandler = () => {
  sectionsStore.setCurrentSection(props.section.key)
  sectionsStore.setSectionTitle(props.section.title)
  sectionsStore.setAxisTitle(props.section.key)
}

const props = defineProps({
  section: {
    type: Object,
    required: true,
  },
})
</script>
