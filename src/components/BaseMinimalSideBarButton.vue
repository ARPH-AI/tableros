<template>
  <router-link
    :aria-label="`Navegar hacia la sección ${props.section.key}`"
    class="flex justify-self-center p-2 m-2 group"
    :class="[
      isCurrentRoute(section.key)
        ? `hover:text-dark_contrast dark:hover:text-light_contrast dark:bg-${props.colorTheme}_dark bg-${props.colorTheme} rounded-xl text-dark_contrast dark:text-light_contrast`
        : `hover:text-${props.colorTheme} text-light_contrast dark:hover:text-${props.colorTheme}_dark  dark:text-dark_contrast`,
    ]"
    :to="props.section.key"
    ><Popper arrow disable-click-away hover interactive :content="props.section.title"
      ><props.section.iconComponent class="flex-shrink-0 w-6 h-6" />
    </Popper>
  </router-link>
</template>

<script setup>
import { isCurrentRoute } from '@/composables'
import Popper from 'vue3-popper'

const props = defineProps({
  section: {
    type: Object,
    required: true,
  },
  colorTheme: {
    type: String,
    required: true,
  },
})
</script>
