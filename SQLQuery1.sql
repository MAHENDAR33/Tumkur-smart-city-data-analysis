
----1]TOTAL NUMBER OF WARDS===31----
SELECT 
    COUNT(DISTINCT[Ward  No ] ) AS TotalWards
FROM 
    [dbo].[D06-CommunityFacilities_10];
-------                    ----------
SELECT [Ward  No ],
    COUNT(*) AS TotalWards
FROM 
    [dbo].[D06-CommunityFacilities_10]
	GROUP BY [Ward  No ]
-----2]TOTAL ZONENAME==1---------
	SELECT 
    COUNT(DISTINCT [Zone Name]) AS TotalZONE
FROM 
    [dbo].[D06-CommunityFacilities_10];
----------            -----------
	SELECT [Zone Name],
    COUNT(*) AS TotalWards
FROM 
    [dbo].[D06-CommunityFacilities_10]
	GROUP BY [Zone Name]
------3]TOTAL SPOTS==6--------
SELECT 
    COUNT(DISTINCT [Type  Community Hall   Auditorium   Convention Center   Swimming Pools   Sports Ground   Theatre]) AS TotalSPOTS
FROM 
    [dbo].[D06-CommunityFacilities_10];
------------              ---------------
SELECT [Type  Community Hall   Auditorium   Convention Center   Swimming Pools   Sports Ground   Theatre],
    COUNT(*) AS TotalWards
FROM 
    [dbo].[D06-CommunityFacilities_10]
	GROUP BY [Type  Community Hall   Auditorium   Convention Center   Swimming Pools   Sports Ground   Theatre]
---------TOTAL FACILITYNAMES=80-------
SELECT 
    COUNT(DISTINCT [Facility Name]) AS TotalFACILITYNAME
FROM 
    [dbo].[D06-CommunityFacilities_10];
---------                  -------
	SELECT [Facility Name],
    COUNT(*) AS TotalNUMBERS
FROM 
    [dbo].[D06-CommunityFacilities_10]
	GROUP BY [Facility Name]
--------TOTAL CAPACITY=24----------
	SELECT 
    COUNT(DISTINCT[Capacity (wherever applicable)] ) AS TotalCAPACITY
FROM 
    [dbo].[D06-CommunityFacilities_10];

-----             -----------
SELECT [Capacity (wherever applicable)],
    COUNT(*) AS TotalNUMBERS
FROM 
    [dbo].[D06-CommunityFacilities_10]
	GROUP BY [Capacity (wherever applicable)]

----------TOTAL CITY=1---------
SELECT 
    COUNT(DISTINCT[City Name] ) AS TotalCITYNAME
FROM 
    [dbo].[D06-CommunityFacilities_10];

SELECT[Facility Name],[Capacity (wherever applicable)] FROM [dbo].[D06-CommunityFacilities_10]


SELECT * FROM [dbo].[D01-CityProfile_30]

CREATE VIEW CITYPROFILEWITHCOMMUNITYFACULTYVIEW2 AS
SELECT 
CF.[City Name],
CF.[Ward  No ],
CP.[Area (in sq km)],
CP.[Total Population (in thousands)],
CF.[Type  Community Hall   Auditorium   Convention Center   Swimming Pools   Sports Ground   Theatre],
CF.[Facility Name],
CF.[Capacity (wherever applicable)]
FROM 
[dbo].[D06-CommunityFacilities_10] CF
INNER JOIN
[dbo].[D01-CityProfile_30] CP 
ON CF.[Zone Name]=CP.[Zone Name]


SELECT [Zone Name] FROM [dbo].[D06-CommunityFacilities_10]

SELECT 
    REPLACE([Ward No ], 'Ward', '') AS WardNumber
FROM 
    [dbo].[D01-CityProfile_30];
SELECT  
    [Ward Name] 
FROM 
    [dbo].[D01-CityProfile_30];
