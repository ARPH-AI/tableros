const statuses = ['Confirmado', 'Sospecha']

const createTotalByStatusMeasure = (status) => ({
  [`total_${status}`]: {
    type: `count`,
    title: `Total ${status}`,
    filters: [
      {
        sql: (CUBE) => `${CUBE}."estado" = '${status}'`,
      },
    ],
  },
})

/*
const createPercentageMeasure = (status) => ({
  [`Percentage_of_${status}`]: {
    type: `number`,
    format: `percent`,
    title: `Percentage of ${status} orders`,
    sql: (CUBE) =>
      `ROUND(${CUBE[`Total_${status}_orders`]}::numeric / ${CUBE.totalOrders}::numeric * 100.0, 2)`,
  },
});
*/

cube(`casosComorbilidad`, {
  sql: `
  select
     ROW_NUMBER () OVER (ORDER BY pcc1.id_consulta) as identificador,
     pcc1.patient_id as paciente,
     pcc.comorbilidad as comorbilidad,
     pcc1.description as estado,
     g.description as sexo
   from
     tableros.problema_con_covid as pcc1
       join public.person p on (p.id=pcc1.person_id)
       join public.gender g on (p.gender_id=g.id)
       left join tableros.pacientes_con_comorbilidad pcc on pcc1.patient_id=pcc.patient_id
   where
     not exists (
       select pcc2.id_consulta
       from tableros.problema_con_covid as pcc2
       where
         pcc1.id_consulta!=pcc2.id_consulta and
         pcc1.patient_id=pcc2.patient_id and
         pcc1.start_date between pcc2.start_date and pcc2.start_date + interval '14 day'
     )
   `,

  measures: Object.assign(
    {
      total: {
        sql: `identificador`,
        type: `count`,
        title: `Total`,
      },
      total_comorbilidad: {
        sql: `comorbilidad`,
        type: `count`,
        filters: [{ sql: `${CUBE}.comorbilidad is not null` }],
      },
    },

    statuses.reduce((all, status) => ({
      ...all,
      ...createTotalByStatusMeasure(status),
      //        ...createPercentageMeasure(status),
    }))
  ),
  dimensions: {
    Estado: {
      sql: `estado`,
      type: `string`,
    },
    comorbilidad: {
      sql: `comorbilidad`,
      type: `string`,
    },
    sexo: {
      sql: `sexo`,
      type: `string`,
    },
    paciente: {
      sql: `paciente`,
      type: `number`,
    },
  },
  title: ` `,
  dataSource: `default`,
})
