<script setup lang="ts">
import RouterViewTransition from '@/components/RouterViewTransition.vue'
</script>

<template>
  <div class="container-fluid">
    <div class="row content">
      <div class="col-sm-3 sidenav hidden-xs">
        <img src="http://hsi.pladema.net/wp-content/uploads/2021/01/logo-HSI-iso-512x512-01.png" width="250" />
        <ul class="nav nav-pills nav-stacked">
          <li class="nav-item"><a class="nav-link active" href="#section1">General</a></li>
          <li class="nav-item"><a class="nav-link" href="#section2">Localización</a></li>
          <li class="nav-item"><a class="nav-link" href="#section3">Sexo y Edad</a></li>
          <li class="nav-item"><a class="nav-link" href="#section3">Comorbilidades</a></li>
        </ul>
      </div>
      <br />

      <RouterViewTransition></RouterViewTransition>
    </div>
  </div>
</template>

<style>
/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
  height: 550px;
}

/* Set gray background color and 100% height */
.sidenav {
  background-color: #f1f1f1;
  height: 100%;
}

/* On small screens, set height to 'auto' for the grid */
@media screen and (max-width: 767px) {
  .row.content {
    height: auto;
  }
}
</style>
