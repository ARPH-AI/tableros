cube(`CovidEdadSexoMascSNVS`, {
  sqlAlias: `EdadMascSNVS`,
  sql: `
    select
      s.ideventocaso as id,
      1 as cantidad_snvs,
      ge.grupo_etario as grupo_edad,
      s.departamento_residencia as departamento
    from
      tableros.snvs s
        join tableros.grupo_edad ge on (s.edad_actual = ge.id and s.sexo='M')
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

