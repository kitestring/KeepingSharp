ATTACH DATABASE 'SepSci_cat.db' as 'SSc';
ATTACH DATABASE 'SepSci_emp.db' as 'SSe';

SELECT '
Returns the monthly summation for each sub-category within a given category.
';

SELECT
	SUBSTR(SS_Installations.data_date,1,7),
	SUM(SS_Installations.Installations_Prep),
	SUM(SS_Installations.Documentation_Admin),
	SUM(SS_Installations.Travel),
	SUM(SS_Installations.Hands_On_Instrument),
	SUM(SS_Installations.Troubleshooting),
	SUM(SS_Installations.Training_by_Engineer),
	SUM(SS_Installations.Other),
	SUM(SS_Installations.Installations_day_sum)

FROM
	SS_Installations
	
INNER JOIN employee ON
	SS_Installations.employee_clk_no = employee.clk_no
	
WHERE
	SS_Installations.data_date < '2017-04-01'
	
GROUP BY 
	SUBSTR(SS_Installations.data_date,1,7)
ORDER BY
	SUBSTR(SS_Installations.data_date,1,7) ASC;