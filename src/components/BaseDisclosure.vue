<template>
  <div class="w-full mt-4">
    <div class="w-full max-w-md rounded-2xlp-2">
      <Disclosure v-for="section in props.content" :key="section.order" v-slot="{ open }">
        <DisclosureButton
          class="
            flex
            w-full
            justify-between
            rounded-lg
            py-3
            px-3
            text-left text-sm
            font-medium
            hover:bg-purple-200
            border-b-2 border-color-gray-200
            focus:outline-none
            group
            focus-visible:ring focus-visible:ring-purple-500 focus-visible:ring-opacity-75
          "
        >
          <span class="group-hover:text-color_2">{{ section.title }}</span>
          <ChevronUpIcon :class="open ? 'rotate-180 transform' : ''" class="h-5 w-5 text-purple-500" />
          <transition
            enter-active-class="transition duration-100 ease-out"
            enter-from-class="transform scale-95 opacity-0"
            enter-to-class="transform scale-100 opacity-100"
            leave-active-class="transition duration-75 ease-out"
            leave-from-class="transform scale-100 opacity-100"
            leave-to-class="transform scale-95 opacity-0"
          ></transition>
        </DisclosureButton>
        <DisclosurePanel class="px-4 pt-4 pb-2 text-sm text-gray-500">
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
