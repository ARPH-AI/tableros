<template>
  <div
    class="
      my-10
      mx-16
      transition-opacity
      duration-300
      hover:opacity-50
      p-3
      bg-light_smooth
      dark:bg-dark_smooth
      rounded-3xl
    "
  >
    <router-link
      class="rounded-3xl grid grid-cols-1 gap-4 place-items-center"
      :aria-label="`Navegar hacia la sección ${props.section.title}`"
      :to="props.section.key"
    >
      <div class="w-full h-full place-items-center rounded-3xl bg-light_base dark:bg-dark_contrast">
        <h2 class="p-4 inline-block align-middle">{{ props.section.title }}</h2>
      </div>
      <div class="p-3 h-full w-full place-items-center text-justify rounded-3xl bg-light_base dark:bg-dark_contrast">
        <p class="line-clamp-6">{{ props.section.description }}</p>
      </div>
    </router-link>
  </div>
</template>

<script setup>
const props = defineProps({
  section: {
    type: Object,
    required: true,
  },
})
</script>
