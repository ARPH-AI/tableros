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
  return Math.min(...testArr)
}

export function obtenerMaximo(testArr: number[]): number {
  return Math.max(...testArr)
}

export function porcentaje(numero: number, porcentaje: number): number {
  return (numero / 100) * porcentaje
}
