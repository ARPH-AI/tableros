cube(`CovidEdadSexoMasc`, {
  sql: `
    select
      id,
      grupo_etario as grupo_edad,
      (
        select count(1)
        from
          tableros.problema_con_covid pcc join
            person p on (p.id=pcc.person_id)
        where
          date_part('year',age(pcc.start_date,p.birth_date)) = ge.id and
          p.gender_id=2
      ) as cantidad_edad,
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
    cantidad_masc: {
      sql: `cantidad_edad`,
      type: `sum`,
      title: `Varones`,
    },
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
    },
  },
  title: ` `,
  dataSource: `default`,
})
