SELECT AddGeometryColumn ('public', 'tier2facilities', 'geom', 4269, 'POINT', 2);

ALTER TABLE Tier2Facilities ADD COLUMN duns_id varchar;
UPDATE Tier2Facilities SET duns_id = id FROM Tier2FacilityIds WHERE Tier2FacilityIDs.FacilityRecordID = Tier2Facilities.FacilityRecordID and type = 'Dun & Bradstreet';

ALTER TABLE Tier2Facilities ADD COLUMN rmp_id varchar;
UPDATE Tier2Facilities SET rmp_id = id FROM Tier2FacilityIds WHERE Tier2FacilityIDs.FacilityRecordID = Tier2Facilities.FacilityRecordID and type = 'RMP';

ALTER TABLE Tier2Facilities ADD COLUMN naics_code varchar;
UPDATE Tier2Facilities SET naics_code = id FROM Tier2FacilityIds WHERE Tier2FacilityIDs.FacilityRecordID = Tier2Facilities.FacilityRecordID and type = 'NAICS';
