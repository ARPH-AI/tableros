// Cube.js configuration options: https://cube.dev/docs/config
module.exports = {
  queryRewrite: (query, { securityContext }) => {
   // Tenemos en JWT `securityContext` `userId, userRole, userName, userDepartament`
   if (!securityContext.userId) {
      throw new Error('No id found in Security Context!');
    }

    if (!securityContext.userRole) {
      throw new Error('No role found in Security Context!');
    }

    const validRoles = [ 'PERFIL_EPIDEMIO_MESO', 'PERFIL_EPIDEMIO_INSTITUCION']
    if (!validRoles.includes(securityContext.userRole)) {
      throw new Error('No valid role found in Security Context!');
    }

    if (securityContext.userRole == 'PERFIL_EPIDEMIO_INSTITUCION') {

      if (!securityContext.userDepartment) {
        throw new Error('No encontro departamento en Security Context!');
      }

      const cubeNames = [
        ...(query.dimensions || []),
        ...(query.measures || []),
      ].map((e) => e.split('.')[0]);

      const cubesFilter = [
        `casosComorbilidad`,
        `casosEnfermedad`,
        `casosCovidPromSem`,
        `casos`,
        `EnfermedadEdadSexoFem`,
        `EnfermedadEdadSexo`,
        `EnfermedadEdadSexoMasc`,
        `CovidEdadSexoMascSNVS`,
        `CovidEdadSexoFemSNVS`,
        `CovidEdadSexoSNVS`,
        `casosCovidPromSemSNVS`,
        `casosFebriles`,
        `casosDenguePromSem`,
        `casosDenguePromSemSNVS`,
        `DengueEdadSexoFemSNVS`,
        `DengueEdadSexoMascSNVS`,
        `DengueEdadSexoSNVS`
      ]

      const cubesFilterMap = [
        `CovidEdadSexoSNVS.Ciudad`,
        `DengueEdadSexoSNVS.Ciudad`,
        `casos.ciudad`,
      ]
      const cubeDimensions = [
        ...(query.measures || []),
      ]

      const filterKey = `departamento`
      if (cubesFilter.includes(cubeNames[0])) {
        if ( !cubeDimensions || !cubesFilterMap.includes(cubeDimensions[0])) {
          query.filters.push({
            member: `${cubeNames[0]}.${filterKey}`,
            operator: 'equals',
            values: [securityContext.userDepartment],
          });
        }
      }
    }

    return query
  },
  logger: (msg, params) => {
    console.log(`${msg}: ${JSON.stringify(params)}`)
  },
}
