cube(`casosCovid`, {
  sqlAlias: `cC19`,
  sql: `
    select
      1 as identificador,
      pcc1.start_date,
      pcc1.cie10_codes,
      pcc1.sctid,
      pcc1.description as variable,
      pcc1.id_consulta,
      pcc1.patient_id,
      pcc1.ciudad,
      pcc1.provincia as provincia,
      pcc1.departamento as departamento
    from
      tableros.problema_con_covid as pcc1
    where
      not exists (
        select
          pcc2.id_consulta
        from
          tableros.problema_con_covid as pcc2
        where
          pcc1.id_consulta!=pcc2.id_consulta and
          pcc1.patient_id=pcc2.patient_id and
          pcc1.start_date between pcc2.start_date and pcc2.start_date + interval '14 day'
      )
  `,
  measures: {
    identificador: {
      sql: `identificador`,
      type: `sum`,
      title: `Cantidad`,
      description: `  `,
    },
    promedioSemanal: {
      sql: `${identificador}`,
      type: `avg`,
      rollingWindow: {
        trailing: `1 month`,
      },
      title: `Promedio`,
      description: `  `,
    },
  },
  dimensions: {
    Estado: {
      sql: `variable`,
      type: `string`,
    },
    cie10: {
      sql: `cie10_codes`,
      type: `string`,
    },
    Fecha_inicio: {
      sql: `start_date`,
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
