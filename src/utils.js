
const marker = (args) => args.marker ? args.marker : ''

const axisValueLabel = (args) => args.axisValueLabel ? args.axisValueLabel : ''

const seriesName = (args) => args.seriesName ? args.seriesName : ''

const value = (args) => args.value ? args.value : ''

const bold = (txt) => `<b>${txt}</b>`

const positive = (num) => num * -1

const normalizeDecimals = (num) =>
  new Intl.NumberFormat('es-AR', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  }).format(num)


export const formatLeftDataToNaturalNumber = (args) => `
  ${axisValueLabel(args[0])} <br/> 
  ${marker(args[0])} ${seriesName(args[0])}: ${bold(positive(value(args[0])))} <br/> 
  ${marker(args[1])} ${seriesName(args[1])}: ${bold(value(args[1]))}`

export const formatDecimalValues = (args) => `
  ${axisValueLabel(args[0])} <br/>
  ${marker(args[0])} ${seriesName(args[0])}: ${bold(normalizeDecimals(value(args[0])))} <br/>
  ${marker(args[1])} ${seriesName(args[1])}: ${bold(normalizeDecimals(value(args[1])))}
`