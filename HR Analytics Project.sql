/* 
    Project Name     -  HR Analytics
    Schema Name   -  HR Analytics Project
    Table Name       -  Dataset
*/

USE hr_analytics_project;

                                                                   ####   [ KPI 1]  Average Attrition Rate for all Department    ####
                                                                   
SELECT Department,
CONCAT(ROUND(SUM(CASE WHEN Attrition="Yes" THEN 1 ELSE 0 END) / COUNT(Attrition) *100, 2), " %") as Attrition_Rate
FROM dataset 
GROUP BY Department;

#################################################################################################################################

															    ####   [ KPI 2]  Average Hourly Rate for Male Research Scientist    ####
                                                                
SELECT CONCAT("The average hourly rate value is ",ROUND(AVG(HourlyRate), 2)) as "Average Hourly Rate for Male Research Scientist" 
FROM dataset WHERE Gender = "Male" AND JobRole = "Research Scientist";

#################################################################################################################################

                                                                 ####   [ KPI 3]  Attrition Rate vs Monthly Income Statistics    ####
                                                                 
SELECT JobRole,
CONCAT(ROUND(SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) / COUNT(Attrition) * 100, 2), " %") as Attrition_Rate,
CONCAT("Rs. ",ROUND(AVG(MonthlyIncome))) as Average_Monthly_Income
FROM dataset 
GROUP BY JobRole ORDER BY JobRole;

#################################################################################################################################

																 ####   [ KPI 4]  Average Working Year for each Departmen    ####
                                                                  
SELECT Department, ROUND(AVG(YearsAtCompany), 2) as "Average Working Year" 
FROM dataset 
GROUP BY Department;

#################################################################################################################################

                                                                 ####   [ KPI 5 ]  Job Role vs Work Life Balance    ####
                                                                 
SELECT JobRole,
SUM(CASE WHEN WorkLifeBalance = 1 THEN 1 ELSE 0 END) as "Rating 1 (Count)",
CONCAT(ROUND(SUM(CASE WHEN WorkLifeBalance = 1 THEN 1 ELSE 0 END) / COUNT(Attrition) * 100, 2),  " %") as "Rating 1 (%)",
SUM(CASE WHEN WorkLifeBalance = 2 THEN 1 ELSE 0 ENd) as "Rating 2 (Count)",
CONCAT(ROUND(SUM(CASE WHEN WorkLifeBalance = 2 THEN 1 ELSE 0 END) / COUNT(Attrition) * 100, 2), " %") as "Rating 2 (%)",
SUM(CASE WHEN WorkLifeBalance = 3 THEN 1 ELSE 0 END) as "Rating 3 (Count)",
CONCAT(ROUND(SUM(CASE WHEN WorkLifeBalance = 3 THEN 1 ELSE 0 END) / COUNT(Attrition) * 100, 2), " %") as "Rating 3 (%)", 
SUM(CASE WHEN WorkLifeBalance = 4 THEN 1 ELSE 0 END) as "Rating 4 (Count)",
CONCAT(ROUND(SUM(CASE WHEN WorkLifeBalance = 4 THEN 1 ELSE 0 END) / COUNT(Attrition) * 100, 2), " %") as "Rating 4 (%)",
COUNT(WorkLifeBalance) as "Total Employee's",
CONCAT(100, " %") as "Total Rating (%)"
FROM dataset 
GROUP BY JobRole;

#################################################################################################################################

																####   [ KPI 6 ]  Attrition Rate vs Year Since Last Promotion Relation    ####
                                                                
SELECT JobRole, 
COUNT(Attrition="Yes") as "Count of Attrition", 
ROUND(AVG(YearsSinceLastPromotion), 2) as "Average of Year Since Last Promotion",
CONCAT(ROUND(SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) / COUNT(Attrition) * 100, 2), " %") as "Attrition Rate"
from dataset 
GROUP BY JobRole ORDER BY JobRole;
