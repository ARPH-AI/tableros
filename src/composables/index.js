import { useDark, useToggle, createGlobalState, useStorage } from '@vueuse/core'
import { reactive, ref, readonly } from 'vue'

export const useGlobalState = createGlobalState(() =>
  useStorage('vue-use-locale-storage', {
    criterio: 'situacion_actual',
    fuente: 'hsi',
  })
)

export function useState(initialState) {
  const state = ref(initialState);
  const setState = (newState) => {
    state.value = newState;
  };
  
  return [readonly(state), setState];
}

export const scrollingDown = ref(false)

export const scrollingUp = ref(false)

let lastScrollTop = 0

export const handleScroll = () => {
  let st = window.pageYOffset || document.documentElement.scrollTop
  if (st > lastScrollTop) {
    // downscroll
    scrollingDown.value = true
    scrollingUp.value = false
  } else {
    // upscroll
    scrollingDown.value = false
    scrollingUp.value = true
    if (st == 0) {
      //  reset
      scrollingDown.value = false
      scrollingUp.value = false
    }
  }
  lastScrollTop = st <= 0 ? 0 : st // For Mobile or negative scrolling
}

export const isDark = useDark()
export const toggleDarkMode = useToggle(isDark)

export const sidebarState = reactive({
  //isOpen: window.innerWidth > 1024,
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
      return 'primary'
    case 'snvs':
      return 'secondary'
    case 'about':
      return 'secondary'
  }
}

export const getColorByDataSource = (dataSource) => {
  switch (dataSource) {
    case 'hsi':
      return '#f7931e'
    case 'snvs':
      return '#00becb'
  }
}
