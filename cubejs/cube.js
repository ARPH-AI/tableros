// Cube.js configuration options: https://cube.dev/docs/config
module.exports = {
  queryRewrite: (query, { securityContext }) => {
  // Ensure `securityContext` has an `userId` property
/*
    if (!securityContext.userId) {
      throw new Error('No id found in Security Context!');
    }

    query.filters.push({
       member: 'Orders.userId',
       operator: 'equals',
       values: [securityContext.user_id],
    });
*/
     return query;
   },

}
