import { useDark, useToggle } from '@vueuse/core'
import { reactive } from 'vue'
import { useRouter } from 'vue-router'

export const isDark = useDark()
export const toggleDarkMode = useToggle(isDark)

export const sidebarState = reactive({
  isOpen: false,
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

export const getThemeByDataSource = (dataSource) => {
  switch (dataSource) {
    case 'hsi':
      return 'color_0'
    case 'snvs':
      return 'color_1'
    default:
      return 'color_0'
  }
}

export const isCurrentRoute = (routeName) => {
  return useRouter().currentRoute.value.name == routeName
}
