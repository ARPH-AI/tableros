<script setup lang="ts">
defineProps<{
  titulo: string
  colorTheme: string
}>()
</script>

<template>
  <div
    :class="`sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 2xl:border-r-4 shadow-2xl bg-light_smooth dark:bg-dark_smooth dark:border-${colorTheme}_dark border-${colorTheme}`"
  >
    <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
      <h4 class="pl-2 text-sm uppercase border-l-4 border-light_contrast dark:border-dark_contrast">
        {{ titulo }}
      </h4>
      <slot></slot>
    </div>
  </div>
</template>

<style scoped></style>
