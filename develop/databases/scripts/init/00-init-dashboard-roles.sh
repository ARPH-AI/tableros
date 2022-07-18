#!/bin/bash

set -e
echo "########### Creating ROLES with $POSTGRES_USER ###########"

psql -t -A -U $POSTGRES_USER -d $POSTGRES_DB -c "
  CREATE ROLE postgres WITH SUPERUSER;
"
