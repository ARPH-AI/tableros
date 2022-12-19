<route lang="yaml">
meta:
  public: true
</route>

<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useDataSourceStore } from '@/stores/data-source-store'
const { dataSource } = storeToRefs(useDataSourceStore())
import { getThemeByDataSource } from '@/composables'
</script>

<template>
  <div>
    <div v-if="dataSource == 'hsi'" class="grid px-4 py-3 w-full md:px-10">
      <div class="grid grid-cols-1 gap-3 w-full lg:grid-cols-2">
        <!-- Left column -->
        <div class="grid grid-cols-1 col-span-1 gap-3">
          <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
            <CasosAcumuladosMujeres data-source="hsi" />
            <CasosAcumuladosVarones data-source="hsi" />
          </div>
          <Suspense><CasosEdadSemanaEpidemiologica data-source="hsi" /></Suspense>
          <Suspense><ComorbilidadesCantidad data-source="hsi" /></Suspense>
        </div>
        <!-- Right column -->
        <div class="grid gap-3 lg:grid-cols-1">
          <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
            <CasosNuevosPorcentaje
              data-source="hsi"
              title="Casos Nuevos Mayores 60"
              measure="EnfermedadEdadSexo.frecuenciaCasosMay"
            />
            <CasosNuevosPorcentaje
              data-source="hsi"
              title="Casos Nuevos Menores 20"
              measure="EnfermedadEdadSexo.frecuenciaCasosMen"
            />
          </div>
          <Suspense
            ><CasosAcumuladosSexo data-source="hsi" /><template #fallback>
              <BaseGraphSkeleton
                styles="sm:h-[38vh] xl:h-[50vh] 2xl:h-[60vh]"
                :color-theme="getThemeByDataSource(dataSource)"
              ></BaseGraphSkeleton>
            </template>
          </Suspense>
          <Suspense><ComorbilidadesFrecuencia data-source="hsi" /></Suspense>
        </div>
      </div>
    </div>
    <div v-if="dataSource == 'snvs'" class="grid px-4 pt-3 w-full md:px-10">
      <div class="grid grid-cols-1 gap-3 w-full lg:grid-cols-2">
        <!-- Left column -->
        <div class="grid grid-cols-1 col-span-1 gap-3">
          <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
            <CasosAcumuladosMujeres data-source="snvs" />
            <CasosAcumuladosVarones data-source="snvs" />
          </div>
          <Suspense><CasosEdadSemanaEpidemiologica data-source="snvs" /></Suspense>
        </div>
        <!-- Right column -->
        <div class="grid gap-3 lg:grid-cols-1">
          <div class="grid grid-cols-1 gap-3 md:grid-cols-2">
            <CasosNuevosPorcentaje
              data-source="snvs"
              title="Casos Nuevos Mayores 60"
              measure="CovidEdadSexoSNVS.frecuenciaCasosMaySNVS"
            />
            <CasosNuevosPorcentaje
              data-source="snvs"
              title="Casos Nuevos Menores 20"
              measure="CovidEdadSexoSNVS.frecuenciaCasosMenSNVS"
            />
          </div>
          <Suspense><CasosAcumuladosSexo data-source="snvs" /></Suspense>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
