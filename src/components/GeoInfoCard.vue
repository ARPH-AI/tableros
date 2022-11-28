<script setup lang="ts">
import { normalizeDecimals } from '@/utils'

const props = defineProps({
  cantidad: { type: String, default: '0' },
  tasa: { type: String, default: '0' },
  titulo: { type: String, default: 'Tablero ARPHAI' },
  colorTheme: { type: String, default: 'third' },
})

const normalize = (property: any, type='') => {
  const propertyNormalized = normalizeDecimals(property)
  return propertyNormalized == 'NaN' ? property : propertyNormalized
}
</script>

<template>
  <div
    :class="`divide-y divide-dashed sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 shadow-2xl bg-light_smooth dark:bg-dark_smooth dark:border-${props.colorTheme}_dark border-${props.colorTheme}`"
  >
    <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
      <h4 class="mt-2 text-base font-bold uppercase">
        {{ titulo }}
      </h4>
      <h4 class="text-xs uppercase">TASA x 100 mil hab.</h4>
      <h3 :class="`text-3xl font-semibold text-${props.colorTheme}`">
        {{ normalize(tasa, 'tasa') }}
      </h3>
      <h4 class="text-xs uppercase">CANT. CASOS ACTIVOS</h4>
      <h3 :class="`text-3xl font-semibold text-${props.colorTheme}`">
        {{ normalize(cantidad) }}
      </h3>
    </div>
  </div>
</template>

<style scoped></style>
