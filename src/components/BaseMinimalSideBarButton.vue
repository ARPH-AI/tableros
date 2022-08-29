<template>
  <router-link
    :aria-label="`Navegar hacia la sección ${props.section.key}`"
    class="flex justify-self-center p-2 m-2 group"
    :class="[
      isCurrentRoute(section.key) || isCurrentRoute('index')
        ? `dark:bg-${getThemeByDataSource(dataSource)}_dark bg-${
            props.colorTheme
          } rounded-xl text-dark_contrast hover:text-dark_contrast`
        : ` hover:text-${props.sections} text-light_contrast dark:hover:text-${props.colorTheme}  dark:text-dark_contrast`,
    ]"
    :to="props.section.key"
    ><Popper arrow disable-click-away hover interactive :content="props.section.title"
      >{{ renderIcon(props.section.key) }}
    </Popper>
  </router-link>
</template>

<script setup>
import { TrendingUpIcon, MapIcon, UserGroupIcon } from '@heroicons/vue/outline'
import { isCurrentRoute } from '@/composables'
import Popper from 'vue3-popper'
import { getThemeByDataSource } from '@/composables'

const props = defineProps({
  section: {
    type: Object,
    required: true,
  },
  colorTheme: {
    type: String,
    required: true,
  },
  iconComponent: {
    type: Element,
    required: true,
  },
})
</script>
