cube(`SemanaEpidemiologica`, {
  sqlAlias: `SemEpi`,
  sql: `select * from tableros.semana_epidemiologica`,
  measures: {
    count: {
      sql: `id`,
      type: `count`,
    },
  },
  dimensions: {
    numero_semana: {
      sql: `numero_semana`,
      type: `number`,
    },
    nombre_semana: {
      sql: `nombre_semana`,
      type: `string`,
    },
    fecha: {
      sql: `fecha`,
      type: `time`,
    },
    anio: {
      sql: `anio`,
      type: `number`,
    },
  },
  preAggregations: {
    semanaPorDia: {
      measures: [count],
      timeDimension: fecha,
      granularity: `day`,
    },
  },
  dataSource: `default`,
})
