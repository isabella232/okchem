okchem
======

Notes: https://docs.google.com/a/npr.org/document/d/1AShfA79Q96-PAoUxtYEYYsI4BBlBcdcW_kg-J7Gty00/edit#

Setup
-----

```
# Install requirements
pip install requirements.txt
brew install mdbtools

# Start postgres
pgup
```

Tier2
-----

Unzip the `.mer` data files into `tier2/data`.

Import the data into psql:

```
cd tier2
./import.sh
```

RMP
---

Unzip the RMP data and move the `*.mdb` files into `rmp/data`.

Import the data into psql:

```
cd rmp
./import.sh
```