UPDATE [dbo].[D01-CityProfile_30]
SET [Ward Name] = REPLACE([Ward Name], 'Ward', '');
SELECT [Facility Name], COUNT(*) FROM [dbo].[D06-CommunityFacilities_10]
SELECT * FROM [dbo].[CITYPROFILEWITHCOMMUNITYFACULTYVIEW2]

 SELECT [Ward Name],[Area (in sq km)],[Total Population (in thousands)] FROM[dbo].[D01-CityProfile_30]
 SELECT
 P.[Ward No ],
 F.[Ward  No ]
 FROM
[dbo].[D01-CityProfile_30] P
INNER JOIN
[dbo].[D06-CommunityFacilities_10] F
ON F.[Ward Name]=P.[Ward Name]
SELECT [Ward Name] FROM[dbo].[D06-CommunityFacilities_10]
SELECT [Ward Name] FROM [dbo].[D01-CityProfile_30]
SELECT [Ward Name] FROM[dbo].[ZD03-Households_tumakuru_2]
SELECT 
P.[Ward Name],
P.[Ward No ],
F.[Ward Name],
F.[Ward  No ]
FROM[dbo].[D01-CityProfile_30] P
INNER JOIN
[dbo].[D06-CommunityFacilities_10] F
ON 
P.[City Name]=F.[City Name]

SELECT [Ward No] FROM[dbo].['D07-CitizenFacilitationCenters_']
SELECT [Ward No ] FROM [dbo].[D23-Roads_tumakuru]
SELECT [Ward Name] FROM[dbo].[D24-StreetLights_11]
SELECT[City Name]FROM[dbo].[D24-StreetLights_11]
SELECT[Number of Poles]FROM[dbo].[D24-StreetLights_11]
SELECT[No  of streets with adequate street lighting facilties]FROM[dbo].[D24-StreetLights_11]
SELECT [Name of heritage]FROM[dbo].[D31-CulturalHeritage_15_1]
SELECT [ monuments]FROM[dbo].[D31-CulturalHeritage_15_1]
SELECT[Age of heritage (in Years)]FROM[dbo].[D31-CulturalHeritage_15_1]
---------------------------1]CITY PROFILE---------------------------------------------
SELECT* FROM [dbo].[D01-CityProfile_30]
--------------WHICH WARD HAS MAXPOPULATION---------
CREATE VIEW MAXPOPULATION AS
SELECT [City Name],[Zone Name],[Ward Name],[Ward No ],[Area (in sq km)],[Total Population (in thousands)]
FROM [dbo].[D01-CityProfile_30]
WHERE [Total Population (in thousands)]=(SELECT MAX([Total Population (in thousands)])
FROM[dbo].[D01-CityProfile_30])
SELECT * FROM MAXPOPULATION
-----------WHICH WARD HAS MAXAREA---------
CREATE VIEW MAXAREA AS
SELECT [Area (in sq km)],[City Name],[Zone Name],[Ward Name],[Ward No ],[Total Population (in thousands)]
FROM [dbo].[D01-CityProfile_30]
WHERE[Area (in sq km)]=(SELECT MAX([Area (in sq km)])
FROM[dbo].[D01-CityProfile_30])
SELECT * FROM MAXAREA
-------------TOTAL POPULATION IN CITY-------------
CREATE VIEW POPULATIONOFCITY AS
SELECT[City Name],  SUM(CAST([Total Population (in thousands)] AS INT)) AS TotalPopulation, 
SUM(CAST([Population - Male (in thousands)] AS INT)) AS TAOTALMALEPOPULATION, 
SUM(CAST([Population - female (in thousands)] AS INT)) AS TOTALFEMALEPOPULATION
FROM [dbo].[D01-CityProfile_30]
GROUP BY [City Name]
SELECT * FROM POPULATIONOFCITY
------------------------------------------------
--------------2]Households_tumakuru--------------
SELECT * FROM[dbo].[D03-Households_tumakuru_2]
ALTER TABLE [dbo].[D03-Households_tumakuru_2]
DROP COLUMN [Column 5],[Column 6],[Column 7],[Column 8],[Column 9],[Column 10],[Column 11],[Column 12],[Column 13],[Column 14],[Column 15],[Column 16],[Column 17],
[Column 18],[Column 19]
---------------TOTALNUMBEROFHOUSE-------------
CREATE VIEW TOTALHOUSES AS
SELECT [City Name], SUM(CAST([Total no  of Households] AS INT)) AS TOTALHOUSES
FROM [dbo].[D03-Households_tumakuru_2]
GROUP BY [City Name]
SELECT * FROM TOTALHOUSES
----------------WHICH WARD HAS HIGHESTNUMBEROFHOUSE------------
CREATE VIEW WHICHWARDHASHIGHESTHOUSES AS
SELECT [City Name],[Zone Name],[Ward Name],[Total no  of Households]FROM[dbo].[D03-Households_tumakuru_2]
WHERE [Total no  of Households]=(SELECT MAX([Total no  of Households]) FROM [dbo].[D03-Households_tumakuru_2])
SELECT * FROM WHICHWARDHASHIGHESTHOUSES
--------------------------------------------------------------------------------------------------
-----------------------3]community faculty-------------------------
SELECT * FROM[dbo].[D04-Environment_TUMAKURU_1]
select * from[dbo].[D06-CommunityFacilities_10]
select [Facility Name],[Capacity (wherever applicable)]
from [dbo].[D06-CommunityFacilities_10]
where [Capacity (wherever applicable)]=(select max([Capacity (wherever applicable)]) from [dbo].[D06-CommunityFacilities_10])

