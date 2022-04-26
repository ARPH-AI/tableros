<template>
  <li
    :class="[
      'relative leading-8 m-0 pl-6',
      'before:block before:w-4 before:h-0 before:absolute before:left-0 before:top-4 before:border-t-2 before:border-t-gray-200 before:-mt-0.5',
      'last:before:bg-white last:before:h-auto last:before:top-4 last:before:bottom-0',
      'dark:last:before:bg-dark_base dark:before:border-t-dark_contrast',
    ]"
  >
    <router-link
      v-if="to"
      :to="to"
      v-bind="$attrs"
      :class="[
        'transition-colors hover:text-secondary dark:hover:text-secondary',
        {
          'text-secondary font-semibold': active,
          'text-light_contrast dark:text-dark_contrast': !active,
        },
      ]"
      >{{ title }}</router-link
    >
  </li>
</template>

<script setup>
const props = defineProps({
  href: String,
  to: [String, Object],
  title: String,
  active: {
    type: Boolean,
    default: false,
  },
})
</script>
