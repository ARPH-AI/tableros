import { useDark, useToggle } from '@vueuse/core'
import { reactive } from 'vue'
import { useRouter } from 'vue-router'
import { enos } from '@/data/enos/enos'

export const isDark = useDark()
export const toggleDarkMode = useToggle(isDark)
export const getCurrentEnoDataSources = (current_eno) => {
  let eno_data_sources = []
  console.log(current_eno.value, 'CURRENT ENO')
  const enos_array = Object.entries(enos)
  enos_array.forEach(function (eno) {
    if (eno[1].key == current_eno.value) {
      eno_data_sources = eno[1].fuente_datos
    }
  })
  return eno_data_sources || []
}
export const sidebarState = reactive({
  isOpen: false,
  isHovered: false,
  handleHover(value: boolean) {
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

export const getThemeByDataSource = (dataSource: string) => {
  switch (dataSource) {
    case 'hsi':
      return 'color_0'
    case 'snvs':
      return 'color_1'
    default:
      return 'color_0'
  }
}

export const isCurrentRoute = (routeName: string) => {
  return useRouter().currentRoute.value.name == routeName
}
