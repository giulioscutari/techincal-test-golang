#!/bin/bash
export $(grep -v '^#' .env | xargs)
docker exec -i backend-developer-test_postgis_1 psql -U $POSTGRES_USER -d $POSTGRES_DATABASE < spots.sql