<script setup lang="ts">
const props = defineProps({ cantidad: { type: String, default: '0' }, titulo: { type: String } })
</script>

<template>
  <div
    class="
      border-r-4 border-secondary
      rounded-lg
      bg-light_smooth-50
      dark:bg-dark_smooth
      shadow-lg
      md:shadow-xl
      relative
      overflow-auto
    "
  >
    <div class="text-light_contrast dark:text-dark_contrast pt-2 pb-4 text-center relative z-10">
      <h3 class="text-3xl font-semibold leading-tight my-3">
        {{ Number(cantidad).toLocaleString() }}
      </h3>
      <h4 class="text-sm uppercase font-extrabold leading-tight">
        {{ titulo }}
      </h4>
    </div>
  </div>
</template>

<style scoped></style>
