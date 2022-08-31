<template>
  <div class="relative">
    <SidebarLink :title="title" :active="active" @click="isOpen = !isOpen">
      <template #icon>
        <slot name="icon">
          <ViewListIcon class="flex-shrink-0 w-6 h-6" aria-hidden="true" />
        </slot>
      </template>

      <template #arrow>
        <span
          v-show="sidebarState.isOpen || sidebarState.isHovered"
          aria-hidden="true"
          class="relative block w-6 h-6 ml-auto"
        >
          <span
            :class="[
              'absolute right-[9px] mt-[-5px] h-2 w-[2px] top-1/2 transition-all duration-200',
              {
                '-rotate-45': isOpen,
                'rotate-45': !isOpen,
                'bg-white': active,
                'bg-gray-400': !active,
              },
            ]"
          ></span>
          <span
            :class="[
              'absolute left-[9px] mt-[-5px] h-2 w-[2px] top-1/2 transition-all duration-200',
              {
                'rotate-45': isOpen,
                '-rotate-45': !isOpen,
                'bg-white': active,
                'bg-gray-400': !active,
              },
            ]"
          ></span>
        </span>
      </template>
    </SidebarLink>

    <transition appear @before-enter="beforeEnter" @enter="enter" @before-leave="beforeLeave" @leave="leave">
      <div
        v-show="isOpen && (sidebarState.isOpen || sidebarState.isHovered)"
        class="overflow-hidden transition-all duration-200 max-h-0"
      >
        <ul
          class="
            relative
            px-0
            pt-2
            pb-0
            ml-5
            before:w-0
            before:block
            before:absolute
            before:inset-y-0
            before:left-0
            before:border-l-2
            before:border-l-light_contrast
            dark:before:border-l-dark_contrast
          "
        >
          <slot />
        </ul>
      </div>
    </transition>
  </div>
</template>

<script setup>
import { ref, toRefs } from 'vue'
import SidebarLink from '@/components/SidebarLink.vue'
import { ViewListIcon } from '@heroicons/vue/outline'
import { sidebarState } from '@/composables'

const props = defineProps({
  title: {
    type: String,
  },
  icon: {
    required: false,
  },
  active: {
    type: Boolean,
  },
})

const { active } = toRefs(props)

const isOpen = ref(active.value)

const beforeEnter = (el) => {
  el.style.maxHeight = `0px`
}

const enter = (el) => {
  el.style.maxHeight = `${el.scrollHeight}px`
}

const beforeLeave = (el) => {
  el.style.maxHeight = `${el.scrollHeight}px`
}

const leave = (el) => {
  el.style.maxHeight = `0px`
}
</script>
