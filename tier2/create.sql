CREATE TABLE Tier2Contacts 
(
    CoEmail varchar,
    CoMailAddress varchar,
    CoMailCity varchar,
    CoMailCountry varchar,
    CoMailState varchar,
    CoMailZip varchar,
    Contact1Type varchar,
    Contact2Type varchar,
    Contact3Type varchar,
    Contact4Type varchar,
    ContactRecordID varchar,    -- PRIMARY KEY, CTTR*
    FirstName varchar,
    LastName varchar,
    ModificationDate varchar,
    Title varchar,
    DunAndBradstreet varchar
);

CREATE TABLE Tier2ChemicalsInInventory 
(
    Acute varchar,
    AveAmount float,
    AveAmountCode varchar,
    CFacilityRouteRecordID varchar, -- to Tier2Facilities, FATR*
    ChemInvRecordID varchar,        -- PRIMARY KEY, CVTR*
    ChemSameAsLastYr varchar,
    Chronic varchar,
    CiCAS varchar,
    CiEHSChemical varchar,
    CiLastModified varchar,
    DaysOnSite varchar,
    EnteredChemName varchar,
    Fire varchar,
    Gas varchar,
    Liquid varchar,
    MaxAmount float,
    MaxAmountCode varchar,
    MaxAmtContainer float,
    Mixture varchar,
    Pressure varchar,
    Pure varchar,
    Reactive varchar,
    Solid varchar,
    State01Checkbox varchar,
    State01Number varchar,
    State01Text varchar,
    State02Checkbox varchar,
    State02Number varchar,
    State02Text varchar,
    State03Checkbox varchar,
    State03Number varchar,
    State03Text varchar,
    State04Checkbox varchar,
    State04Text varchar,
    State05Checkbox varchar,
    State05Text varchar,
    State06Checkbox varchar,
    State06Text varchar,
    State07Checkbox varchar,
    State07Text varchar,
    State1ContactField varchar,
    StateLabelCode varchar,
    TradeSecret varchar,
    State04Number varchar,
    BelowReportingThresholds varchar,
    ConfidentialStorageLocs varchar
);

CREATE TABLE Tier2ChemInvMixtures
(
    RecordKey varchar,              -- PRIMARY KEY, CMTR*
    FacilityRouteRecordID varchar,  -- ????, ==FATR*
    ChemInvRecID varchar,
    MxChem varchar,
    MxCAS varchar,
    Percentage varchar,
    WtVol varchar,
    MxEHS varchar,
    MxLastModified varchar,
    MxMaxAmountCode varchar
);

CREATE TABLE Tier2ContactsLink
(
    ContactRecordID varchar,    -- to Tier2Contacts, CTTR*
    OtherRecordID varchar,      -- to Tier2Facilities, FATR*
    RecordKey varchar           -- PRIMARY KEY, CKTR*
);

CREATE TABLE Tier2Facilities
(
    DateSigned varchar,
    DikeOrOtherSafeguard varchar,
    FacilityDept varchar,
    FacilityName varchar,
    FacilityRecordID varchar,   -- PRIMARY KEY, FATR*
    FailedValidation varchar,
    FCity varchar,
    FCountry varchar,
    FCounty varchar,
    FDateModified varchar,
    FeesTotal varchar,
    FMailAddress varchar,
    FMailCity varchar,
    FMailCountry varchar,
    FMailState varchar,
    FMailZip varchar,
    FNotes varchar,
    FState varchar,
    FStreetAddress varchar,
    FZip varchar,
    Latitude varchar,
    Longitude varchar,
    ReportYear varchar,
    SiteCoordAbbrev varchar,
    SiteMap varchar,
    State01Checkbox varchar,
    State01Number varchar,
    State01Text varchar,
    State02Checkbox varchar,
    State02Number varchar,
    State02Text varchar,
    State03Checkbox varchar,
    State03Number varchar,
    State03Text varchar,
    State04Checkbox varchar,
    State04Text varchar,
    State05Checkbox varchar,
    State05Text varchar,
    State06Checkbox varchar,
    State06Text varchar,
    State07Checkbox varchar,
    State07Text varchar,
    State08Text varchar,
    StateLabelCode varchar,
    SubmittedBy varchar,
    ValidationReport varchar,
    FFireDistrict varchar,
    State08Checkbox varchar,
    State09Checkbox varchar,
    State01Date varchar,
    State02Date varchar,
    Manned_Y varchar,
    Manned_N varchar,
    SubjectToChemAccidentPrevention_Y varchar,
    SubjectToChemAccidentPrevention_N varchar,
    SubjectToEmergencyPlanning_Y varchar,
    SubjectToEmergencyPlanning_N varchar,
    MaxNumOccupants varchar,
    FacilityInfoSameAsLastYear varchar
);

-- SIC, Dun & Brads and NAICS numbers
CREATE TABLE Tier2FacilityIDs
(
    RecordKey varchar,              -- PRIMARY KEY, FDTR*
    FacilityRecordID varchar,       -- to Tier2Facilities, FATR*
    Id varchar,                     -- the 3rd party id
    Type varchar,
    Description varchar,
    LastModified varchar
);

CREATE TABLE Tier2Phone
(
    RecordKey varchar,              -- PRIMARY KEY, PHTR*
    ParentRecordID varchar,         -- to Tier2Contacts, CTTR*
    Phone varchar,
    Type varchar,
    PhLastModified varchar
);
