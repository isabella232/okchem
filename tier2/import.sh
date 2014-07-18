#!/bin/bash

# Cleanup from previous runs
rm -r temp 
dropdb tier2

# Temp dir
mkdir temp

# Get psql ready
createdb tier2
cat create.sql | psql -q tier2

# Loop over original files
for path in data/*.mer
do
    filename=$(basename "$path")
    extension="${filename##*.}"
    slug="${filename%.*}"

    ./clean.py $path temp/$slug.csv
    in2csv -e latin1 temp/$slug.csv > temp/$slug.utf8.csv

    psql -q tier2 -c "COPY $slug FROM '`pwd`/temp/$slug.utf8.csv' DELIMITER ',' CSV;"
done

