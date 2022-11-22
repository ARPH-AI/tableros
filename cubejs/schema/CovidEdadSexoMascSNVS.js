cube(`CovidEdadSexoMascSNVS`, {
  sqlAlias: `EdadMascSNVS`,
  sql: `
    select
      id,
      grupo_etario as grupo_edad,
      (
        select count(1)
        from tableros.snvs
        where
          snvs.edad_actual=ge.id and
          snvs.sexo='M'
      ) as cantidad_snvs
    from tableros.grupo_edad ge
  `,
  measures: {
    cantidad_masc_snvs: {
      sql: `cantidad_snvs`,
      type: `sum`,
      title: `Varones `,
    },
  },
  dimensions: {
    id_masc: {
      sql: `id`,
      type: `number`,
      primaryKey: true,
    },
    grupo_edad_masc: {
      sql: `grupo_edad`,
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
/*
    cantidadMascSNVS: {
      measures: [`${CUBE}.cantidad_masc_snvs`],
      useOriginalSqlPreAggregations: true,
    },
    cantidadGrupoMascSNVS: {
      measures: [`${CUBE}.cantidad_masc_snvs`],
      dimensions: [`${CUBE}.grupo_edad_masc`],
      useOriginalSqlPreAggregations: true,
    },*/
  },
  title: ` `,
  dataSource: `default`,
})