---------------------------------CLEANEDCAPACITY IN FACILITIES--------------------------
CREATE VIEW CLEANEDCAPACITY AS
SELECT
    [City Name],
    [Zone Name],
    [Ward  No ],
    [Type  Community Hall   Auditorium   Convention Center   Swimming Pools   Sports Ground   Theatre],
    [Facility Name],
    CASE
        -- Handle ranges like '300-500' by taking the average (you can also take lower/upper if needed)
        WHEN [Capacity (wherever applicable)] LIKE '%-%' THEN 
            (CAST(LEFT([Capacity (wherever applicable)], CHARINDEX('-', [Capacity (wherever applicable)]) - 1) AS INT) + 
             CAST(RIGHT([Capacity (wherever applicable)], LEN([Capacity (wherever applicable)]) - CHARINDEX('-', [Capacity (wherever applicable)])) AS INT)) / 2
        -- Handle numeric values
        WHEN ISNUMERIC([Capacity (wherever applicable)]) = 1 THEN CAST([Capacity (wherever applicable)] AS INT)
        -- Handle non-numeric values (NA, text) by setting them to NULL or a default value
        ELSE NULL
    END AS CapacityInt
FROM 
    [dbo].[D06-CommunityFacilities_10];
--------------------------------------------------------------------------------------
SELECT * FROM[dbo].['D07-CitizenFacilitationCenters_']







select CapacityInt from [dbo].[D06-CommunityFacilities_10]
UPDATE [dbo].[D06-CommunityFacilities_10]
SET[Capacity (wherever applicable)] = REPLACE([Capacity (wherever applicable)], CapacityInt);

WITH CapacityCTE AS (
    SELECT 
        CF.[Capacity (wherever applicable)],
        -- Calculate CapacityInt based on existing logic
        CASE
            -- Handle ranges like '300-500' by taking the average
            WHEN CF.[Capacity (wherever applicable)] LIKE '%-%' THEN 
                (CAST(LEFT(CF.[Capacity (wherever applicable)], CHARINDEX('-', CF.[Capacity (wherever applicable)]) - 1) AS INT) + 
                 CAST(RIGHT(CF.[Capacity (wherever applicable)], LEN(CF.[Capacity (wherever applicable)]) - CHARINDEX('-', CF.[Capacity (wherever applicable)])) AS INT)) / 2
            -- Handle numeric values
            WHEN ISNUMERIC(CF.[Capacity (wherever applicable)]) = 1 THEN 
                CAST(CF.[Capacity (wherever applicable)] AS INT)
            -- Handle non-numeric values (NA, text) by setting them to NULL
            ELSE NULL
        END AS CapacityInt,
        CF.[PrimaryKey] -- Include the primary key for updating
    FROM 
        dbo.D06-CommunityFacilities_10 CF
)
UPDATE D
SET D.[Capacity (wherever applicable)] = C.CapacityInt
FROM dbo.D06-CommunityFacilities_10 D
INNER JOIN CapacityCTE C ON D.[PrimaryKey] = C.[PrimaryKey];  -- Use the correct primary key for joining

