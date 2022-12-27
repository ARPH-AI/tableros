cube(`casosFebriles`, {
  sqlAlias: `cFebriles`,
  sql: `
    select
      ROW_NUMBER () OVER (ORDER BY se.anio) as id,
      se.nombre_semana,
      se.numero_semana,
      se.anio,
      se.fecha,
      (case when pcc3.cantidad is null then 0 else pcc3.cantidad end),
   	  pcc3.departamento,
      pcc3.provincia,
      pcc3.ciudad,
      pcc3.enfermedad_id as enfermedad_id,
      pcc3.enfermedad_descripcion as enfermedad,
      pcc3.description
    from tableros.semana_epidemiologica se
      left join (
        select
          pcc1.start_date as start_date,
          pcc1.departamento,
          pcc1.provincia,
          pcc1.ciudad,
          pcc1.id_consulta,
          pcc1.enfermedad_id,
          pcc1.enfermedad_descripcion,
          1 as cantidad,
          pcc1.description
        from
          tableros.problema as pcc1
        where
          not exists (
            select
              pcc2.id_consulta
            from tableros.problema as pcc2
            where
              pcc1.id_consulta!=pcc2.id_consulta and
              pcc1.patient_id=pcc2.patient_id and
              pcc1.start_date between pcc2.start_date and pcc2.start_date + interval '14 day'
          ) and
          pcc1.enfermedad_descripcion = 'Fiebre y Sintomas respiratorios'
      ) as pcc3
      on pcc3.start_date=se.fecha
	`,
  measures: {
    count: {
      sql: `id`,
      type: `count`,
      title: `Totales`,
      filters: [{ sql: `${CUBE}.description = 'Fiebre Infecciosa' OR ${CUBE}.description = 'Afectación respiratoria infecciosa'` }],
    },
    NoRespiratorios: {
      sql: `id`,
      type: `count`,
      title: `No respiratorios`,
      filters: [{ sql: `${CUBE}.description = 'Fiebre Infecciosa'` }],
    },
    Respiratorios: {
      sql: `id`,
      type: `count`,
      title: `Respiratorios`,
      filters: [{ sql: `${CUBE}.description = 'Afectación respiratoria infecciosa'` }],
    },
  },
  dimensions: {
    fecha: {
      sql: `fecha`,
      type: `time`,
    },
    nombre_semana: {
      sql: `nombre_semana`,
      type: `string`,
    },
    anio: {
      sql: `anio`,
      type: `number`,
    },
    numero_semana: {
      sql: `numero_semana`,
      type: `number`,
    },
    ciudad: {
      sql: `ciudad`,
      type: `string`,
    },
    provincia: {
      sql: `provincia`,
      type: `string`,
    },
    departamento: {
      sql: `departamento`,
      type: `string`,
    },
    enfermedad: {
      sql: `enfermedad`,
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
  },
  title: ` `,
  dataSource: `default`,
})
