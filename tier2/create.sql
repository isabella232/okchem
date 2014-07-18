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
    ContactRecordID varchar,
    FirstName varchar,
    LastName varchar,
    ModificationDate varchar,
    Title varchar,
    DunAndBradstreet varchar
);

CREATE TABLE Tier2ChemicalsInInventory 
(
    Acute varchar,
    AveAmount varchar,
    AveAmountCode varchar,
    CFacilityRouteRecordID varchar,
    ChemInvRecordID varchar,
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
    MaxAmount varchar,
    MaxAmountCode varchar,
    MaxAmtContainer varchar,
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
    RecordKey varchar,
    FacilityRouteRecordID varchar,
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
    ContactRecordID varchar,
    OtherRecordID varchar,
    RecordKey varchar
);

CREATE TABLE Tier2Facilities
(
    DateSigned varchar,
    DikeOrOtherSafeguard varchar,
    FacilityDept varchar,
    FacilityName varchar,
    FacilityRecordID varchar,
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

CREATE TABLE Tier2FacilityIDs
(
    RecordKey varchar,
    FacilityRecordID varchar,
    Id varchar,
    Type varchar,
    Description varchar,
    LastModified varchar
);

CREATE TABLE Tier2Phone
(
    RecordKey varchar,
    ParentRecordID varchar,
    Phone varchar,
    Type varchar,
    PhLastModified varchar
);
