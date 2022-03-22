<script setup lang="ts">
const props = defineProps({ cantidad: { type: String, default: '0' }, titulo: { type: String } })
</script>

<template>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title p-3 border bg-light">{{ titulo }}</h5>
      <p class="card-text fw-normal fs-1">{{ Number(cantidad).toLocaleString() }}</p>
    </div>
  </div>
</template>

<style scoped></style>
