cube(`casosCovidPromSem`, {
  sql: `select se.nombre_semana,se.numero_semana,se.fecha,(select count(1) from tableros.problema_con_covid as pcc1
  where not exists (select pcc2.id_consulta from tableros.problema_con_covid as pcc2 where pcc1.id_consulta!=pcc2.id_consulta and pcc1.patient_id=pcc2.patient_id and pcc1.start_date between pcc2.start_date and pcc2.start_date + interval '14 day' )
  and pcc1.description = 'Confirmado' and pcc1.start_date=se.fecha) as cantidad,
  (select count(1) from tableros.snvs s where clasificacion_resumen = 'Confirmado' and se.fecha=s.fecha_apertura and residencia_provincia_nombre='Buenos Aires') as cantidad_snvs from tableros.semana_epidemiologica se
  `,

  measures: {
    cantidadXDia: {
        sql: `cantidad`,
        type: `sum`,
        title: `Casos Diarios`,
    },
    cantidadXDiaSNVS: {
      sql: `cantidad_snvs`,
      type: `sum`,
      title: `Casos Diarios SNVS`,
    },
    promedioSemanal: {
      sql: `cantidad`,
      type: `avg`,
      rollingWindow: {
        trailing: `7 day`,
      },
      title: `Promedio Sem.`,
    },
    promedioSemanalSNVS: {
      sql: `cantidad_snvs`,
      type: `avg`,
      rollingWindow: {
        trailing: `7 day`,
      },
      title: `Promedio Sem. SNVS`,
    },
  },

  dimensions: {
    Fecha_inicio_Conf: {
      sql: `fecha`,
      type: `time`,

    },
    nombre_semana: {
        sql: `nombre_semana`,
        type: `string`,

      },
    numero_semana: {
        sql: `numero_semana`,
        type: `number`,

      },
  },
  preAggregations: {
    main: {
      type: `originalSql`
    },
  },
  title:` `,
  dataSource: `default`
});
