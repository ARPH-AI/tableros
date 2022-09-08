<script setup lang="ts"></script>

<template>
  <div
    v-if="$auth.isAuthenticated"
    class="min-h-screen bg-light_base dark:bg-dark_base text-light_contrast dark:text-dark_contrast"
  >
    <Dashboard />
  </div>
  <div v-else>
    <Login />
  </div>
</template>

<style></style>
