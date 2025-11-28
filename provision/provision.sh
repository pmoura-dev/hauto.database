#!/bin/bash

SERVICES_FILE=services.conf

while IFS=: read -r schema user password || [[ -n "$schema" ]]; do
    [[ -z "$schema" || "$schema" =~ ^# ]] && continue

    (
        export SCHEMA=$schema
        export USER=$user
        export PASSWORD=$password

        envsubst < templates/new_schema.sql | psql -U $POSTGRES_USER -d $POSTGRES_DB -a
    )

done < "$SERVICES_FILE"
