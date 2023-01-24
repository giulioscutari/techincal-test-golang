#!/bin/bash
export $(grep -v '^#' .env | xargs)
docker exec -i techincal-test-golang_postgis_1 psql -U $POSTGRES_USER -d $POSTGRES_DB < spots.sql