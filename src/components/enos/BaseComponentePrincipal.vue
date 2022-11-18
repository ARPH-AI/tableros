<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
import { shallowRef } from 'vue'
import { useEnosStore } from '@/stores/enos-store'
const { current_eno } = storeToRefs(useEnosStore())

const { dataSource } = storeToRefs(useDataSourceStore())

const props = defineProps({
  eno: {
    type: Object,
    required: true,
  },
})
const componente = shallowRef(props.eno.eno.mainComponent)
</script>
<template>
  <div>
    <div class="hover:opacity-50">
      <router-link :to="props.eno.eno.main_page"
        ><h3 class="mb-3 p-3 bg-light_smooth dark:bg-dark_smooth rounded-lg font-medium">{{ props.eno.eno.title }}</h3>
        <Suspense><component :is="componente" :data-source="dataSource"></component></Suspense>
      </router-link>
    </div>
  </div>
</template>

<style></style>