--------------------------------------------4]CitizenFacilitationCenters-----------------------------
SELECT*FROM [dbo].['D07-CitizenFacilitationCenters_']
WHERE[Facilities for Specially Abled Person available (Yes / No)]='Yes',
where[Drinking Water available (Yes / No)]='Yes',
where[Self Service Kiosk Available (Yes / No)]='Yes',
where[Wi-Fi Availability (Yes / No)]='Yes',
where[Queue Management System available (Yes / No)]='Yes',
where[HelpDesk Services available (Yes / No)]='Yes'


-----------------facilityavailable------------
create view citizenfacilityavailable as
select[City Name],[Zone Name],[Ward Name],[Staff Count - Deployed],[Total No# Citizen Services available],[Drinking Water available (Yes / No)],
[Digital Payments Modes and Channels available (Yes / No)],[Queue Management System available (Yes / No)],[HelpDesk Services available (Yes / No)]
from[dbo].['D07-CitizenFacilitationCenters_']
----------------facilityunavailable------------
create view citizenunavailablefacility as
select
[City Name],
[Zone Name],
[Ward Name],
[Staff Count - Deployed],
[Total No# Citizen Services available],
[Facilities for Specially Abled Person available (Yes / No)],
[Self Service Kiosk Available (Yes / No)],
[Wi-Fi Availability (Yes / No)]
from
[dbo].['D07-CitizenFacilitationCenters_']
------------------------------------------------------------------------------
-------------5]mortalityrate2013to2018--------------
create view mortalityrate as
SELECT 
    [City Name],
    (CAST([Total No  of Live Births (in Thousands)-2013-14] AS INT) +
     CAST([Total No  of Live Births (in Thousands)-2014-15] AS INT) +
     CAST([Total No  of Live Births (in Thousands)-2015-16] AS INT) +
     CAST([Total No  of Live Births (in Thousands)-2017-18] AS INT)) 
    AS totalbirthsfrom2013to2018,
	(cast([No  of Deaths - Total (in Thousands)-2013-14] as int)+
	cast([No  of Deaths - Total (in Thousands)-2014-15] as int)+
	cast([No  of Deaths - Total (in Thousands)-2015-16] as int)+
	cast([No  of Deaths - Total (in Thousands)-2016-17] as int)+
	cast([No  of Deaths - Total (in Thousands)-2017-18] as int))
	as  totaldeathsfrom2013to2018
FROM [dbo].[D09-Mortality_tumakuru_1]
select * from mortalityrate

---------------------------------------------------------------------------------
----------------------totalbirths and deaths from 2013 to 2017----------------------------
create view births_and_deaths as
SELECT 
    [City Name],
    (CAST([Total No  of Live Births (in Thousands)-2013-14] AS INT) +
     CAST([Total No  of Live Births (in Thousands)-2014-15] AS INT) +
     CAST([Total No  of Live Births (in Thousands)-2015-16] AS INT) +
     CAST([Total No  of Live Births (in Thousands)-2017-18] AS INT)) 
    AS total_births_from_2013to2017,
	(cast([No  of Deaths - Total (in Thousands)-2013-14] as int)+
	cast([No  of Deaths - Total (in Thousands)-2014-15] as int)+
	cast([No  of Deaths - Total (in Thousands)-2015-16] as int)+
	cast([No  of Deaths - Total (in Thousands)-2016-17] as int)+
	cast([No  of Deaths - Total (in Thousands)-2017-18] as int))
	as  totaldeathsfrom2013to2017,
	(cast([No  of Deaths - Male (in Thousands)-2013-14] as int)+
	cast([No  of Deaths - Male (in Thousands)-2014-15] as int)+
	cast([No  of Deaths - Male (in Thousands)-2015-16] as int)+
	cast([No  of Deaths - Male (in Thousands)-2016-17]as int)+
	cast([No  of Deaths - Male (in Thousands)-2017-18]as int))
	as total_male_deaths_2013to2017,
	(cast([No  of Deaths - Female (in Thousands)-2013-14]as int)+
	cast([No  of Deaths - Female (in Thousands)-2014-15] as int)+
	cast([No  of Deaths - Female (in Thousands)-2015-16]as int)+
	cast([No  of Deaths - Female (in Thousands)-2016-17] as int)+
	cast([No  of Deaths - Female (in Thousands)-2017-18] as int))
	as total_female_deaths_2013to2017,
	(cast([No  of Deaths - Infants (0-1 year) (in Thousands)-2013-14] as int)+
	cast([No  of Deaths - Infants (0-1 year) (in Thousands)-2014-15] as int)+
	cast([No  of Deaths - Infants (0-1 year) (in Thousands)-2015-16] as int)+
	cast([No  of Deaths - Infants (0-1 year) (in Thousands)-2016-17] as int)+
	cast([No  of Deaths - Infants (0-1 year) (in Thousands)-2017-18] as int))
	as total_infant_deaths_2013to2017,
	(
	coalesce(try_cast([No  of Deaths - Children (1-5 years) (in Thousands)-2013-14] as int),3)+
	COALESCE(try_cast(["No  of Deaths - Children (1-5 years) (in Thousands)-2014-15"] as int),3)+
	COALESCE(try_cast(["No  of Deaths - Children (1-5 years) (in Thousands)-2015-16"] as int),2)+
	COALESCE(try_cast(["No  of Deaths - Children (1-5 years) (in Thousands)-2017-18"] as int),1)+
	COALESCE(try_cast(["No  of Deaths - Children (1-5 years) (in Thousands)-2017-18"] as int),2)
	)
	as total_children_1to5_deaths_2013to2017,
	(cast([No  of Deaths - age above 5 years (in Thousands)-2013-14] as int)+
	cast(["No  of Deaths - age above 5 years  (in Thousands)-2014-15"] as int)+
	cast(["No  of Deaths - age above 5 years  (in Thousands)-2015-16"] as int)+
	cast(["No  of Deaths - age above 5 years  (in Thousands)-2016-17"] as int)+
	cast(["No  of Deaths - age above 5 years  (in Thousands)-2017-18"] as int))
	as total_age_above_5years_death_2013to1017
FROM [dbo].[D09-Mortality_tumakuru_1]
-----------------------------------------------------
---------------------------------6]SolidWasteManagement-Basic----------------------
select* from[dbo].[D12-SolidWasteManagement-Basic_19]
select * from[dbo].[D13-SolidWasteManagement-Efficiency_20]
select * from [dbo].[D15-SolidWasteD2DCollectionRevenue_tumakuru]
alter table[dbo].[D15-SolidWasteD2DCollectionRevenue_tumakuru]
drop column [Column 9],[Column 10],[Column 11],[Column 12],[Column 13],[Column 14],[Column 15],[Column 16],[Column 17],[Column 18],[Column 19]
select
d.[Ward name],
d.[City Name],
d.[Zone Name],
m.[Total No  of households   establishments],
m.[Total no  of households and establishments covered through doorstep collection],
m.[HH covered with Source Seggeratation ],
d.[Door to Door (D2D) collection Status - No of Households (HH)],
d.[Door to Door (D2D) collection Status - No of HH under daily D2D collection],
d.[User Charge Collection - Whether user charges imposed (Y N)],
d.[User Charge Collection - Rate (in INR)],
d.[User Charge Collection - Monthly revenue collected (in lakhs)] 
from[dbo].[D12-SolidWasteManagement-Basic_19] m
inner join
[dbo].[D15-SolidWasteD2DCollectionRevenue_tumakuru] d
on d.[Ward name]=m.[Ward No ]
order by [Ward name]
-----------------------
-------------total households--------------------------------
create view totalhouseholds as
SELECT 
[City Name],
SUM(TRY_CAST([Total No  of households   establishments] AS INT)) AS allwardhouseholdsestablishment
FROM [dbo].[D12-SolidWasteManagement-Basic_19]
group by [City Name]
--------------------------------------------
select 
d.[Ward name],
m.[Total No  of households   establishments]=(select max([Total No  of households   establishments] as int) from [dbo].[D12-SolidWasteManagement-Basic_19])

