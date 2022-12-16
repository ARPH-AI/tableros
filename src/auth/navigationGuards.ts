import { RouteLocationRaw, Router } from 'vue-router'
import { RequiredAuthOptions } from './types'
import { useAuth } from './useAuth'
import { useSectionsStore } from '@/stores/sections-store'
import { storeToRefs } from 'pinia'

const isSection = (route: string): boolean => route.split('-').includes('seccion')

export function configureNavigationGuards(router: Router, options: RequiredAuthOptions) {
  router.beforeEach(async (to, from): Promise<boolean | RouteLocationRaw> => {
    const auth = useAuth()
    const sectionsStore = useSectionsStore()
    const { currentSection, previousTitle } = storeToRefs(sectionsStore)

    window.onpopstate = () => {
      if (!(isSection(to.name) && isSection(from.name))) {
        if (currentSection.value !== 'home' && previousTitle.value.length > 1) {
          sectionsStore.popTitle()
        }
      }
    }

    if (to.name === options.loginRouteName) {
      if (auth.isAuthenticated) {
        return options.loginRedirectRoute
      }
      return true
    }

    sectionsStore.setAxisTitle(to.name)
    if (!to.meta.public) {
      if (!auth.isAuthenticated) {
        return { name: options.loginRouteName, query: { redirectTo: to.fullPath } }
      }
    }

    return true
  })
}
