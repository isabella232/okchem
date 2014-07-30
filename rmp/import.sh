#!/bin/bash

# Cleanup from previous runs
dropdb rmp

# Get psql ready
createdb rmp 

# Generate database schema
mdb-schema data/RMPData.mdb postgres > schema.sql

# mdbtools generates bool columns but integer values :(
sed -i '' "s/BOOL\ NOT\ NULL/INTEGER/" schema.sql

# mdbtools generates bad uniques on lots of indexes
sed -i '' "s/UNIQUE\ //" schema.sql

# mdbtools generates bad primary keys too
sed -i '' "/ALTER\ TABLE/d" schema.sql

cat schema.sql | psql -q rmp
#rm schema.sql

# Import order is important so FKs don't error
declare -a tables=(
    "tlkpAdminRefreshInfo"
    "tlkpChemicals"
    "tlkpCountyFIPSCodes"
    "tlkpDeregistrationReason"
    "tlkpDocType"
    "tlkpForeignCountry"
    "tlkpLatLongDescriptions"
    "tlkpLatLongMethods"
    "tlkpNAICS"
    "tlkpPhysicalStateCodes"
    "tlkpStateFIPSCodes"
    "tlkpTopographyCode"
    "tlkpWindSpeedUnitCodes"
    "tlkpDocHandle"
    "tlkpRejectReason"
    "tlkpSubmissionReasonCodes"

    "tblS1Facilities"
    # "tblS1Facilities_ChangeHistory"
    "tblS1Processes"
    # "tblS1Processes_ChangeHistory"
    # NB: This table has a bad index on NAICSCode
    # "tblS1Process_NAICS"
    # "tblS1Process_NAICS_ChangeHistory"
    "tblS1ProcessChemicals"
    # "tblS1ProcessChemicals_ChangeHistory"
    "tblS1FlammableMixtureChemicals"

    "tlkpS2ScenarioCodes"
    "tblS2ToxicsWorstCase"
    # "tblS2ToxicsWorstCase_ChangeHistory"
    
    "tblS3ToxicsAltReleases"
    # "tblS3ToxicsAltReleases_ChangeHistory"
    
    "tblS4FlammablesWorstCase"
    # "tblS4FlammablesWorstCase_ChangeHistory"
    
    "tblS5FlammablesAltReleases"
    # "tblS5FlammablesAltReleases_ChangeHistory"
    
    "tlkpS6InitiatingEvents"
    "tblS6AccidentHistory"
    # "tblS6AccidentHistory_ChangeHistory"
    "tblS6AccidentChemicals"
    # "tblS6AccidentChemicals_ChangeHistory"
    "tblS6FlammableMixtureChemicals"
    # "tblS6FlammableMixtureChemicals_ChangeHistory"
    
    "tblS7_Prevention_Program_Chemicals"
    # "tblS7_Prevention_Program_Chemicals_ChangeHistory"
    "tblS7PreventionProgram3"
    # "tblS7PreventionProgram3_ChangeHistory"
    # "tblS7PreventionProgram3Description_ChangeHistory"
    
    "tblS8_Prevention_Program_Chemicals"
    # "tblS8_Prevention_Program_Chemicals_ChangeHistory"
    "tblS8PreventionProgram2"
    # "tblS8PreventionProgram2_ChangeHistory"
    # "tblS8PreventionProgram2Description_ChangeHistory"
    
    "tblS9EmergencyResponses"
    # "tblS9EmergencyResponses_ChangeHistory"
    
    "tblExecutiveSummaries"
    # "tblExecutiveSummaries_ChangeHistory"

    # "tblRMPError"
    # "tblRMPTrack"
)

for table in "${tables[@]}"; do
    echo "Importing $table"
    mdb-export -I postgres -q \' data/RMPData.mdb "$table" | psql -q rmp
done
