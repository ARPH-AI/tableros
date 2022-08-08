<script setup>
import Popper from 'vue3-popper'
import { useRouter } from 'vue-router'
import { sections } from '@/constants'
import { QuestionMarkCircleIcon, TrendingUpIcon, MapIcon, UserGroupIcon } from '@heroicons/vue/outline'
import { getThemeByDataSource } from '@/composables'
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store.js'

const { dataSource } = storeToRefs(useDataSourceStore())
const isCurrentRoute = (routeName) => {
  return useRouter().currentRoute.value.name == routeName
}
</script>
<template>
  <nav class="grid grid-cols-1 items-center px-2 mt-32 font-mono">
    <router-link
      :aria-label="`Navegar hacia la sección ${sections.SITUACION_ACTUAL.key}`"
      class="flex justify-self-center p-2 m-2 rounded group bg-light_base-200 dark:bg-dark_base"
      :class="[
        isCurrentRoute('seccion-situacion-actual') || isCurrentRoute('index')
          ? `text-${getThemeByDataSource(dataSource)} hover:text-${getThemeByDataSource(
              dataSource
            )} border-3 border-${getThemeByDataSource(dataSource)}`
          : `border-3 border-${getThemeByDataSource(dataSource)} text-light_contrast hover:text-${getThemeByDataSource(
              dataSource
            )} dark:hover:text-${getThemeByDataSource(dataSource)}  dark:text-dark_contrast`,
      ]"
      to="seccion-situacion-actual"
      @click="state.criterio = 'situacion_actual'"
      ><Popper arrow disable-click-away hover interactive content="Situación actual"
        ><TrendingUpIcon class="flex-shrink-0 w-6 h-6 group" aria-hidden="true"></TrendingUpIcon>
      </Popper>
    </router-link>

    <router-link
      :aria-label="`Navegar hacia la sección ${sections.CARACTERIZACION.title}`"
      class="
        flex
        justify-self-center
        p-2
        m-2
        rounded
        border-2
        group
        bg-light_base-200
        dark:bg-dark_base
        text-light_contrast
        dark:text-dark_contrast
      "
      :class="[
        isCurrentRoute(`caracterizacion_${dataSource}`)
          ? `text-${getThemeByDataSource(dataSource)} hover:text-${getThemeByDataSource(
              dataSource
            )} border-3 border-${getThemeByDataSource(dataSource)}`
          : `border-3 border-${getThemeByDataSource(dataSource)} hover:text-${getThemeByDataSource(
              dataSource
            )} text-light_contrast dark:hover:text-${getThemeByDataSource(dataSource)}  dark:text-dark_contrast`,
      ]"
      :to="sections.CARACTERIZACION.key"
      @click="state.criterio = 'caracterizacion'"
      ><Popper arrow disable-click-away hover interactive :content="sections.CARACTERIZACION.title"
        ><UserGroupIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" /></Popper
    ></router-link>

    <router-link
      :aria-label="`Navegar hacia la sección ${sections.GEO.title}`"
      class="
        flex
        justify-self-center
        p-2
        m-2
        rounded
        group
        bg-light_base-200
        dark:bg-dark_base
        text-light_contrast
        dark:text-dark_contrast
      "
      :class="[
        isCurrentRoute(sections.GEO.key)
          ? `text-${getThemeByDataSource(dataSource)} hover:text-${getThemeByDataSource(
              dataSource
            )} border-3 border-${getThemeByDataSource(dataSource)}`
          : `border-3 border-${getThemeByDataSource(dataSource)} hover:text-${getThemeByDataSource(
              dataSource
            )} text-light_contrast dark:hover:text-${getThemeByDataSource(dataSource)}  dark:text-dark_contrast`,
      ]"
      :to="sections.GEO.key"
      @click="state.criterio = 'distribucion_espacial'"
      ><Popper arrow disable-click-away hover interactive content="Geo"
        ><MapIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" /></Popper
    ></router-link>
    <router-link
      :aria-label="`Navegar hacia la sección ${sections.INFORMACION.title}`"
      class="
        flex
        justify-self-center
        p-2
        m-2
        rounded
        group
        bg-light_base-200
        dark:bg-dark_base
        text-light_contrast
        dark:text-dark_contrast
      "
      :class="[
        isCurrentRoute(sections.INFORMACION.key)
          ? `text-${getThemeByDataSource(dataSource)} hover:text-${getThemeByDataSource(
              dataSource
            )} border-3 border-${getThemeByDataSource(dataSource)}`
          : `border-3 border-${getThemeByDataSource(dataSource)} hover:text-${getThemeByDataSource(
              dataSource
            )} text-light_contrast dark:hover:text-${getThemeByDataSource(dataSource)}  dark:text-dark_contrast`,
      ]"
      :to="sections.INFORMACION.key"
      ><Popper arrow disable-click-away hover interactive :content="sections.INFORMACION.title"
        ><QuestionMarkCircleIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" /></Popper
    ></router-link>
  </nav>
</template>
