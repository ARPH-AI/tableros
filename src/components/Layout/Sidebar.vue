<template>
  <nav
    class="
      flex
      relative
      z-10
      flex-wrap
      justify-between
      items-center
      px-6
      py-4
      bg-white
      shadow-xl
      md:left-0
      md:block
      md:fixed
      md:top-0
      md:bottom-0
      md:overflow-y-auto
      md:flex-row
      md:flex-nowrap
      md:overflow-hidden
      md:w-64
    "
  >
    <div
      class="
        flex flex-wrap
        justify-between
        items-center
        px-0
        mx-auto
        w-full
        md:flex-col md:items-stretch md:min-h-full md:flex-nowrap
      "
    >
      <!-- Toggler -->
      <button
        class="
          px-3
          py-1
          text-xl
          leading-none
          text-black
          bg-transparent
          rounded
          border border-transparent border-solid
          opacity-50
          cursor-pointer
          md:hidden
        "
        type="button"
        @click="toggleCollapseShow('bg-white m-2 py-3 px-6')"
      >
        <i class="fas fa-bars"></i>
      </button>
      <!-- Brand -->
      <router-link
        class="
          inline-block
          p-4
          px-0
          mr-0
          text-sm
          font-bold
          text-left
          uppercase
          whitespace-nowrap
          md:block md:pb-2
          text-blueGray-600
        "
        to="/"
      >
        Vue Notus
      </router-link>
      <!-- User -->
      <ul class="flex flex-wrap items-center list-none md:hidden">
        <li class="inline-block relative">
          <notification-dropdown />
        </li>
        <li class="inline-block relative">
          <user-dropdown />
        </li>
      </ul>
      <!-- Collapse -->
      <div
        class="
          overflow-y-auto overflow-x-hidden
          absolute
          top-0
          right-0
          left-0
          z-40
          flex-1
          items-center
          h-auto
          rounded
          shadow
          md:flex md:flex-col md:items-stretch md:opacity-100 md:relative md:mt-4 md:shadow-none
        "
        :class="collapseShow"
      >
        <!-- Collapse header -->
        <div class="block pb-4 mb-4 border-b border-solid md:min-w-full md:hidden border-blueGray-200">
          <div class="flex flex-wrap">
            <div class="w-6/12">
              <router-link
                class="
                  inline-block
                  p-4
                  px-0
                  mr-0
                  text-sm
                  font-bold
                  text-left
                  uppercase
                  whitespace-nowrap
                  md:block md:pb-2
                  text-blueGray-600
                "
                to="/"
              >
                Vue Notus
              </router-link>
            </div>
            <div class="flex justify-end w-6/12">
              <button
                type="button"
                class="
                  px-3
                  py-1
                  text-xl
                  leading-none
                  text-black
                  bg-transparent
                  rounded
                  border border-transparent border-solid
                  opacity-50
                  cursor-pointer
                  md:hidden
                "
                @click="toggleCollapseShow('hidden')"
              >
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>
        </div>
        <!-- Form -->
        <form class="mt-6 mb-4 md:hidden">
          <div class="pt-0 mb-3">
            <input
              type="text"
              placeholder="Search"
              class="
                px-3
                py-2
                w-full
                h-12
                text-base
                font-normal
                leading-snug
                bg-white
                rounded
                border-0 border border-solid
                shadow-none
                outline-none
                border-blueGray-500
                placeholder-blueGray-300
                text-blueGray-600
                focus:outline-none
              "
            />
          </div>
        </form>

        <!-- Divider -->
        <hr class="my-4 md:min-w-full" />
        <!-- Heading -->
        <h6 class="block pt-1 pb-4 text-xs font-bold no-underline uppercase md:min-w-full text-blueGray-500">
          Admin Layout Pages
        </h6>
        <!-- Navigation -->

        <ul class="flex flex-col list-none md:flex-col md:min-w-full">
          <li class="items-center">
            <router-link v-slot="{ href, navigate, isActive }" to="/admin/dashboard">
              <a
                :href="href"
                class="block py-3 text-xs font-bold uppercase"
                :class="[
                  isActive ? 'text-emerald-500 hover:text-emerald-600' : 'text-blueGray-700 hover:text-blueGray-500',
                ]"
                @click="navigate"
              >
                <i class="mr-2 text-sm fas fa-tv" :class="[isActive ? 'opacity-75' : 'text-blueGray-300']"></i>
                Dashboard
              </a>
            </router-link>
          </li>

          <li class="items-center">
            <router-link v-slot="{ href, navigate, isActive }" to="/admin/settings">
              <a
                :href="href"
                class="block py-3 text-xs font-bold uppercase"
                :class="[
                  isActive ? 'text-emerald-500 hover:text-emerald-600' : 'text-blueGray-700 hover:text-blueGray-500',
                ]"
                @click="navigate"
              >
                <i class="mr-2 text-sm fas fa-tools" :class="[isActive ? 'opacity-75' : 'text-blueGray-300']"></i>
                Settings
              </a>
            </router-link>
          </li>

          <li class="items-center">
            <router-link v-slot="{ href, navigate, isActive }" to="/admin/tables">
              <a
                :href="href"
                class="block py-3 text-xs font-bold uppercase"
                :class="[
                  isActive ? 'text-emerald-500 hover:text-emerald-600' : 'text-blueGray-700 hover:text-blueGray-500',
                ]"
                @click="navigate"
              >
                <i class="mr-2 text-sm fas fa-table" :class="[isActive ? 'opacity-75' : 'text-blueGray-300']"></i>
                Tables
              </a>
            </router-link>
          </li>

          <li class="items-center">
            <router-link v-slot="{ href, navigate, isActive }" to="/admin/maps">
              <a
                :href="href"
                class="block py-3 text-xs font-bold uppercase"
                :class="[
                  isActive ? 'text-emerald-500 hover:text-emerald-600' : 'text-blueGray-700 hover:text-blueGray-500',
                ]"
                @click="navigate"
              >
                <i class="mr-2 text-sm fas fa-map-marked" :class="[isActive ? 'opacity-75' : 'text-blueGray-300']"></i>
                Maps
              </a>
            </router-link>
          </li>
        </ul>

        <!-- Divider -->
        <hr class="my-4 md:min-w-full" />
        <!-- Heading -->
        <h6 class="block pt-1 pb-4 text-xs font-bold no-underline uppercase md:min-w-full text-blueGray-500">
          Auth Layout Pages
        </h6>
        <!-- Navigation -->

        <ul class="flex flex-col list-none md:flex-col md:min-w-full md:mb-4">
          <li class="items-center">
            <router-link
              class="block py-3 text-xs font-bold uppercase text-blueGray-700 hover:text-blueGray-500"
              to="/auth/login"
            >
              <i class="mr-2 text-sm fas fa-fingerprint text-blueGray-300"></i>
              Login
            </router-link>
          </li>

          <li class="items-center">
            <router-link
              class="block py-3 text-xs font-bold uppercase text-blueGray-700 hover:text-blueGray-500"
              to="/auth/register"
            >
              <i class="mr-2 text-sm fas fa-clipboard-list text-blueGray-300"></i>
              Register
            </router-link>
          </li>
        </ul>

        <!-- Divider -->
        <hr class="my-4 md:min-w-full" />
        <!-- Heading -->
        <h6 class="block pt-1 pb-4 text-xs font-bold no-underline uppercase md:min-w-full text-blueGray-500">
          No Layout Pages
        </h6>
        <!-- Navigation -->

        <ul class="flex flex-col list-none md:flex-col md:min-w-full md:mb-4">
          <li class="items-center">
            <router-link
              class="block py-3 text-xs font-bold uppercase text-blueGray-700 hover:text-blueGray-500"
              to="/landing"
            >
              <i class="mr-2 text-sm fas fa-newspaper text-blueGray-300"></i>
              Landing Page
            </router-link>
          </li>

          <li class="items-center">
            <router-link
              class="block py-3 text-xs font-bold uppercase text-blueGray-700 hover:text-blueGray-500"
              to="/profile"
            >
              <i class="mr-2 text-sm fas fa-user-circle text-blueGray-300"></i>
              Profile Page
            </router-link>
          </li>
        </ul>

        <!-- Divider -->
        <hr class="my-4 md:min-w-full" />
        <!-- Heading -->
        <h6 class="block pt-1 pb-4 text-xs font-bold no-underline uppercase md:min-w-full text-blueGray-500">
          Documentation
        </h6>
        <!-- Navigation -->
        <ul class="flex flex-col list-none md:flex-col md:min-w-full md:mb-4">
          <li class="inline-flex">
            <a
              href="https://www.creative-tim.com/learning-lab/tailwind/vue/colors/notus"
              target="_blank"
              class="block mb-4 text-sm font-semibold no-underline text-blueGray-700 hover:text-blueGray-500"
            >
              <i class="mr-2 text-base fas fa-paint-brush text-blueGray-300"></i>
              Styles
            </a>
          </li>

          <li class="inline-flex">
            <a
              href="https://www.creative-tim.com/learning-lab/tailwind/vue/alerts/notus"
              target="_blank"
              class="block mb-4 text-sm font-semibold no-underline text-blueGray-700 hover:text-blueGray-500"
            >
              <i class="mr-2 text-base fab fa-css3-alt text-blueGray-300"></i>
              CSS Components
            </a>
          </li>

          <li class="inline-flex">
            <a
              href="https://www.creative-tim.com/learning-lab/tailwind/angular/overview/notus"
              target="_blank"
              class="block mb-4 text-sm font-semibold no-underline text-blueGray-700 hover:text-blueGray-500"
            >
              <i class="mr-2 text-base fab fa-angular text-blueGray-300"></i>
              Angular
            </a>
          </li>

          <li class="inline-flex">
            <a
              href="https://www.creative-tim.com/learning-lab/tailwind/js/overview/notus"
              target="_blank"
              class="block mb-4 text-sm font-semibold no-underline text-blueGray-700 hover:text-blueGray-500"
            >
              <i class="mr-2 text-base fab fa-js-square text-blueGray-300"></i>
              Javascript
            </a>
          </li>

          <li class="inline-flex">
            <a
              href="https://www.creative-tim.com/learning-lab/tailwind/nextjs/overview/notus"
              target="_blank"
              class="block mb-4 text-sm font-semibold no-underline text-blueGray-700 hover:text-blueGray-500"
            >
              <i class="mr-2 text-base fab fa-react text-blueGray-300"></i>
              NextJS
            </a>
          </li>

          <li class="inline-flex">
            <a
              href="https://www.creative-tim.com/learning-lab/tailwind/react/overview/notus"
              target="_blank"
              class="block mb-4 text-sm font-semibold no-underline text-blueGray-700 hover:text-blueGray-500"
            >
              <i class="mr-2 text-base fab fa-react text-blueGray-300"></i>
              React
            </a>
          </li>

          <li class="inline-flex">
            <a
              href="https://www.creative-tim.com/learning-lab/tailwind/svelte/overview/notus"
              target="_blank"
              class="block mb-4 text-sm font-semibold no-underline text-blueGray-700 hover:text-blueGray-500"
            >
              <i class="mr-2 text-base fas fa-link text-blueGray-300"></i>
              Svelte
            </a>
          </li>

          <li class="inline-flex">
            <a
              href="https://www.creative-tim.com/learning-lab/tailwind/vue/overview/notus"
              target="_blank"
              class="block mb-4 text-sm font-semibold no-underline text-blueGray-700 hover:text-blueGray-500"
            >
              <i class="mr-2 text-base fab fa-vuejs text-blueGray-300"></i>
              VueJS
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>
); }

<script>
export default {
  components: {},
  data() {
    return {
      collapseShow: 'hidden',
    }
  },
  methods: {
    toggleCollapseShow: function (classes) {
      this.collapseShow = classes
    },
  },
}
</script>
