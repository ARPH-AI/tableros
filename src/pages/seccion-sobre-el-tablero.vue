<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
const structureDisclosureContent = [
  {
    title: 'Situacion actual',
    content:
      'En la  primera sección se incluyen indicadores que brindan en una mirada sucinta y general la situación actual de la notificación del caso (tanto por HSI para los efectores que nuclea, cómo por SNVS).',
    order: 1,
  },
  {
    title: 'Caracterización',
    content:
      'Se utilizaron los datos estructurados de la HSI: fecha de nacimiento, fecha de la consulta y sexo y se elaboraron indicadores significativos que sintetizan la progresión de ENOs por grupos de edad y sexo. Encuanto a la sección de comorbilidades se busca hacer foco en el análisis de un grupo poblacional relevante para Covid 19 y que desde la HSI se puede identificar en forma temprana',
    order: 2,
  },
  {
    title: 'Mapas',
    content:
      'Se elaboraron mapas considerando la residencia de las personas (tomando el dato de dirección de la HSI) para identificación de clusters de casos activos registrados en la HSI. Para los datos de SNVS al no contar con el posicionamiento de la persona se definió utilizar la localidad mínima qué contiene el set de datos.',
    order: 3,
  },
]

const dataSourcesDisclosureContent = [
  {
    title: 'Historia de Salud Integrada (HSI)',
    content:
      'Desde la HSI se relevan datos de posibles eventos registrados en campos estructurados codificados con SNOMED CT, ya sean síntomas (para el caso de la vigilancia sindrómica) cómo diagnósticos que registra el personal de salud en la HSI.',
    order: 1,
  },
  {
    title: 'Sistema Nacional de Vigilancia en salud (SNVS)',
    content:
      'En la solapa identificada cómo SNVS se visualizan los casos notificados al sistema. Actualmente no se cuenta con vínculo de transmisión de información entre ambos sistemas.',
    order: 2,
  },
]
</script>

<template>
  <div class="flex h-screen text-left flex-row">
    <div class="flex-1 flex-col">
      <div class="pt-10 px-10">
        <h1 class="text-3xl font-bold transition ease-out duration-800">Tablero epidemiológico</h1>
        <p class="transition ease-out duration-800 mt-3">
          El tablero tiene cómo objetivo principal, contribuir a identificar en forma temprana eventos de relevancia en
          vigilancia epidemiológica, para el desarrollo de acciones de identificación de brote y/o prevención en forma
          oportuna.
        </p>
      </div>
      <div class="p-10">
        <h1 class="text-xl font-bold">Estructura general</h1>
        <p class="mt-4 font-semibold">Eventos de Notificacion Obligatoria</p>
        <p class="mt-3">
          El tablero presenta informacion sobre las ENOs Covid-19 y Dengue. De cada una se despliegan 3 secciones que
          denotan distintas dimensiones posibles de su analisis.
        </p>
        <BaseDisclosure :content="structureDisclosureContent"></BaseDisclosure>
        <p class="mt-4 font-semibold">Consultas febriles</p>
        <p class="mt-3">
          Aqui se visualizan las consultas totales, las consultas febriles y dentro de estas las febriles con y sin
          sintomatología respiratoria. Esta sección busca realizar un aporte a la vigilancia sindrómica de las
          Enfermedades de Tipo Influenza (ETI) mediante el conteo de señales inespecíficas pero de alta sensibilidad.
        </p>
      </div>
    </div>
    <div class="flex-1 flex-col">
      <div class="px-10 mt-4">
        <h1 class="text-xl font-bold">Metodologia</h1>
        <p class="mt-3">
          Se visualizan los datos del registro de casos o signos y síntomas relacionados con diversas enfermedades de
          notificación obligatoria (ENOs) provenientes de dos fuentes principales:
        </p>
        <BaseDisclosure :content="dataSourcesDisclosureContent"></BaseDisclosure>
      </div>
    </div>
  </div>
</template>
