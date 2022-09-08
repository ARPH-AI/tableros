<template>
  <div class="fixed top-16 w-72">
    <Listbox v-model="selectedItem" @change="props.onChange">
      <div class="relative mt-1">
        <ListboxButton
          class="
            relative
            py-2
            pr-10
            pl-3
            w-full
            text-left
            bg-white
            rounded-lg
            shadow-md
            cursor-default
            focus:outline-none
            focus-visible:border-indigo-500
            focus-visible:ring-2
            focus-visible:ring-white
            focus-visible:ring-opacity-75
            focus-visible:ring-offset-2
            focus-visible:ring-offset-orange-300
            sm:text-sm
          "
        >
          <span class="block truncate">{{ selectedItem.iso_nombre }}</span>
          <span class="flex absolute inset-y-0 right-0 items-center pr-2 pointer-events-none">
            <SelectorIcon class="w-5 h-5 text-color_0 dark:text-color_0_dark" aria-hidden="true" />
          </span>
        </ListboxButton>

        <transition
          leave-active-class="transition duration-100 ease-in"
          leave-from-class="opacity-100"
          leave-to-class="opacity-0"
        >
          <ListboxOptions
            class="
              overflow-auto
              absolute
              py-1
              mt-1
              w-full
              max-h-60
              text-base
              bg-white
              rounded-md
              ring-1 ring-black ring-opacity-5
              shadow-lg
              focus:outline-none
              sm:text-sm
            "
          >
            <ListboxOption
              v-for="item in props.data"
              v-slot="{ active, selected }"
              :key="item.iso_nombre"
              :value="item"
              as="template"
            >
              <li
                :class="[
                  active ? 'bg-light_smooth text-color_0 dark:text-color_0_dark' : 'text-dark_base',
                  'relative cursor-default text-left select-none py-2 pl-10 pr-4',
                ]"
              >
                <span :class="[selected ? 'font-medium' : 'font-normal', 'block truncate']">{{ item.iso_nombre }}</span>
                <span
                  v-if="selected"
                  class="flex absolute inset-y-0 left-0 items-center pl-3 dark:text-color_0_dark text-color_0'"
                >
                  <CheckIcon class="w-5 h-5" aria-hidden="true" />
                </span>
              </li>
            </ListboxOption>
          </ListboxOptions>
        </transition>
      </div>
    </Listbox>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { Listbox, ListboxLabel, ListboxButton, ListboxOptions, ListboxOption } from '@headlessui/vue'
import { CheckIcon, SelectorIcon } from '@heroicons/vue/solid'

const props = defineProps({
  data: {
    type: Array,
    default: [],
    required: false,
  },
  onChange: {
    type: Function,
    required: false,
  },
})

const selectedItem = ref(props.data[0])
</script>
