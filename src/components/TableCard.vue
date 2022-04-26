<script setup lang="ts">
const props = defineProps<{ datos: object[]; titulo: string; titulosColumnas: string[]; titulosMostrados: string[] }>()
</script>

<template>
  <div class="p-3 bg-light_smooth-50 dark:bg-dark_smooth shadow rounded-lg text-light_contrast dark:text-dark_contrast">
    <h4 class="mt-3 mb-4 text-sm uppercase font-extrabold leading-tight">
      {{ titulo }}
    </h4>
    <div
      class="
        flex flex-col
        scrollbar-thin scrollbar-thumb-secondary
        scrollbar-track-light_base
        overflow-y-auto overflow-x-hidden
        dark:scrollbar-thumb-secondary dark:scrollbar-track-dark_base
      "
    >
      <div class="sm:-mx-6 lg:-mx-8">
        <div class="inline-block min-w-full lg:px-8">
          <div class="max-h-40">
            <table v-if="datos" class="w-full">
              <thead>
                <tr>
                  <th
                    v-for="(columna, index) in titulosColumnas"
                    :key="index"
                    class="font-semibold border-b-2 p-1 dark:border-secondary whitespace-nowrap"
                    scope="col"
                  >
                    {{ columna }}
                  </th>
                </tr>
              </thead>
              <tbody class="">
                <tr v-for="(obj, index) in datos" :key="index">
                  <td v-for="(value, key) in obj" :key="key" class="border-b-2 p-2 dark:border-secondary">
                    <div class="w-full">
                      {{ value }}
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
