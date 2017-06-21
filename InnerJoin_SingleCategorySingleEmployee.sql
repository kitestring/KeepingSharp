ATTACH DATABASE 'SepSci_cat.db' as 'c';
ATTACH DATABASE 'SepSci_emp.db' as 'e';


SELECT
	SUM(SS_Installations.Installations_Prep),
	SUM(SS_Installations.Documentation_Admin),
	SUM(SS_Installations.Travel),
	SUM(SS_Installations.Hands_On_Instrument),
	SUM(SS_Installations.Troubleshooting),
	SUM(SS_Installations.Training_by_Engineer),
	SUM(SS_Installations.Other),
	SUM(SS_Installations.Installations_day_sum),
	employee.employee_name,
	SS_Installations.employee_clk_no AS 'clk'
FROM
	SS_Installations
INNER JOIN employee ON
	clk = employee.clk_no
WHERE
	clk = '0912' OR
	clk = '0888' OR	
	clk = '0938'
GROUP BY 
	SS_Installations.employee_clk_no
ORDER BY
	employee.employee_name ASC;