SELECT Tier2Facilities.FacilityName, Tier2Facilities.FacilityRecordID, sum(Tier2ChemicalsInInventory.aveamount_from_code) as sum_AveAmount
FROM Tier2Facilities
JOIN Tier2ChemicalsInInventory
    ON Tier2ChemicalsInInventory.CFacilityRouteRecordID = Tier2Facilities.FacilityRecordID
WHERE Tier2ChemicalsInInventory.aveamount_from_code IS NOT NULL
GROUP BY Tier2Facilities.FacilityName, Tier2Facilities.FacilityRecordID
ORDER BY sum_AveAmount DESC
LIMIT 20;