cube(`casos`, {
  sqlAlias: `casos`,
  sql: `
    select
      ROW_NUMBER () OVER (ORDER BY pcc1.id_consulta) as identificador,
      pcc1.start_date,
      pcc1.cie10_codes,
      pcc1.sctid,
      pcc1.description as variable,
      pcc1.id_consulta,
      pcc1.patient_id,
      se.nombre_semana,
      se.numero_semana,
      se.fecha,
      se.anio,
      pcc1.ciudad,
      pcc1.provincia as provincia,
      pcc1.departamento as departamento,
      pcc1.enfermedad_id as enfermedad_id,
      pcc1.enfermedad_descripcion as enfermedad
    from
      tableros.problema as pcc1,
      tableros.semana_epidemiologica se
    where
      not exists (
        select
          pcc2.id_consulta
        from
          tableros.problema as pcc2
        where
          pcc1.id_consulta!=pcc2.id_consulta and
          pcc1.patient_id=pcc2.patient_id and
          pcc1.start_date between pcc2.start_date and pcc2.start_date + interval '14 day'
      ) and (
        se.fecha between pcc1.start_date and pcc1.start_date + interval '10 days'
      )`,

  measures: {
    identificador: {
      sql: `identificador`,
      type: `count`,
      title: ` `,
    },
  },

  dimensions: {
    variable: {
      sql: `variable`,
      type: `string`,
    },
    cie10: {
      sql: `cie10_codes`,
      type: `string`,
    },
    semana: {
      sql: `nombre_semana`,
      type: `string`,
    },
    numero_semana: {
      sql: `numero_semana`,
      type: `number`,
    },
    anio: {
      sql: `anio`,
      type: `number`,
    },
    fecha_inicio: {
      sql: `start_date`,
      type: `time`,
    },
    fecha_activo: {
      sql: `fecha`,
      type: `time`,
    },
    ciudad: {
      sql: `ciudad`,
      type: `string`,
    },
    provincia: {
      sql: `provincia`,
      type: `string`,
    },
    departamento: {
      sql: `departamento`,
      type: `string`,
    },
    enfermedad: {
      sql: `enfermedad`,
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