from [dbo].[D12-SolidWasteManagement-Basic_19] m
inner join
[dbo].[D15-SolidWasteD2DCollectionRevenue_tumakuru] d
on m.[Ward No ]=d.[Ward name]

SELECT 
    d.[Ward name],
    (SELECT MAX(TRY_CAST([Total No  of households   establishments] AS INT)) 
     FROM [dbo].[D12-SolidWasteManagement-Basic_19]) AS MaxHouseholds
FROM 
    [dbo].[D12-SolidWasteManagement-Basic_19] m
right JOIN
    [dbo].[D15-SolidWasteD2DCollectionRevenue_tumakuru] d
    ON m.[Ward No ] = d.[Ward name];

-----------which ward has maxhouseholds---------------
	create view MaxHouseholds as
	SELECT TOP 1
	d.[City Name],
    d.[Ward name],
    TRY_CAST(m.[Total No  of households   establishments] AS INT) AS MaxHouseholds
FROM 
    [dbo].[D12-SolidWasteManagement-Basic_19] m
RIGHT JOIN
    [dbo].[D15-SolidWasteD2DCollectionRevenue_tumakuru] d
    ON m.[Ward No ] = d.[Ward name]
ORDER BY 
    TRY_CAST(m.[Total No  of households   establishments] AS INT) DESC;
	---------------------------------------------------------------
