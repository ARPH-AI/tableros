cube(`casosCovidPromSem`, {
  sqlAlias: `promSem`,
  sql: `
		select
    	se.nombre_semana,
      se.numero_semana,
      se.anio,
      se.fecha,
	  	(case when pcc3.cantidad is null then 0 else pcc3.cantidad end),
   	  pcc3.departamento,
      pcc3.provincia,
      pcc3.ciudad
    from tableros.semana_epidemiologica se
    	left join (
        select
					pcc1.start_date as start_date,
					pcc1.departamento,
					pcc1.provincia,
					pcc1.ciudad,
					pcc1.id_consulta,
					1 as cantidad
        from
          tableros.problema_con_covid as pcc1
        where
          not exists (
            select
              pcc2.id_consulta
            from tableros.problema_con_covid as pcc2
            where
              pcc1.id_consulta!=pcc2.id_consulta and
              pcc1.patient_id=pcc2.patient_id and
              pcc1.start_date between pcc2.start_date and pcc2.start_date + interval '14 day'
          ) and
          pcc1.description = 'Confirmado'
      ) as pcc3
      on pcc3.start_date=se.fecha
	`,
  measures: {
    cantidadXDia: {
      sql: `cantidad`,
      type: `sum`,
      title: `Casos Diarios`,
    },
    promedioSemanal: {
      sql: `cantidad`,
      type: `avg`,
      rollingWindow: {
        trailing: `7 day`,
      },
      title: `Promedio Sem.`,
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
