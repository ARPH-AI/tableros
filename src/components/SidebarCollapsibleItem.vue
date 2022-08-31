<template>
  <li
    :class="[
      'relative leading-8 m-0 pl-6',
      'before:block before:w-4 before:h-0 before:absolute before:left-0 before:top-4 before:border-t-2 before:border-t-light_base before:-mt-0.5',
      'last:before:bg-light_base last:before:h-auto last:before:top-4 last:before:bottom-0',
      'dark:last:before:bg-dark_base dark:before:border-t-dark_contrast',
    ]"
  >
    <router-link
      v-if="to"
      :to="to"
      v-bind="$attrs"
      :class="[
        'transition-colors hover:text-color_1 dark:hover:text-color_1',
        {
          'text-color_1 font-semibold': active,
          'text-light_contrast dark:text-dark_contrast': !active,
        },
      ]"
      >{{ title }}</router-link
    >
  </li>
</template>

<script setup>
const props = defineProps({
  href: { default: 'seccion-situacion-actual', type: [String, Object] },
  to: { default: 'seccion-situacion-actual', type: [String, Object] },
  title: { type: String, default: '' },
  active: {
    type: Boolean,
    default: false,
  },
})
</script>
