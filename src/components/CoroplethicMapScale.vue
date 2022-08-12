<template>
  <div
    :class="`flex rounded-lg border-r-4 shadow-2xl bg-light_smooth-50 dark:bg-dark_smooth border-${props.colorTheme}`"
  >
    <div class="py-2 inline-block sm:px-6 lg:px-4">
      <table class="min-w-full text-left">
        <thead class="border-b">
          <tr>
            <th scope="col" class="text-left text-sm font-medium text-gray-900 p-2">Color</th>
            <th scope="col" class="text-sm font-medium text-gray-900 p-2">Referencia</th>
          </tr>
        </thead>

        <tbody class="bg-white">
          <!-- <tr v-for="(obj, index) in props.references" :key="index">
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">
                <div :class="`animate-pulse mb-2 w-4 h-4 text-base bg-coroplethic_${obj.id} rounded-full`" />
              </div>
            </td>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">
                {{ obj.reference }}
              </div>
            </td>
          </tr> -->
          <tr>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">
                <div class="animate-pulse mb-2 w-4 h-4 text-base bg-coroplethic_0 rounded-full" />
              </div>
            </td>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">10</div>
            </td>
          </tr>
          <tr>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">
                <div class="animate-pulse mb-2 w-4 h-4 text-base bg-coroplethic_1 rounded-full" />
              </div>
            </td>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">50</div>
            </td>
          </tr>
          <tr>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">
                <div class="animate-pulse mb-2 w-4 h-4 text-base bg-coroplethic_2 rounded-full" />
              </div>
            </td>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">100</div>
            </td>
          </tr>
          <tr>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">
                <div class="animate-pulse mb-2 w-4 h-4 text-base bg-coroplethic_3 rounded-full" />
              </div>
            </td>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">200</div>
            </td>
          </tr>
          <tr>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">
                <div class="animate-pulse mb-2 w-4 h-4 text-base bg-coroplethic_4 rounded-full" />
              </div>
            </td>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">400</div>
            </td>
          </tr>
          <tr>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">
                <div class="animate-pulse mb-2 w-4 h-4 text-base bg-coroplethic_5 rounded-full" />
              </div>
            </td>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">800</div>
            </td>
          </tr>
          <tr>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">
                <div class="animate-pulse mb-2 w-4 h-4 text-base bg-coroplethic_6 rounded-full" />
              </div>
            </td>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">1600</div>
            </td>
          </tr>
          <tr>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">
                <div class="animate-pulse mb-2 w-4 h-4 text-base bg-coroplethic_7 rounded-full" />
              </div>
            </td>
            <td class="p-1 border-b-2 dark:border-dark_contrast">
              <div class="w-full">mayor a 1600</div>
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
