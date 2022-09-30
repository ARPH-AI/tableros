cube(`CovidEdadSexoSNVS`, {
  sql: `
    select
      snvs.ideventocaso,
      snvs.fecha_apertura,
      snvs.edad_actual as edad,
      snvs.sexo,
      (case when
        grupo_edad.grupo_etario is null
        then 'v' else grupo_edad.grupo_etario
        end
      ) as grupo_edad,
      snvs.departamento_residencia as ciudad,
      se.numero_semana,
      se.anio
  from tableros.snvs
    right outer join tableros.grupo_edad on (snvs.edad_actual = grupo_edad.id)
    right outer join tableros.semana_epidemiologica se on (se.fecha=snvs.fecha_apertura)
  `,
  measures: {
    ideventocaso: {
      sql: `ideventocaso`,
      type: `count`,
    },
    casosNuevosCovidSNVS: {
      sql: `ideventocaso`,
      type: `countDistinct`,
      title: `Casos Nuevos COVID SNVS`,
      description: `Total de pacientes COVID confirmado y sospechoso en los ult 7 dias`,
      filters: [{sql: `${Fecha_apertura} > CURRENT_DATE - INTERVAL '6 days'` }]
    },
    casosNuevosMayores60SNVS:{
      sql: `ideventocaso`,
      type: `countDistinct`,
      title: 'Casos mayores a 60',
      filters: [{ sql: `${CovidEdadSexoSNVS}.edad > 59`, sql: `${Fecha_apertura} > CURRENT_DATE - INTERVAL '7 days'` }],
    },
    casosNuevosMenores20SNVS:{
      sql: `ideventocaso`,
      type: `countDistinct`,
      title: 'Casos menores a 20',
      filters: [{ sql: `${CovidEdadSexoSNVS}.edad < 21`,  sql: `${Fecha_apertura} > CURRENT_DATE - INTERVAL '7 days'`  }]
    },
    frecuenciaCasosMaySNVS: {
      sql: `100 * ${casosNuevosMayores60SNVS} /  NULLIF(${casosNuevosCovidSNVS}+ 0.0, 0)`,
      type: `number`,
      format: 'percent',
      title: '% de casos nuevos mayores a 60 SNVS',
    },
    frecuenciaCasosMenSNVS: {
      sql: `100 * ${casosNuevosMenores20SNVS} / NULLIF(${casosNuevosCovidSNVS}+ 0.0, 0)`,
      type: `number`,
      format: 'percent',
      title: '% de casos nuevos menores a 20 SNVS',
    },
    promCasosNuevosCovidSNVS: {
      sql: `${casosNuevosCovidSNVS}/7`,
      type: `number`,
      title: `Promedio casos COVID`,
      description: `Promedio de pacientes COVID confirmado y sospechoso en los ult 7 dias`
    },
  },
  dimensions: {
    Edad_snvs: {
      sql: `edad`,
      type: `number`,
    },
    Sexo_snvs: {
      sql: `sexo`,
      type: `string`,
    },
    Fecha_apertura: {
      sql: `fecha_apertura`,
      type: `time`,
    },
    Grupo_edad: {
      sql: `grupo_edad`,
      type: `string`,
    },
    Ciudad: {
      sql: `ciudad`,
      type: `string`,
    },
    Numero_semana_snvs: {
      sql: `numero_semana`,
      type: `number`,
    },
    Anio_snvs: {
      sql: `anio`,
      type: `number`,
    },
  },
  dataSource: `default`,
})
