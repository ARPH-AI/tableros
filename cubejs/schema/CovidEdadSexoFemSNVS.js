cube(`CovidEdadSexoFemSNVS`, {
  sqlAlias: `EdadFemSNVS`,
  sql: `
    select
      s.ideventocaso as id,
      1 as cantidad_snvs,
      ge.grupo_etario as grupo_edad,
      s.departamento_residencia as departamento
    from
      tableros.snvs s
        join tableros.grupo_edad ge on (s.edad_actual = ge.id and s.sexo='F')
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

