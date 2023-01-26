#!/bin/bash
export $(grep -v '^#' .env | xargs)
PGPASSFILE=$PWD/.pgpass
psql -h 0.0.0.0 -U golang spotlas_data