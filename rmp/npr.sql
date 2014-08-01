SELECT AddGeometryColumn ('public', 'tblS1Facilities', 'geom', 4269, 'POINT', 2);

UPDATE "tblS1Facilities" SET geom = ST_SetSRID(ST_MakePoint("FRS_Long", "FRS_Lat"), 4269);