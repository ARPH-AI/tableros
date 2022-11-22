cube(`CovidEdadSexoFemSNVS`, {
  sqlAlias: `EdadFemSNVS`,
  sql: `
    select
      id,
      grupo_etario as grupo_edad,
      (
        select count(1)
        from tableros.snvs
        where
          snvs.edad_actual=ge.id and
          snvs.sexo='F'
      ) as cantidad_snvs
    from tableros.grupo_edad ge
  `,
  measures: {
    cantidad_fem_snvs: {
      sql: `cantidad_snvs`,
      type: `sum`,
      title: `Mujeres `,
    },
  },
  dimensions: {
    id_fem: {
      sql: `id`,
      type: `number`,
      primaryKey: true,
    },
    grupo_edad_fem: {
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
    },/*
    cantidadFemSNVS: {
      measures: [`${CUBE}.cantidad_fem_snvs`],
      useOriginalSqlPreAggregations: true,
    },
    cantidadGrupoSNVS: {
      measures: [`${CUBE}.cantidad_fem_snvs`],
      dimensions: [`${CUBE}.grupo_edad_fem`],
      useOriginalSqlPreAggregations: true,
    },*/
  },
  title: ` `,
  dataSource: `default`,
})

