<script setup>
const props = defineProps({
  cantidad: { type: String, default: '0' },
  titulo: { type: String, default: 'Number card' },
  colorTheme: { type: String, default: 'third' },
  percent: { type: Boolean, default: false },
  miles: { type: Boolean, default: false },
  styles: { type: String, default: 'bg-light_smooth dark:bg-dark_smooth' },
  data: { type: Boolean, default: true },
})
const LOCALE = import.meta.env.LOCALE
</script>

<template>
  <div
    :class="`${styles} sm:p-2 xl:p-4 2xl:p-5 rounded-2xl border-r-4 shadow-2xl  dark:border-${props.colorTheme}_dark border-${props.colorTheme}`"
  >
    <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
      <h2 :class="`text-3xl font-semibold dark:text-${props.colorTheme}_dark text-${props.colorTheme}`">
        <div v-if="data && percent">
          {{
            Number(cantidad / 100).toLocaleString(LOCALE, {
              style: 'percent',
              minimumFractionDigits: 0,
              maximumFactionDigits: 2,
            })
          }}
        </div>
        <div v-else-if="data && miles">{{ Number(cantidad).toLocaleString(LOCALE) }}</div>
        <div v-else-if="data">{{ Number(cantidad).toLocaleString(LOCALE) }}</div>
        <div v-else class="text-base font-thin text-gray-200 text-left dark:text-gray-300 italic">Sin datos</div>
      </h2>
      <h3 class="text-sm uppercase">
        {{ titulo }}
      </h3>
    </div>
  </div>
</template>

<style scoped></style>
