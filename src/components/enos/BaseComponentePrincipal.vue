<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
import { useEnosStore } from '@/stores/enos-store'
import { useSectionsStore } from '@/stores/sections-store'
const { dataSource } = storeToRefs(useDataSourceStore())
const enosStore = useEnosStore()
const sectionsStore = useSectionsStore()

const props = defineProps({
  eno: {
    type: Object,
    required: true,
  },
})
const module = await import(props.eno.eno.mainComponent)
const componente = module.default

const onClickHandler = () => {
  enosStore.setCurrentEnoString(props.eno.eno.key)
  enosStore.setCurrentEnoData(props.eno.eno)
  sectionsStore.setSectionTitle(props.eno.eno.title)
}
</script>
<template>
  <div>
    <div>
      <router-link :to="props.eno.eno.main_page" @click="onClickHandler"
        ><h3 class="mb-3 p-3 bg-light_smooth dark:bg-dark_smooth rounded-lg font-medium hover:opacity-50">
          {{ props.eno.eno.title }}
        </h3>
      </router-link>
      <Suspense><component :is="componente" :data-source="dataSource"></component></Suspense>
    </div>
  </div>
</template>

<style></style>
