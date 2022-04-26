import { useDark, useToggle, createGlobalState, useStorage } from '@vueuse/core'
import { reactive, ref } from 'vue'

export const useGlobalState = createGlobalState(() =>
  useStorage('vue-use-locale-storage', {
    criterio: 'situacion_actual',
    fuente: 'hsi',
  })
)

export const isDark = useDark()
export const toggleDarkMode = useToggle(isDark)
export const sidebarState = reactive({
  isOpen: window.innerWidth > 1024,
  isHovered: false,
  handleHover(value) {
    if (window.innerWidth < 1024) {
      return
    }
    sidebarState.isHovered = value
  },
  handleWindowResize() {
    if (window.innerWidth <= 1024) {
      sidebarState.isOpen = false
    } else {
      sidebarState.isOpen = true
    }
  },
})
