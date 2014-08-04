-- 451 total

SELECT DISTINCT "FacilityName" FROM most_recent
INNER JOIN "tblS1Processes" ON most_recent."FacilityID" = "tblS1Processes"."FacilityID"
INNER JOIN "tblS1ProcessChemicals" ON "tblS1Processes"."ProcessID" = "tblS1ProcessChemicals"."ProcessID"
INNER JOIN "tblS2ToxicsWorstCase" ON "tblS1ProcessChemicals"."ProcessChemicalID" = "tblS2ToxicsWorstCase"."ProcessChemicalID"
WHERE most_recent."FacilityState" = 'OK'
-- 323

UNION

SELECT DISTINCT "FacilityName" FROM most_recent
INNER JOIN "tblS1Processes" ON most_recent."FacilityID" = "tblS1Processes"."FacilityID"
INNER JOIN "tblS1ProcessChemicals" ON "tblS1Processes"."ProcessID" = "tblS1ProcessChemicals"."ProcessID"
INNER JOIN "tblS3ToxicsAltReleases" ON "tblS1ProcessChemicals"."ProcessChemicalID" = "tblS3ToxicsAltReleases"."ProcessChemicalID"
WHERE most_recent."FacilityState" = 'OK'
-- 323

UNION

SELECT DISTINCT "FacilityName" FROM most_recent
INNER JOIN "tblS1Processes" ON most_recent."FacilityID" = "tblS1Processes"."FacilityID"
INNER JOIN "tblS1ProcessChemicals" ON "tblS1Processes"."ProcessID" = "tblS1ProcessChemicals"."ProcessID"
INNER JOIN "tblS4FlammablesWorstCase" ON "tblS1ProcessChemicals"."ProcessChemicalID" = "tblS4FlammablesWorstCase"."ProcessChemicalID"
WHERE most_recent."FacilityState" = 'OK'
-- 138

UNION

SELECT DISTINCT "FacilityName" FROM most_recent
INNER JOIN "tblS1Processes" ON most_recent."FacilityID" = "tblS1Processes"."FacilityID"
INNER JOIN "tblS1ProcessChemicals" ON "tblS1Processes"."ProcessID" = "tblS1ProcessChemicals"."ProcessID"
INNER JOIN "tblS5FlammablesAltReleases" ON "tblS1ProcessChemicals"."ProcessChemicalID" = "tblS5FlammablesAltReleases"."ProcessChemicalID"
WHERE most_recent."FacilityState" = 'OK'
-- 103

-- 451 in union