select * from[dbo].[D17-SolidWasteCollectionVehicle_tumakuru]
alter table[dbo].[D17-SolidWasteCollectionVehicle_tumakuru]
drop column [ Biweekly],[ Fortnightly],
[ Monthly)"],[Column 13],
[Column 14],[Column 15],
[Column 16],[Column 17],
[Column 18],[Column 19],
[Column 20],[Column 21],
[Column 22],[Column 23]
----------------------------------------
-------------7]SolidWasteCollectionVehicle_tumakuru---------------
create view wastecollectionandvehicle as
select
[City Name],
[Ward No ],
[Waste Quantity (TPD)],
[Collection Vehicle details-Type of Waste collection vehicle],
[Collection Vehicle details-Capacity (in cubic meters)]
from 
[dbo].[D17-SolidWasteCollectionVehicle_tumakuru]
select * from[dbo].[D17-SolidWasteCollectionVehicle_tumakuru]
---------------8]SolidWasteDisposal_tumakuru-------------------------------------
select * from[dbo].[D19-SolidWasteDisposal_tumakuru]
alter table [dbo].[D19-SolidWasteDisposal_tumakuru]
drop column 
[Location of waste Disposal],
[Distance from city center],
[Operational since],
[Quantity (TPD)],
[Column 11],
[Column 12],
[Column 13],
[Column 14],
[Column 15],
[Column 16],
[Column 17],
[Column 18],
[Column 19],
[Column 20],
[Column 21],
[Column 22],
[Column 23],
[Column 24]

