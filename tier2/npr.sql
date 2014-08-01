SELECT AddGeometryColumn ('public', 'tier2facilities', 'geom', 4269, 'POINT', 2);

ALTER TABLE Tier2Facilities ADD COLUMN duns_id varchar;
UPDATE Tier2Facilities SET duns_id = id FROM Tier2FacilityIds WHERE Tier2FacilityIDs.FacilityRecordID = Tier2Facilities.FacilityRecordID and type = 'Dun & Bradstreet' and Id <> '';

ALTER TABLE Tier2Facilities ADD COLUMN rmp_id varchar;
UPDATE Tier2Facilities SET rmp_id = id FROM Tier2FacilityIds WHERE Tier2FacilityIDs.FacilityRecordID = Tier2Facilities.FacilityRecordID and type = 'RMP' and Id <> '';

ALTER TABLE Tier2Facilities ADD COLUMN naics_code varchar;
UPDATE Tier2Facilities SET naics_code = id FROM Tier2FacilityIds WHERE Tier2FacilityIDs.FacilityRecordID = Tier2Facilities.FacilityRecordID and type = 'NAICS' and Id <> '';

CREATE VIEW no_oil AS SELECT * FROM tier2facilities WHERE "naics_code" NOT LIKE '21%' AND "naics_code" NOT LIKE '22%' AND "naics_code" != '454312' AND "naics_code"NOT LIKE '48611%';

ALTER TABLE Tier2ChemicalsInInventory ADD COLUMN aveamount_from_code integer;
UPDATE Tier2ChemicalsInInventory SET aveamount_from_code =
    CASE
        WHEN aveamountcode::integer = 1 THEN 50
        WHEN aveamountcode::integer = 2 THEN 250
        WHEN aveamountcode::integer = 3 THEN 750
        WHEN aveamountcode::integer = 4 THEN 2500
        WHEN aveamountcode::integer = 5 THEN 7500
        WHEN aveamountcode::integer = 6 THEN 17500
        WHEN aveamountcode::integer = 7 THEN 37500
        WHEN aveamountcode::integer = 8 THEN 62500
        WHEN aveamountcode::integer = 9 THEN 87500
        WHEN aveamountcode::integer = 10 THEN 300000
        WHEN aveamountcode::integer = 11 THEN 750000
        WHEN aveamountcode::integer = 12 THEN 5500000
        WHEN aveamountcode::integer = 13 THEN 10000000
    END;
