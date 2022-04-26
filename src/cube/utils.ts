import { ResultSet, TableColumn } from '@cubejs-client/core'

export function getDisplayedColumns(tableColumns: TableColumn[]): string[] {
  const queue = tableColumns
  const columns = []

  while (queue.length) {
    const column = queue.shift()
    if (column?.dataIndex) {
      columns.push(column?.dataIndex)
    }
    if ((column?.children || []).length) {
      column?.children?.map((child) => queue.push(child))
    }
  }

  return columns
}

export function flattenColumns(columns: TableColumn[] = []): any {
  return columns.reduce((memo, column: any) => {
    const titles = flattenColumns(column.children)
    return [...memo, ...(titles.length ? titles.map((title: any) => column.shortTitle) : [column.shortTitle])]
  }, [])
}

export function obtenerCantidad(resultado: ResultSet) {
  return resultado
    .rawData()
    .map((item) => Object.values(item).map((value) => value))
    .join(' ')
}

export function obtenerMinimo(testArr: number[]): number {
  return isIterable(testArr) ? Math.min(...testArr) : 0
}

export function obtenerMaximo(testArr: number[]): number {
  return isIterable(testArr) ? Math.max(...testArr) : 0
}

export function porcentaje(numero: number, porcentaje: number): number {
  return (numero / 100) * porcentaje
}

function isIterable(obj: any) {
  // checks for null and undefined
  if (obj == null) {
    return false
  }
  return typeof obj[Symbol.iterator] === 'function'
}

export const mergeArrayByKey = (arr1, arr2, key1, key2) => {
  return arr1.map((item, i) => {
    if (item[key1] === arr2[i][key2]) {
      return Object.assign({}, item, arr2[i])
    }
  })
}

export const getRandomInRange = (from, to, fixed) => {
  return (Math.random() * (to - from) + from).toFixed(fixed) * 1
}
