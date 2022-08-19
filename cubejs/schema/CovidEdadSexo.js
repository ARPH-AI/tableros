cube(`CovidEdadSexo`, {
  sql: `
  select
    (case
      when p.gender_id is null
      then 0 else 1
      end
    ) as identificador,
    pcc.start_date,
    date_part('year',age(pcc.start_date,p.birth_date)) as edad,
    p.gender_id,
    g.description as sexo,
    (case
      when grupo_edad.grupo_etario is null
      then 'v' else grupo_edad.grupo_etario
      end
    ) as grupo_edad,
    se.numero_semana,
    se.anio
  from
    tableros.problema_con_covid pcc
      join person p on (p.id=pcc.person_id)
      join gender g on (g.id=p.gender_id)
      right outer join tableros.semana_epidemiologica se  on (pcc.start_date=se.fecha)
      right outer join tableros.grupo_edad on (date_part('year',age(pcc.start_date,p.birth_date)) = grupo_edad.id)
  `,

  measures: {
    identificador: {
        sql: `identificador`,
        type: `sum`,
        title: ` `,
    }
  },

  dimensions: {
    Edad: {
      sql: `edad`,
      type: `number`,
    },
    Sexo: {
      sql: `sexo`,
      type: `string`,
    },
    Fecha_inicio: {
      sql: `start_date`,
      type: `time`,
    },
    Grupo_edad: {
      sql: `grupo_edad`,
      type: `string`,
    },
    Numero_semana: {
      sql: `numero_semana`,
      type: `number`,
    },
    Anio: {
      sql: `anio`,
      type: `number`,
    },
  },
  title:` `,
  dataSource: `default`
});
