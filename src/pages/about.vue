<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts"></script>

<template>
  <div class="grid grid-cols-1 h-screen md:grid-cols-5">
    <div
      class="
        grid grid-cols-1
        px-10
        pt-10
        border-t-2 border-l-2
        dark:border-dark_contrast
        border-light_contrast
        md:col-span-3
      "
    >
      <div
        class="
          pt-12
          pr-10
          border-r-2 border-b-2 border-dashed
          full-width
          dark:border-dark_contrast
          border-light_contrast
        "
      >
        <h1 class="text-3xl font-bold text-left uppercase">Proyecto ARPHAI</h1>
        <p class="mt-2 font-semibold text-left">Visualización de datos para la epidemiología</p>
        <p class="mt-4 text-left">
          Se trata deun tablero de información epidemiológica sobre Covid 19 en base a los datos de registros clínicos
          electrónicos de la Historia de Salud Integrada (HSI) y datos del Sistema Nacional de Vigilancia en Salud
          (SNVS). Tiene como principal objetivo brindar información sistematizada y actualizada para la detección
          temprana y el monitoreo de casos confirmados y activos de Covid 19.
        </p>
        <p class="text-left">La estructura general del tablero presenta 3 secciones principales:</p>
        <p class="text-left">i) Situación actual</p>
        <p class="text-left">ii) Análisis</p>
        <p class="text-left">iii) Caracterización - Edad, sexo y comorbilidades.</p>
      </div>
      <div class="grid content-center full-width">
        <h1 class="text-xl uppercase">Análisis geoespacial</h1>
        <p class="mb-2 font-semibold">Cluster de casos activos</p>
        <p>
          Se encuentra un mapa con la georreferenciación de la residencia de las personas (tomando el dato de dirección
          de la HSI) para identificación de clusters de casos activos registrados en la HSI.
        </p>
      </div>
    </div>
    <div class="grid grid-cols-1 border-t-2 md:col-span-2 dark:border-dark_contrast border-light_contrast">
      <div class="grid content-center">
        <div class="mt-5 mb-auto max-w-lg">
          <h1 class="text-xl uppercase">Situación actual</h1>
          <p class="mb-4 font-semibold">Indicadores actualizados</p>
          <p>
            Aquí se incluyen indicadores que brindan en una mirada sucinta y general, la situación actual de la
            notificación de casos de Covid19 (tanto por HSI para los efectores que nuclea, como por SNVS).
          </p>
        </div>
      </div>

      <div class="flex bg-gray-100">
        <div class="max-w-lg">
          <h1 class="text-xl uppercase">Caracterización</h1>
          <p class="mb-4 font-semibold">Edad, sexo, comorbilidades</p>
          <p>
            Se utilizaron datos como fecha de nacimiento, fecha de la consulta y sexo, para elaborar indicadores
            significativos que sintetizan la progresión de la pandemia de Covid 19 por grupos de edad y sexo. En cuanto
            a las comorbilidades, buscamos hacer foco en el análisis de un grupo poblacional relevante para Covid-19 y
            que pueda ser identificado en forma temprana.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>
