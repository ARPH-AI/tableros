<template>
  <a
    v-if="href"
    :href="href"
    :class="[
      'p-2 flex items-center gap-2 rounded-md transition-colors',
      {
        'dark:text-dark_contrast text-light_contrast hover:text-primary dark:hover:text-primary': !active,
        'dark:text-secondary text-primary shadow-lg hover:bg-secondary': active,
      },
    ]"
  >
    <slot name="icon"> </slot>

    <span class="font-medium text-primary">{{ title }}</span>
  </a>
  <router-link
    v-else-if="to"
    :to="to"
    :class="[
      'p-2 flex items-center gap-2 rounded-md transition-colors',
      {
        'dark:text-dark_contrast text-light_contrast': !active,
        'dark:text-dark_contrast shadow-lg ': active,
      },
    ]"
  >
    <slot name="icon"> </slot>

    <span class="text-base font-medium">{{ title }}</span>
  </router-link>
  <button
    v-else
    type="button"
    :class="[
      'p-2 flex items-center gap-2 rounded-md transition-colors',
      {
        'p-2 dark:text-dark_contrast text-light_contrast hover:bg-secondary dark:hover:text-gray-300 dark:hover:bg-slate-900':
          !active,
        'dark:text-dark_contrast shadow-lg': active,
      },
    ]"
  >
    <slot name="icon"> </slot>

    <span class="text-base font-medium">{{ title }}</span>
    <slot name="arrow" />
  </button>
</template>

<script setup>
const props = defineProps({
  active: {
    type: Boolean,
    default: false,
  },
  title: {
    type: String,
    required: true,
  },
  href: { default: 'seccion-situacion-actual', type: [String, Object] },
  to: { default: 'seccion-situacion-actual', type: [String, Object] },
})
</script>
