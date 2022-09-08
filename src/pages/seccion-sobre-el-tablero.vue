<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { sections, data_sources } from '@/constants'
</script>

<template>
  <div class="flex h-screen text-left flex-row">
    <main class="flex">
      <div class="flex-1 flex-col">
        <div class="pt-10 px-10">
          <h1 class="text-3xl font-bold transition ease-out duration-800">Tablero epidemiológico</h1>
          <p class="transition ease-out duration-800 mt-3">
            El tablero tiene cómo objetivo principal, contribuir a identificar en forma temprana eventos de relevancia
            en vigilancia epidemiológica, para el desarrollo de acciones de identificación de brote y/o prevención en
            forma oportuna.
          </p>
        </div>
        <div class="p-10">
          <h1 class="text-xl font-bold">Estructura general</h1>
          <p class="mt-4 font-semibold">Eventos de Notificacion Obligatoria</p>
          <p class="mt-3">
            El tablero presenta informacion sobre las ENOs Covid-19 y Dengue. De cada una se despliegan 3 secciones que
            denotan distintas dimensiones posibles de su analisis.
          </p>
          <BaseDisclosure :content="sections"></BaseDisclosure>
          <p class="mt-5 font-semibold">Consultas febriles</p>
          <p class="mt-3">
            Aqui se visualizan las consultas totales, las consultas febriles y dentro de estas las febriles con y sin
            sintomatología respiratoria. Esta sección busca realizar un aporte a la vigilancia sindrómica de las
            Enfermedades de Tipo Influenza (ETI) mediante el conteo de señales inespecíficas pero de alta sensibilidad.
          </p>
        </div>
      </div>
      <div class="flex-1 flex-col">
        <div class="px-10 mt-6">
          <h1 class="text-xl font-bold">Metodologia</h1>
          <p class="mt-3">
            Se visualizan los datos del registro de casos o signos y síntomas relacionados con diversas enfermedades de
            notificación obligatoria (ENOs) provenientes de dos fuentes principales:
          </p>
          <BaseDisclosure :content="data_sources" />
          <h1 class="mt-5 text-xl font-bold">Contexto y apoyo</h1>
          <p class="mt-3">
            Este tablero, elaborado en el marco del proyecto <a href="http://www.ciecti.org.ar/arphai/">ARPHAI</a>, se
            llevó a cabo con la ayuda de una subvención del Programa COVID-19 Sur Global de Inteligencia Artificial e
            Innovación de Datos, un programa financiado por el Centro Internacional de Investigaciones para el
            Desarrollo (IDRC) de Canadá y la Agencia Sueca de Cooperación para el Desarrollo Internacional (SIDA). Las
            informaciones y opiniones aquí expresadas no representan necesariamente las del IDRC o su Junta de
            Gobernadores.
          </p>
        </div>
      </div>
    </main>
  </div>
</template>
