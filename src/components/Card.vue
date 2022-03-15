<script setup lang="ts">
const props = defineProps<{ cantidad: string; titulo: string }>()
</script>

<template>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title p-3 border bg-light">{{ titulo }}</h5>
      <p class="card-text fw-normal fs-1">{{ cantidad }}</p>
    </div>
  </div>
</template>

<style scoped></style>
