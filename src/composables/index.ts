import { useDark, useToggle } from '@vueuse/core'
import { reactive } from 'vue'
import { useRouter } from 'vue-router'
import { enos_array } from '@/data/enos/enos'

export const isDark = useDark()
export const toggleDarkMode = useToggle(isDark)
export const getCurrentEnoDataSources = (current_eno: { value: string }) => {
  const eno_data_sources: { key: string; title: string; content: string }[] = []
  // enos_array.forEach(function (eno) {
  //   // if (eno[1].key == current_eno.value) {
  //   //   eno_data_sources = eno[1].fuente_datos
  //   // }
  //   console.log('dddddddwqwrk')
  // })
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
