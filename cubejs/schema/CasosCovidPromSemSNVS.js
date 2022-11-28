cube(`casosCovidPromSemSNVS`, {
  sqlAlias: `promSemSNVS`,
  sql: `
    select
      se.nombre_semana,
      se.numero_semana,
      se.anio,
      se.fecha,
      (case when s.cantidad_snvs is null then 0 else s.cantidad_snvs end),
      s.departamento
    from tableros.semana_epidemiologica se
      left join (
        select
          ts.departamento_residencia as departamento,
          1 as cantidad_snvs,
          ts.fecha_apertura
        from
          tableros.snvs ts
        where
          ts.clasif_resumen = 'Confirmado'
      ) as s
      on s.fecha_apertura = se.fecha
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
    departamento: {
      sql: `departamento`,
      type: `string`,
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
