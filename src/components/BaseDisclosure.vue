<template>
  <div class="w-full mt-4">
    <div class="w-full max-w-md rounded-2xlp-2">
      <Disclosure v-for="(section, index) in props.content" :key="index" v-slot="{ open }">
        <DisclosureButton
          class="
            flex
            w-full
            justify-between
            rounded-lg
            py-3
            px-3
            font-medium
            hover:bg-light_contrast
            dark:hover:bg-dark_contrast
            border-b-2
            border-light_contrast
            dark:border-dark_contrast
            focus:outline-none
            group
          "
        >
          <span class="text-left text-sm group-hover:text-dark_contrast dark:group-hover:text-light_contrast">{{
            section.title
          }}</span>
          <ChevronUpIcon
            :class="open ? 'rotate-180 transform' : ''"
            class="
              h-5
              w-5
              text-light_contrast
              dark:text-dark_contrast
              group-hover:text-dark_contrast
              dark:group-hover:text-light_contrast
            "
          />
          <transition
            enter-active-class="transition duration-100 ease-out"
            enter-from-class="transform scale-95 opacity-0"
            enter-to-class="transform scale-100 opacity-100"
            leave-active-class="transition duration-75 ease-out"
            leave-from-class="transform scale-100 opacity-100"
            leave-to-class="transform scale-95 opacity-0"
          ></transition>
        </DisclosureButton>
        <DisclosurePanel class="px-4 pt-4 pb-2 text-sm text-dark_smooth dark:text-dark_contrast">
          {{ section.content }}
        </DisclosurePanel>
      </Disclosure>
    </div>
  </div>
</template>

<script setup>
import { Disclosure, DisclosureButton, DisclosurePanel } from '@headlessui/vue'
import { ChevronUpIcon } from '@heroicons/vue/solid'

const props = defineProps({
  content: Array,
})
</script>
