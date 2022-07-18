cube(`casos`, {
  sql: `select ROW_NUMBER () OVER (ORDER BY pcc1.id_consulta) as identificador, pcc1.start_date,pcc1.cie10_codes,pcc1.sctid,pcc1.description as variable,pcc1.id_consulta,pcc1.patient_id,se.nombre_semana,se.numero_semana,se.fecha,pcc1.ciudad from tableros.problema_con_covid as pcc1, tableros.semana_epidemiologica se
  where not exists (select pcc2.id_consulta from tableros.problema_con_covid as pcc2 where pcc1.id_consulta!=pcc2.id_consulta and pcc1.patient_id=pcc2.patient_id and pcc1.start_date between pcc2.start_date and pcc2.start_date + interval '14 day' )
  and (se.fecha between pcc1.start_date and pcc1.start_date + interval '10 days')`,
  
  measures: {
    identificador: {
        sql: `identificador`,
        type: `count`,
        title: ` `,
    }
  },
  
  dimensions: {
    variable: {
      sql: `variable`,
      type: `string`,
    },
    cie10: {
      sql: `cie10_codes`,
      type: `string`,
    },
    semana: {
      sql: `nombre_semana`,
      type: `string`,
    },
    inicio_covid: {
      sql: `start_date`,
      type: `time`,
    },
    fecha_covid: {
      sql: `fecha`,
      type: `time`,
    },
    ciudad: {
      sql: `ciudad`,
      type: `string`,
    }
  },
  title:` `,
  dataSource: `default`
});
