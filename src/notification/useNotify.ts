import { notifyInstance } from './plugin'
import { NotifyPlugin } from './types'

/**
 * Returns the auth instance. Equivalent to using `$auth` inside
 * templates.
 */
export function useNotify(): NotifyPlugin {
  // eslint-disable-next-line
  return notifyInstance!
}
