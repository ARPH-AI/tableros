<template>
  <div
    :class="`flex rounded-lg border-r-4 shadow-2xl bg-light_smooth dark:bg-dark_smooth dark:border-${props.colorTheme}_dark border-${props.colorTheme}`"
  >
    <div class="py-2 inline-block sm:px-6 lg:px-4">
      <table class="min-w-full text-left">
        <thead class="border-b">
          <!-- <tr>
            <th scope="col" class="text-left text-sm font-medium text-light_contrast dark:text-dark_contrast p-2">
              Tasa
            </th>
            <th scope="col" class="text-sm font-medium text-light_contrast dark:text-dark_contrast p-2">
              x 100 mil hab.
            </th>
          </tr> -->
        </thead>

        <tbody class="">
          <tr v-for="(obj, index) in props.references" :key="index">
            <td class="p-1 dark:border-dark_contrast">
              <div class="w-full">
                <div :class="`animate-pulse mb-2 w-4 h-4 text-base bg-coroplethic_${obj.id} rounded-full`" />
              </div>
            </td>
            <td class="p-1 text-xs dark:border-dark_contrast">
              <div class="w-full">
                {{ obj.reference }}
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const props = defineProps({
  references: {
    type: Array,
    required: true,
  },
  colorTheme: {
    type: String,
    required: true,
  },
})
</script>
