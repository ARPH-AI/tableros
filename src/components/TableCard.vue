<script setup lang="ts">
const props = defineProps<{ datos: object[]; titulo: string; titulosColumnas: string[]; titulosMostrados: string[] }>()
</script>

<template>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title p-3 border bg-light">{{ titulo }}</h5>
      <table v-if="datos" class="table table-striped table-sm">
        <thead>
          <tr>
            <th v-for="(columna, index) in titulosColumnas" :key="index" scope="col">{{ columna }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(obj, index) in datos" :key="index">
            <td v-for="(value, key) in obj" :key="key">{{ value }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<style scoped></style>
