<script setup lang="ts">
defineProps<{
  tableDimensions: string
  datos: object[]
  titulo: string
  titulosColumnas: string[]
  titulosMostrados: string[]
  colorTheme: string
}>()
</script>

<template>
  <div
    :class="`sm:p-2 xl:p-4 2xl:p-5 rounded-lg border-r-4 2xl:border-r-4 shadow-2xl bg-light_smooth dark:bg-dark_smooth dark:border-${colorTheme}_dark border-${colorTheme}`"
  >
    <div class="leading-tight text-left text-light_contrast dark:text-dark_contrast">
      <h5 class="pl-2 text-sm uppercase border-l-4 border-light_contrast dark:border-dark_contrast">
        {{ titulo }}
      </h5>
      <div
        class="
          overflow-y-auto overflow-x-hidden
          flex-col
          sm:mt-2
          lg:mt-4
          scrollbar-thin
          scrollbar-thumb-color_1
          dark:scrollbar-thumb-color_1_dark
          scrollbar-track-light_base
          dark:scrollbar-track-dark_base
        "
      >
        <div class="sm:-mx-6 lg:-mx-7">
          <div class="inline-block min-w-full lg:px-8">
            <div :class="`${tableDimensions}`">
              <table v-if="datos.length > 0" class="w-full">
                <thead>
                  <tr>
                    <th
                      v-for="(columna, index) in titulosColumnas"
                      :key="index"
                      :class="`p-1 dark:text-${colorTheme}_dark text-${colorTheme} whitespace-nowrap border-b-2 dark:border-dark_contrast`"
                      scope="col"
                    >
                      {{ columna }}
                    </th>
                  </tr>
                </thead>
                <tbody class="">
                  <tr v-for="(obj, index) in datos" :key="index">
                    <td v-for="(value, key) in obj" :key="key" class="p-2 border-b-2 dark:border-dark_contrast">
                      <div class="w-full">
                        {{ value }}
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
              <no-data-found v-else :chart-height="chartHeight" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
