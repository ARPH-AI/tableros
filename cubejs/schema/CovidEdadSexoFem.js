cube(`CovidEdadSexoFem`, {
  sqlAlias: `EdadFem`,
  sql:`
    select
      pcc.person_id as id,
      1 as identificador,
      ge.grupo_etario as grupo_edad,
      pcc.ciudad,
      pcc.departamento,
      pcc.provincia
    from
      tableros.problema_con_covid pcc
        join person p on ((p.id=pcc.person_id) and p.gender_id=1)
        join tableros.grupo_edad ge on (date_part('year',age(pcc.start_date,p.birth_date)) = ge.id)
`,
  measures: {
    cantidad_fem: {
      sql: `identificador`,
      type: `sum`,
      title: `Mujeres`,
    },
  },
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true,
    },
    grupo_edad_fem: {
      sql: `grupo_edad`,
      type: `string`,
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
    },/*
    cantidadFem: {
      measures: [`${CUBE}.cantidad_fem`],
      useOriginalSqlPreAggregations: true,
    },
    cantidadGrupo: {
      measures: [`${CUBE}.cantidad_fem`],
      dimensions: [`${CUBE}.grupo_edad_fem`],
      useOriginalSqlPreAggregations: true,
    },*/
  },
  title: ` `,
  dataSource: `default`,
})
