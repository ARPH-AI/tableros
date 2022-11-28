cube(`CovidEdadSexoMasc`, {
  sqlAlias: `EdadMasc`,
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
        join person p on ((p.id=pcc.person_id) and p.gender_id=2)
        join tableros.grupo_edad ge on (date_part('year',age(pcc.start_date,p.birth_date)) = ge.id)
`,
  measures: {
    cantidad_masc: {
      sql: `identificador`,
      type: `sum`,
      title: `Varones`,
    },
  },
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true,
    },
    grupo_edad_masc: {
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
    cantidadMasc: {
      measures: [`${CUBE}.cantidad_masc`],
      useOriginalSqlPreAggregations: true,
    },
    cantidadGrupoMasc: {
      measures: [`${CUBE}.cantidad_masc`],
      dimensions: [`${CUBE}.grupo_edad_masc`],
      useOriginalSqlPreAggregations: true,
    },*/
  },

  title: ` `,
  dataSource: `default`,
})
