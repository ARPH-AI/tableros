<script setup lang="ts">
const props = defineProps<{
  datos: object[]
  titulo: string
  titulosColumnas: string[]
  titulosMostrados: string[]
  colorTheme: { type: String }
}>()
</script>

<template>
  <div
    :class="`border-r-4
      border-${props.colorTheme}
      p-3
      rounded-lg
      shadow
      bg-light_smooth-50
      dark:bg-dark_smooth
      text-light_contrast
      dark:text-dark_contrast`"
  >
    <h4 class="mt-3 mb-4 text-sm font-extrabold leading-tight uppercase">
      {{ titulo }}
    </h4>
    <div
      class="flex overflow-y-auto overflow-x-hidden flex-col  scrollbar-thin scrollbar-thumb-secondary scrollbar-track-light_base dark:scrollbar-thumb-secondary dark:scrollbar-track-dark_base"
    >
      <div class="sm:-mx-6 lg:-mx-8">
        <div class="inline-block min-w-full lg:px-8">
          <div class="max-h-40">
            <table v-if="datos" class="w-full">
              <thead>
                <tr>
                  <th
                    class="p-1 font-semibold whitespace-nowrap border-b-2 dark:border-dark_contrast"
                    v-for="(columna, index) in titulosColumnas"
                    :key="index"
                    scope="col"
                  >
                    {{ columna }}
                  </th>
                </tr>
              </thead>
              <tbody class="">
                <tr v-for="(obj, index) in datos" :key="index">
                  <td class="p-2 border-b-2 dark:border-dark_contrast" v-for="(value, key) in obj" :key="key">
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
