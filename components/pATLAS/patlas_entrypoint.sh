#!/bin/bash

if [ "$1" = "init_all" ]
then
    # Add database
    export PGPASSWORD=patlas
    psql -h db_patlas -U patlas patlas < plasmid_db_dev_final.sql

    # Run pATLAS service
    ./run.py patlas &

    # Required to continuously run docker container
    tail -f /dev/null
fi