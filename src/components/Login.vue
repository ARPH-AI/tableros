<script setup lang="ts"></script>

<template>
  <div class="h-screen font-mono bg-cover bg-gradient-to-r from-primary via-third to-secondary">
    <div class="container flex flex-1 justify-center items-center mx-auto h-full">
      <div class="w-full max-w-lg">
        <div class="leading-loose">
          <form class="p-10 m-4 max-w-sm bg-white bg-opacity-25 rounded shadow-xl">
            <div class="flex justify-center m-3">
              <img alt="ARPHAI logo" src="@/assets/logo-BN.png" class="w-56" />
            </div>
            <p class="mb-4 text-2xl font-bold text-center text-white">Iniciar sesión</p>
            <div class="">
              <label class="block text-base text-left text-white" for="email">Correo electrónico</label>
              <input
                class="px-3 py-1 w-full text-left bg-white rounded  focus:secondary focus:ring-secondary focus:ring focus:ring-opacity-80 focus:outline-none"
                type="email"
                id="email"
                placeholder="Correo electrónico"
                aria-label="email"
                required
              />
            </div>
            <div class="mt-4">
              <label class="block text-base text-left text-white">Contraseña</label>
              <input
                class="px-3 py-1 w-full text-left bg-white rounded  focus:secondary focus:ring-secondary focus:ring focus:ring-opacity-80 focus:outline-none"
                type="password"
                id="password"
                placeholder="Contraseña"
                arial-label="password"
                required
              />
            </div>

            <div class="flex mt-4">
              <button
                @click="$auth.login"
                class="font-semibold tracking-wider text-white rounded hoverfont-light hover:text-secondary"
                type="submit"
              >
                Entrar
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
