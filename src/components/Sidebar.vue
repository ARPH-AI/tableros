<script setup>
import { useRouter } from 'vue-router'
import { TemplateIcon } from '@heroicons/vue/outline'
import SidebarCollapsible from '@/components/SidebarCollapsible.vue'
import SidebarCollapsibleItem from '@/components/SidebarCollapsibleItem.vue'
import { sections } from '@/constants'

const isCurrentRoute = (routeName) => {
  return useRouter().currentRoute.value.name == routeName
}

const isCurrentPath = (path) => {
  return useRouter().currentRoute.value.path.startsWith(path)
}
</script>
<template>
  <nav class="flex px-2 mt-5 font-mono">
    <!-- With sidebar open -->
    <SidebarCollapsible
      title="TABLERO"
      :active="isCurrentPath(`/${sections.SITUACION_ACTUAL.key}`) || isCurrentPath('/')"
    >
      <template #icon>
        <TemplateIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" />
      </template>
      <SidebarCollapsibleItem
        :to="sections.SITUACION_ACTUAL.key"
        :title="sections.SITUACION_ACTUAL.title"
        :active="isCurrentRoute(sections.SITUACION_ACTUAL.key) || isCurrentRoute('index')"
        @click="state.criterio = 'situacion_actual'"
      />
      <SidebarCollapsibleItem
        :to="sections.CARACTERIZACION.key"
        :title="sections.CARACTERIZACION.title"
        :active="isCurrentRoute(sections.CARACTERIZACION.key)"
        @click="state.criterio = 'caracterizacion'"
      />
      <SidebarCollapsibleItem
        :to="sections.GEO.key"
        :title="sections.CARACTERIZACION.title"
        :active="isCurrentRoute(sections.GEO.key)"
        @click="state.criterio = 'distribucion_espacial'"
      />
    </SidebarCollapsible>
  </nav>
</template>
