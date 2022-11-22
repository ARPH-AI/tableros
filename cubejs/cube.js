// Cube.js configuration options: https://cube.dev/docs/config
module.exports = {
  queryRewrite: (query, { securityContext }) => {
  // Tenemos en JWT `securityContext` `userId, userRole, userName`
  // Deberiamos agregar userDepartamento

    // if (!securityContext.userId) {
    //   throw new Error('No id found in Security Context!');
    // }

    // const cubeNames = [
    //   ...(query.dimensions || []),
    //   ...(query.measures || []),
    // ].map((e) => e.split('.')[0]);

    // const cubesFilter = [
    //   `casosComorbilidad`,
    //   `casosCovid`,
    //   `casosCovidPromSem`,
    //   `casos`,
    //   `CovidEdadSexoFem`,
    //   `CovidEdadSexo`,
    //   `CovidEdadSexoMasc`,
    // ]

    // const filterKey = `departamento`

    // if (cubesFilter.includes(cubeNames[0])) {
    //   if (!securityContext.userDepartamento) {
    //     throw new Error('No encontro departamento en Security Context!');
    //   }

    //   query.filters.push({
    //     member: `${cubeNames[0]}.${filterKey}`,
    //     operator: 'equals',
    //     values: [securityContext.userDepartamento],
    //   });
    // }

    return query
  },
  logger: (msg, params) => {
    console.log(`${msg}: ${JSON.stringify(params)}`)
  },
}
