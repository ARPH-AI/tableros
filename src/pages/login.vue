<route lang="yaml">
meta:
  public: true
</route>
<script setup lang="ts"></script>

<template>
  <div class="h-screen font-sans bg-cover login">
    <div class="container flex flex-1 justify-center items-center mx-auto h-full">
      <div class="w-full max-w-lg">
        <div class="leading-loose">
          <form class="p-10 m-4 max-w-sm bg-white bg-opacity-25 rounded shadow-xl">
            <p class="text-lg font-bold text-center text-white">LOGIN</p>
            <div class="">
              <label class="block text-sm text-white" for="email">E-mail</label>
              <input
                class="px-5 py-1 w-full text-gray-700 bg-gray-300 rounded focus:outline-none focus:bg-white"
                type="email"
                id="email"
                placeholder="Digite o e-mail"
                aria-label="email"
                required
              />
            </div>
            <div class="mt-2">
              <label class="block text-sm text-white">Senha</label>
              <input
                class="px-5 py-1 w-full text-gray-700 bg-gray-300 rounded focus:outline-none focus:bg-white"
                type="password"
                id="password"
                placeholder="Digite a sua senha"
                arial-label="password"
                required
              />
            </div>

            <div class="flex justify-between items-center mt-4">
              <button
                class="px-4 py-1 font-light tracking-wider text-white bg-gray-900 rounded hover:bg-gray-800"
                type="submit"
              >
                Entrar
              </button>
              <a
                class="inline-block right-0 text-sm font-bold text-white align-baseline text-500 hover:text-red-400"
                href="#"
                >Esqueceu a senha ?</a
              >
            </div>
            <div class="text-center">
              <a class="inline-block right-0 text-sm font-light align-baseline text-500 hover:text-red-400">
                Criar uma conta
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
<style>
.login {
  /*
    background: url('https://tailwindadmin.netlify.app/dist/images/login-new.jpeg');
  */
  background: url('http://bit.ly/2gPLxZ4');
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
