<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts"></script>

<template>
  <div class="grid gap-3 px-4 py-4 mt-5 w-full md:px-10">
    <div
      class="
        flex
        absolute
        left-40
        z-10
        flex-col
        p-8
        w-full
        bg-white
        rounded-lg
        shadow-lg
        dark:texto-light_contrast
        top-50
        lg:w-1/3
        md:w-1/2 md:ml-auto md:mt-0
      "
    >
      <h2 class="mb-1 text-xl font-semibold title-font dark:text-light_contrast">Análisis geoespacial</h2>
      <p class="leading-relaxed dark:text-light_contrast">
        Identificación de clusters de casos activos registrados en la HSI, a partir de la georreferenciación de la
        residencia de las personas.
      </p>
    </div>
    <Suspense><Localizacion class="relative" /></Suspense>
  </div>
</template>

<style scoped></style>
