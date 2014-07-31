#!/bin/bash

# Cleanup from previous runs
rm -r temp
dropdb tier2

# Temp dir
mkdir temp

# Get psql ready
createdb tier2
psql -q tier2 -c "create extension postgis"
cat create.sql | psql -q tier2

# Loop over original files
for path in data/*.mer
do
    filename=$(basename "$path")
    extension="${filename##*.}"
    slug="${filename%.*}"

    ./clean.py $path temp/$slug.csv
    in2csv -e latin1 temp/$slug.csv > temp/$slug.utf8.csv

    # Trim header
    tail -n +2 "temp/$slug.utf8.csv" > temp/$slug.headless.utf8.csv

    psql -q tier2 -c "COPY $slug FROM '`pwd`/temp/$slug.headless.utf8.csv' DELIMITER ',' CSV;"
done

psql -q tier2 -c "SELECT AddGeometryColumn ('public', 'tier2facilities', 'geom', 4269, 'POINT', 2);"