CREATE VIEW wastetype_and_landfill_site AS
select 
d.[City Name],
v.[Ward name],
v.[Waste Quantity (TPD)],
v.[Collection Vehicle details-Type of Waste collection vehicle],
v.[Collection Vehicle details-Capacity (in cubic meters)],
d.["Type of waste (organix],
d.[ inorganic],
d.[ dry] as Landfill_site
from
[dbo].[D17-SolidWasteCollectionVehicle_tumakuru] v
inner join
[dbo].[D19-SolidWasteDisposal_tumakuru] d
on d.[Disposal site or SLF] =v.[Waste Quantity (TPD)]
select * from wastetype_and_landfill_site

--------------------------9]Education_TUMAKURU_1--------------------
select * from[dbo].[D22-Education_TUMAKURU_1]
----------------------------------------------------------
create view educationdetails as 
select 
[City Name],
SUM(TRY_CAST([2015-16 - Total No  of Schools (within corporation city limits)] AS INT)) AS total_school_2015to2016,
SUM(TRY_CAST([2016-17 - Total No  of Schools (within corporation city limits)] AS INT)) AS total_school_2016to2017,
SUM(TRY_CAST([2017-18 - Total No  of Schools (within corporation city limits)] AS INT)) AS total_school_2017to2018,
SUM(TRY_CAST([2015-16 - Total No  of School Aged population (age 5+) - Total] AS INT)) AS total_no_of_school_aged_population_age5_above_2015to2016,
SUM(TRY_CAST([2016-17 - Total No  of School Aged population (age 5+) - Total] AS INT)) AS total_no_of_school_aged_population_age5_above_2016to2017,
SUM(TRY_CAST([2017-18 - Total No  of School Aged population (age 5+) - Total] AS INT)) AS total_no_of_school_aged_population_age5_above_2017to2018,
SUM(TRY_CAST([2015-16 - Total No  of School Aged population( age 5+) - Male] AS INT)) AS total_no_of_school_aged_population_age5_above_male_2015to2016,
SUM(TRY_CAST([2016-17 - Total No  of School Aged population( age 5+) - Male] AS INT)) AS total_no_of_school_aged_population_age5_above_male_2016to2017,
SUM(TRY_CAST([2017-18 - Total No  of School Aged population( age 5+) - Male] AS INT)) AS total_no_of_school_aged_population_age5_above_male_2017to2018,
SUM(TRY_CAST([2015-16 - Total No  of School Aged population(5+) - Female] AS INT)) AS total_no_of_school_aged_population_age5_above_female_2015to2016,
SUM(TRY_CAST([2016-17 - Total No  of School Aged population(5+) - Female] AS INT)) AS total_no_of_school_aged_population_age5_above_female_2016to2017,
SUM(TRY_CAST([2017-18 - Total No  of School Aged population(5+) - Female] AS INT)) AS total_no_of_school_aged_population_age5_above_female_2017to2018,
SUM(TRY_CAST([2015-16 - Number of school-aged population enrolled in primary and secondary school - Total (Public schools)] AS INT)) AS total_pri_sec_public_school_pop_2015to2016,
SUM(TRY_CAST([2016-17 - Number of school-aged population enrolled in primary and secondary school - Total (Public schools)] AS INT)) AS total_pri_sec_public_school_pop_2016to2017,
SUM(TRY_CAST([2017-18 - Number of school-aged population enrolled in primary and secondary school - Total (Public schools)] AS INT)) AS total_pri_sec_public_school_pop_2017to2018,
SUM(TRY_CAST([2015-16 - Number of school-aged population enrolled in primary and secondary school - Total (Private Schools)] AS INT)) AS total_pri_sec_private_school_pop_2015to2016,
SUM(TRY_CAST([2016-17 - Number of school-aged population enrolled in primary and secondary school - Total (Private Schools)] AS INT)) AS total_pri_sec_private_school_pop_2016to2017,
SUM(TRY_CAST([2017-18 - Number of school-aged population enrolled in primary and secondary school - Total (Private Schools)] AS INT)) AS total_pri_sec_private_school_pop_2017to2018,
SUM(TRY_CAST([2015-16 - Number of school-aged population enrolled in primary and secondary school - Male] AS INT)) AS total_pri_sec_private_school_pop_male_2015to2016,
SUM(TRY_CAST([2016-17 - Number of school-aged population enrolled in primary and secondary school - Male] AS INT)) AS total_pri_sec_private_school_pop_male_2016to2017,
SUM(TRY_CAST([2017-18 - Number of school-aged population enrolled in primary and secondary school - Male] AS INT)) AS total_pri_sec_private_school_pop_male2017to2018,
SUM(TRY_CAST([2015-16 - Number of school-aged population enrolled in primary and secondary school - Female] AS INT)) AS total_pri_sec_private_school_pop_female_2015to2016,
SUM(TRY_CAST([2016-17 - Number of school-aged population enrolled in primary and secondary school - Female] AS INT)) AS total_pri_sec_private_school_pop_female_2016to2017,
SUM(TRY_CAST([2017-18 - Number of school-aged population enrolled in primary and secondary school - Female] AS INT)) AS total_pri_sec_private_school_pop_female2017to2018,
SUM(TRY_CAST([2015-16 - Number of  teachers in primary & secondary schools (Private)] AS INT)) AS total_number_of_pri_sec_private_teachers_2015to2016,
SUM(TRY_CAST([2016-17 - Number of  teachers in primary & secondary schools (Private)] AS INT)) AS total_number_of_pri_sec_private_teachers_2016to2017,
SUM(TRY_CAST([2017-18 - Number of  teachers in primary & secondary schools (Private)] AS INT)) AS total_number_of_pri_sec_private_teachers_2017to2018,
SUM(TRY_CAST([2015-16 - Number of  teachers in primary & secondary schools (Public)] AS INT)) AS total_number_of_pri_sec_public_teachers_2015to2016,
SUM(TRY_CAST([2016-17 - Number of  teachers in primary & secondary schools (Public)] AS INT)) AS total_number_of_pri_sec_public_teachers_2016to2017,
SUM(TRY_CAST([2017-18 - Number of  teachers in primary & secondary schools (Public)] AS INT)) AS total_number_of_pri_sec_public_teachers_2017to2018
from [dbo].[D22-Education_TUMAKURU_1]
group by [City Name]
---------------------------------------------------------------------------
-------------------------------------------10]roads and streetlight----------------
select * from[dbo].[D23-Roads_tumakuru]
select* from[dbo].[D24-StreetLights_11]
alter table[dbo].[D24-StreetLights_11]
drop column[Total no  of streets],
[No  of streets with adequate street lighting facilties]
-------------------------------------11]opensapce----------------------------------------
 alter table[dbo].[D29-OpenSpaces_8]
 drop column [Open space name no],
