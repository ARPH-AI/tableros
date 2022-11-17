<script setup lang="ts">
import { general_sections, data_sources, enos } from '@/constants'
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
import { isCurrentRoute } from '@/composables'
import { ref, shallowRef } from 'vue'

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
  <div class="">
    <suspense timeout="0"><component :is="componente"></component></suspense>
  </div>
</template>

<style></style>
