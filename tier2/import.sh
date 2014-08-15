#!/bin/bash

# Cleanup from previous runs
rm -r temp

# Temp dir
mkdir temp

# Get psql ready
createdb okchem
psql -q okchem -c "create extension postgis"
cat create.sql | psql -q okchem

# Loop over original files
for path in data/*.mer
do
    filename=$(basename "$path")
    extension="${filename##*.}"
    slug="${filename%.*}"

    echo 'loading $filename'

    ./clean.py $path temp/$slug.csv
    in2csv -e latin1 temp/$slug.csv > temp/$slug.utf8.csv

    # Trim header
    tail -n +2 "temp/$slug.utf8.csv" > temp/$slug.headless.utf8.csv

    psql -q okchem -c "COPY $slug FROM '`pwd`/temp/$slug.headless.utf8.csv' DELIMITER ',' CSV;"
done

cat npr.sql | psql -q okchem

psql -q okchem -c "COPY ehs FROM '`pwd`/ehs.csv' DELIMITER ',' CSV;"