[Number of Tree (ward public space street)]
select * from[dbo].[D29-OpenSpaces_8]
--------------------------------------12culturalheritage---------------------------
select * from[dbo].[D31-CulturalHeritage_15_1]
alter table [dbo].[D31-CulturalHeritage_15_1]
drop column [ street etc )"],
[Age of heritage (in Years)],
[Column 8]
--------------------------------------13]buses-----------------------------------------------
select * from[dbo].['D36-Buses_TUMAKURU_1']
alter table [dbo].['D36-Buses_TUMAKURU_1']
drop column [Population (2011)]
------------------------------14]publictransport---------------------------
select * from [dbo].[D38-PublicTransportAccessibility_TUMAKURU_1]
------------------------------15]digitalavailability----------------------
select * from
[dbo].[D45-DigitalAvailability_TUMAKURU_1]
alter table [dbo].[D45-DigitalAvailability_TUMAKURU_1]
drop column [ birth & death certificates)  Yes   No "],
[Online display of Tenders (for various works) across various departments  utilities  Yes   No ],
[Online Grievance management (tracking of complaints)  Yes   No ],
["Online buying of Tickets and passes (e g  public transport],
[ cultural events)  Yes   No "],
["Online request of Disclosure of documents (e g  budgets],
[ plans],
[ RTI requests)  Yes   No "]
alter table[dbo].[D45-DigitalAvailability_TUMAKURU_1]
drop column [ etc )  Yes   No "]
---------------------------------16]diseasestumkur---------------
select*from[dbo].[D46-Diseases_TUMAKURU_1]
-----------------------------17]crimes-----------------
select* from[dbo].[D47Crimes_3_1]