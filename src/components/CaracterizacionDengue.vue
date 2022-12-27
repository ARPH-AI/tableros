<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
const { dataSource } = storeToRefs(useDataSourceStore())
</script>

<template>
  <div>
    <!-- Layout para Fuende de datos: HSI -->
    <div v-if="dataSource == 'hsi'" class="grid px-4 pt-3 w-full md:px-10">
      <div class="grid grid-row-1 gap-3 w-full">
        <div class="grid grid-row-1 col-span-1 gap-3">
          <div class="grid grid-cols-4 gap-3">
            <CasosAcumuladosMujeres data-source="hsi" enfermedad="Dengue" />
            <CasosAcumuladosVarones data-source="hsi" enfermedad="Dengue" />
            <CasosNuevosPorcentaje
              data-source="hsi"
              title="Casos Nuevos Mayores 60"
              measure="EnfermedadEdadSexo.frecuenciaCasosMay"
              enfermedad="Dengue"
            />
            <CasosNuevosPorcentaje
              data-source="hsi"
              title="Casos Nuevos Menores 20"
              measure="EnfermedadEdadSexo.frecuenciaCasosMen"
              enfermedad="Dengue"
            />
          </div>
          <div class="grid gap-3 grid-rows-1">
            <div class="grid grid-cols-2 gap-3">
              <Suspense
                ><CasosEdadSemanaEpidemiologica
                  chart-height="sm:h-[38vh] xl:h-[47vh] 2xl:h-[54vh]"
                  data-source="hsi"
                  enfermedad="Dengue"
              /></Suspense>
              <Suspense>
                <CasosAcumuladosSexo
                  chart-height="sm:h-[38vh] xl:h-[47vh] 2xl:h-[54vh]"
                  data-source="hsi"
                  enfermedad="Dengue"
                />
              </Suspense>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Layout para Fuende de datos: SNVS -->
    <div v-if="dataSource == 'snvs'" class="grid px-4 pt-3 w-full md:px-10">
      <div class="grid grid-cols-1 gap-3 w-full lg:grid-cols-2">
        <!-- Left column -->
        <div class="grid grid-cols-1 col-span-1 gap-3">
          <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
            <CasosAcumuladosMujeres data-source="snvs" enfermedad="Dengue" />
            <CasosAcumuladosVarones data-source="snvs" enfermedad="Dengue" />
          </div>
          <Suspense><CasosEdadSemanaEpidemiologica data-source="snvs" enfermedad="Dengue" /></Suspense>
        </div>
        <!-- Right column -->
        <div class="grid gap-3 lg:grid-cols-1">
          <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
            <CasosNuevosPorcentaje
              data-source="snvs"
              title="Casos Nuevos Mayores 60"
              measure="DengueEdadSexoSNVS.frecuenciaCasosMaySNVS"
            />
            <CasosNuevosPorcentaje
              data-source="snvs"
              title="Casos Nuevos Menores 20"
              measure="DengueEdadSexoSNVS.frecuenciaCasosMenSNVS"
            />
          </div>
          <Suspense>
            <CasosAcumuladosSexo data-source="snvs" enfermedad="Dengue" />
          </Suspense>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
