<script setup>
import { sections } from '@/constants'
import { getThemeByDataSource } from '@/composables'
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store.js'

const { dataSource } = storeToRefs(useDataSourceStore())
</script>
<template>
  <nav class="grid grid-cols-1 items-center px-2 mt-32 font-mono">
    <BaseMinimalSideBarButton
      v-for="(section, index) in sections"
      :key="index"
      :section="section"
      :color-theme="getThemeByDataSource(dataSource)"
    ></BaseMinimalSideBarButton>
    <!-- <router-link
      :aria-label="`Navegar hacia la sección ${sections.SITUACION_ACTUAL.key}`"
      class="flex justify-self-center p-2 m-2 group"
      :class="[
        isCurrentRoute(sections.SITUACION_ACTUAL.key) || isCurrentRoute('index')
          ? `dark:bg-${getThemeByDataSource(dataSource)}_dark bg-${getThemeByDataSource(
              dataSource
            )} rounded-xl text-dark_contrast hover:text-dark_contrast`
          : ` hover:text-${getThemeByDataSource(
              dataSources
            )} text-light_contrast dark:hover:text-${theme}  dark:text-dark_contrast`,
      ]"
      :to="sections.SITUACION_ACTUAL.key"
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
        rounded-lg
        border-2
        group
        bg-light_base-200
        dark:bg-dark_base
        text-light_contrast
        dark:text-dark_contrast
      "
      :class="[
        isCurrentRoute(sections.CARACTERIZACION.key)
          ? `text-${theme} dark:text-${getThemeByDataSource(
              dataSource
            )}_dark dark:hover:text-${theme}_dark hover:text-${getThemeByDataSource(
              dataSource
            )} border-3 dark:border-${theme}_dark border-${theme}`
          : `border-3 border-${theme} hover:text-${getThemeByDataSource(
              dataSource
            )} text-light_contrast dark:hover:text-${theme}  dark:text-dark_contrast`,
      ]"
      :to="sections.CARACTERIZACION.key"
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
        rounded-lg
        group
        bg-light_base-200
        dark:bg-dark_base
        text-light_contrast
        dark:text-dark_contrast
      "
      :class="[
        isCurrentRoute(sections.GEO.key)
          ? `text-${theme} hover:text-${getThemeByDataSource(dataSource)} border-3 border-${theme}`
          : `border-3 border-${theme} hover:text-${getThemeByDataSource(
              dataSource
            )} text-light_contrast dark:hover:text-${theme}  dark:text-dark_contrast`,
      ]"
      :to="sections.GEO.key"
      ><Popper arrow disable-click-away hover interactive content="Geo"
        ><MapIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" /></Popper
    ></router-link> -->
  </nav>
</template>
