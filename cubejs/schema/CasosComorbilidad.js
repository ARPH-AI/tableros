cube(`casosComorbilidad`, {
  sql: `select ROW_NUMBER () OVER (ORDER BY pcc1.id_consulta) as identificador, pcc.patient_id,pcc.comorbilidad,pcc1.description as estado,g.description as sexo
  from tableros.problema_con_covid as pcc1 join public.person p on (p.id=pcc1.person_id) join public.gender g on (p.gender_id=g.id), tableros.pacientes_con_comorbilidad pcc
   where pcc1.patient_id=pcc.patient_id and not exists (select pcc2.id_consulta from tableros.problema_con_covid as pcc2 where pcc1.id_consulta!=pcc2.id_consulta and pcc1.patient_id=pcc2.patient_id and pcc1.start_date between pcc2.start_date and pcc2.start_date + interval '14 day' )
   `,

  measures: {
    id_comorbilidad: {
        sql: `identificador`,
        type: `count`,
        title: `Comorbilidad`,
        description: `  `,
    }
  },

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
      }
  },
  title:` `,
  dataSource: `default`
});
