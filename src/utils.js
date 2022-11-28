const LOCALE = 'es-AR'

const marker = (args) => args.marker ? args.marker : ''

const axisValueLabel = (args) => args.axisValueLabel ? args.axisValueLabel : ''

const seriesName = (args) => args.seriesName ? args.seriesName : ''

const value = (args) => args.value ? args.value : ''

const bold = (txt) => `<b>${txt}</b>`

const positive = (num) => num * -1

const getName = (args) => args.name ? args.name : ''

export const normalizeDecimals = (num, options={}) => {
  return num ? new Intl.NumberFormat(LOCALE, {
    ...options,
    minimumFractionDigits: 0,
    maximumFractionDigits: 2,
  }).format(num) : num
}

export const normalizeArgsDecimals = (args, options={}) => {
  if (args) {
    args.forEach(arg => {
      arg.value = normalizeDecimals(arg.value, options)
    })
  }
  return args
}

export const formatLeftDataToNaturalNumber = (args) => `
  ${axisValueLabel(args[0])} <br/> 
  ${marker(args[0])} ${seriesName(args[0])}: ${bold(positive(value(args[0])))} <br/> 
  ${marker(args[1])} ${seriesName(args[1])}: ${bold(value(args[1]))}
`

export const formatDecimalValues = (args) => `
  ${axisValueLabel(args[0])} <br/>
  ${marker(args[0])} ${seriesName(args[0])}: ${bold((normalizeDecimals(value(args[0])) || 0 )+' %')} <br/>
  ${marker(args[1])} ${seriesName(args[1])}: ${bold((normalizeDecimals(value(args[1])) || 0 )+' %')}
`

export const formatDonaDecimalValues = (args) => `
  ${getName(args)} <br/>
  ${bold(normalizeDecimals(value(args))+' %')}
`
