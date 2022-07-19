cube(`CovidEdadSexoSNVS`, {
  sql: `select snvs.id_evento_caso,snvs.fecha_apertura ,snvs.edad,snvs.sexo,(case when grupo_edad.descripcion is null then 'v' else grupo_edad.descripcion end) as grupo_edad,snvs.residencia_departamento_nombre as ciudad,se.numero_semana
  from tableros.snvs right outer join tableros.grupo_edad on (snvs.edad = grupo_edad.id)
  right outer join tableros.semana_epidemiologica se on (se.fecha=snvs.fecha_apertura) `,

  measures: {
    id_evento_caso: {
        sql: `id_evento_caso`,
        type: `count`,
        title: ` `,
    }
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
  }
  },
  title:` `,
  dataSource: `default`
});
