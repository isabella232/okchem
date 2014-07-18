okchem
======

Notes: https://docs.google.com/document/d/1iyCDyMfhj6Awf4a7ERWDanzc2z0eh4-mSPW__iOZrTY/edit

Setup
-----

```
pip install requirements.txt
brew install mdbtools
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
