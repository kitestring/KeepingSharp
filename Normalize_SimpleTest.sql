/* 
From every SS_ table in the SepSci_cat.db
remove every line WHERE the day sum = 0
*/

ATTACH DATABASE 'SepSci_cat.db' AS 'c';
ATTACH DATABASE 'SepSci_emp.db' AS 'e';

/*
Pre-Normalization check
*/

SELECT
	employee.employee_name,
	COUNT(Validation_Duties.Validation_Duties_day_sum)
FROM 
	Validation_Duties
JOIN employee ON
	Validation_Duties.employee_clk_no = employee.clk_no
GROUP BY
	Validation_Duties.employee_clk_no
ORDER BY
	employee.employee_name DESC;

	
SELECT '';


SELECT
	employee.employee_name,
	COUNT(Validation_Duties.Validation_Duties_day_sum)
FROM 
	Validation_Duties
JOIN employee ON
	Validation_Duties.employee_clk_no = employee.clk_no
WHERE
	Validation_Duties.Validation_Duties_day_sum != 0
GROUP BY
	Validation_Duties.employee_clk_no
ORDER BY
	employee.employee_name DESC;

	
SELECT '';


SELECT
	employee.employee_name,
	COUNT(SS_Installations.Installations_day_sum)
FROM 
	SS_Installations
JOIN employee ON
	SS_Installations.employee_clk_no = employee.clk_no
GROUP BY
	SS_Installations.employee_clk_no
ORDER BY
	employee.employee_name DESC;
	

	SELECT '';


SELECT
	employee.employee_name,
	COUNT(SS_Installations.Installations_day_sum)
FROM 
	SS_Installations
JOIN employee ON
	SS_Installations.employee_clk_no = employee.clk_no
WHERE 
	SS_Installations.Installations_day_sum != 0
GROUP BY
	SS_Installations.employee_clk_no
ORDER BY
	employee.employee_name DESC;
	

	
DELETE FROM SS_Installations WHERE SS_Installations.Installations_day_sum = 0;
DELETE FROM SS_PM_Site_Visits WHERE SS_PM_Site_Visits.PM_Site_Visits_day_sum = 0;
DELETE FROM SS_Rpr_Maint_Site_Visits WHERE SS_Rpr_Maint_Site_Visits.Inst_Repair_or_Maintenance_on_Site_day_sum = 0;
DELETE FROM SS_Rmt_Hrdwr_Spt WHERE SS_Rmt_Hrdwr_Spt.Rmt_Hardware_Support_day_sum = 0;
DELETE FROM SS_Rmt_Sftwr_Spt WHERE SS_Rmt_Sftwr_Spt.Rmt_Software_Support_day_sum = 0;
DELETE FROM SS_Rpr_Mant_RFB_in_House WHERE SS_Rpr_Mant_RFB_in_House.Inst_Repair_Maint_Rfb_In_House_day_sum = 0;
DELETE FROM Miscellaneous WHERE Miscellaneous.Miscellaneous_day_sum = 0;
DELETE FROM SS_Doc_Gen WHERE SS_Doc_Gen.Document_Generation_day_sum = 0;
DELETE FROM SS_Inter_Dep_Spt WHERE SS_Inter_Dep_Spt.Inter_Dep_Spt_day_sum = 0;
DELETE FROM SS_Online_Training WHERE SS_Online_Training.Online_Training_day_sum = 0;
DELETE FROM SS_Onsite_Training WHERE SS_Onsite_Training.Onsite_Training_day_sum = 0;
DELETE FROM SS_In_House_Training WHERE SS_In_House_Training.In_House_Training_day_sum = 0;
DELETE FROM Validation_Duties WHERE Validation_Duties.Validation_Duties_day_sum = 0;


SELECT '';
SELECT '';
SELECT '';
SELECT '';

/*
Post normalization verification
*/

SELECT
	employee.employee_name,
	COUNT(Validation_Duties.Validation_Duties_day_sum)
FROM 
	Validation_Duties
JOIN employee ON
	Validation_Duties.employee_clk_no = employee.clk_no
GROUP BY
	Validation_Duties.employee_clk_no
ORDER BY
	employee.employee_name DESC;

	
SELECT '';


SELECT
	employee.employee_name,
	COUNT(Validation_Duties.Validation_Duties_day_sum)
FROM 
	Validation_Duties
JOIN employee ON
	Validation_Duties.employee_clk_no = employee.clk_no
WHERE
	Validation_Duties.Validation_Duties_day_sum != 0
GROUP BY
	Validation_Duties.employee_clk_no
ORDER BY
	employee.employee_name DESC;

	
SELECT '';


SELECT
	employee.employee_name,
	COUNT(SS_Installations.Installations_day_sum)
FROM 
	SS_Installations
JOIN employee ON
	SS_Installations.employee_clk_no = employee.clk_no
GROUP BY
	SS_Installations.employee_clk_no
ORDER BY
	employee.employee_name DESC;
	

	SELECT '';


SELECT
	employee.employee_name,
	COUNT(SS_Installations.Installations_day_sum)
FROM 
	SS_Installations
JOIN employee ON
	SS_Installations.employee_clk_no = employee.clk_no
WHERE 
	SS_Installations.Installations_day_sum != 0
GROUP BY
	SS_Installations.employee_clk_no
ORDER BY
	employee.employee_name DESC; 
