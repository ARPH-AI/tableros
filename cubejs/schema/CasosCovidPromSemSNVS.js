cube(`casosCovidPromSemSNVS`, {
  sqlAlias: `promSemSNVS`,
  sql: `
    select
      se.nombre_semana,
      se.numero_semana,
      se.anio,
      se.fecha,
      (
        select
          count(1)
        from
          tableros.snvs s
        where
          clasif_resumen = 'Confirmado' and
          se.fecha=s.fecha_apertura
      ) as cantidad_snvs
    from
      tableros.semana_epidemiologica se
  `,
  measures: {
    cantidadXDiaSNVS: {
      sql: `cantidad_snvs`,
      type: `sum`,
      title: `Casos Diarios SNVS`,
    },
    promedioSemanalSNVS: {
      sql: `cantidad_snvs`,
      type: `avg`,
      rollingWindow: {
        trailing: `7 day`,
      },
      title: `Promedio Sem. SNVS`,
    },
  },
  dimensions: {
    Fecha_inicio_Conf: {
      sql: `fecha`,
      type: `time`,
    },
    nombre_semana: {
      sql: `nombre_semana`,
      type: `string`,
    },
    anio: {
      sql: `anio`,
      type: `number`,
    },
    numero_semana: {
      sql: `numero_semana`,
      type: `number`,
    },
  },
  preAggregations: {
    main: {
      type: `originalSql`,
      refreshKey: {
        every: `1 day`,
      },
    },
  },
  title: ` `,
  dataSource: `default`,
})
