<script lang="ts">
import { useAuth } from '@/auth'

export default {
  props: {
    username: { type: String, default: '' },
    password: { type: String, default: '' },
  },
  setup() {
    const auth = useAuth()
    const userForm = {
      username: '',
      password: '',
    }

    const handleInput = (field: string, value: string) => {
      switch (field) {
        case 'username':
          userForm.username = value
          break
        case 'password':
          userForm.password = value
          break
        default:
          break
      }
    }

    const handleLogin = async (event: Event) => {
      event.preventDefault()
      const { username, password } = userForm
      await auth.login({ username, password })
    }

    return {
      handleInput,
      handleLogin,
    }
  },
}
</script>

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
                id="email"
                class="
                  px-3
                  py-1
                  w-full
                  text-left
                  bg-white
                  rounded
                  focus:secondary focus:ring-secondary focus:ring focus:ring-opacity-80 focus:outline-none
                "
                type="email"
                placeholder="Correo electrónico"
                aria-label="email"
                required
                @input="handleInput('username', $event.target.value)"
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
                autocomplete="on"
                @input="handleInput('password', $event.target.value)"
              />
            </div>

            <div class="flex mt-4">
              <button
                class="font-semibold tracking-wider text-white rounded hoverfont-light hover:text-secondary"
                type="submit"
                @click="handleLogin"
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
