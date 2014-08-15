SELECT Tier2Facilities.FacilityName, count(Tier2ChemicalsInInventory.cicas) as count_chemicals
FROM Tier2Facilities
JOIN Tier2ChemicalsInInventory
    ON Tier2ChemicalsInInventory.CFacilityRouteRecordID = Tier2Facilities.FacilityRecordID
    WHERE Tier2ChemicalsInInventory.cicas IN (SELECT cas FROM ehs)
    GROUP BY Tier2Facilities.FacilityName
    ORDER BY count_chemicals DESC
