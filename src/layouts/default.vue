<script setup lang="ts"></script>

<template>
  <div
    v-if="$auth.isAuthenticated"
    class="min-h-screen bg-light_base dark:bg-dark_base text-light_contrast dark:text-dark_contrast"
  >
    <Dashboard />
  </div>
  <span v-else><Login /></span>
</template>

<style></style>
