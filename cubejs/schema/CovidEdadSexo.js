cube(`CovidEdadSexo`, {
  sql: `
  select
    (case
      when p.gender_id is null
      then 0 else 1
      end
    ) as identificador,
    patient_id,
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
    },
    casosFemeninos:{
        sql: `patient_id`,
        type: `countDistinct`,
        title: 'Casos pacientes fem',
        filters: [{ sql: `${CovidEdadSexo}.sexo = 'Femenino'` }],
    },
    total_covid: {
        sql: `patient_id`,
        type: `count`,
        title: `Total COVID`,
        description: `Total de pacientes COVID confirmado y sospechoso`,
    },
    frecuenciaCasosFem: {
        sql: `100 * ${casosFemeninos} / NULLIF(${total_covid} + 0.0, 0)`,
        type: `number`,
        format: 'percent',
        title: '% de casos femeninos',
    },
    casosNuevosCovid: {
        sql: `patient_id`,
        type: `count`,
        title: `Casos Nuevos COVID`,
        description: `Total de pacientes COVID confirmado y sospechoso en los ult 7 dias`,
        filters: [{sql: `${Fecha_inicio} > CURRENT_DATE - INTERVAL '6 days'` }]
    },
    promCasosNuevosCovid: {
        sql: `${casosNuevosCovid}/7`,
        type: `number`,
        title: `Promedio casos COVID`,
        description: `Promedio de pacientes COVID confirmado y sospechoso en los ult 7 dias`
    },
    casosNuevosMayores60:{
        sql: `patient_id`,
        type: `countDistinct`,
        title: 'Casos mayores a 60',
        filters: [{ sql: `${CovidEdadSexo}.edad > 59`, sql: `${Fecha_inicio} > CURRENT_DATE - INTERVAL '7 days'` }],
    },
    casosNuevosMenores20:{
        sql: `patient_id`,
        type: `countDistinct`,
        title: 'Casos menores a 20',
        filters: [{ sql: `${CovidEdadSexo}.edad < 21`,  sql: `${Fecha_inicio} > CURRENT_DATE - INTERVAL '7 days'`  }]
    },
    frecuenciaCasosMay: {
        sql: `(${casosNuevosMayores60} / NULLIF(${casosNuevosCovid} + 0.0, 0 ))*100`,
        type: `number`,
        format: 'percent',
        title: '% de casos nuevos mayores a 60',
    },
    frecuenciaCasosMen: {
        sql: `(${casosNuevosMenores20} / NULLIF(${casosNuevosCovid} + 0.0, 0 ))*100`,
        type: `number`,
        format: 'percent',
        title: '% de casos nuevos menores a 20',
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
  preAggregations: {
    main: {
      type: `originalSql`,
    },
  },
  title: ` `,
  dataSource: `default`,
})
