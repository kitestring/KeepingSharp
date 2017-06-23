/*
This query counts the number of days each employee
has spent time on both in-house maintainence jobs
and remote hardware support.  It also does an
inner join to the employee table so that the
employee names are also listed.
*/

ATTACH DATABASE 'SepSci_cat.db' as 'SSc';
ATTACH DATABASE 'SepSci_emp.db' as 'SSe';

SELECT
	employee.employee_name AS 'name',
	Spt.Spt_clk,
	count(Fix.Fix_Date)
FROM

	(SELECT 
		SS_Rpr_Mant_RFB_in_House.data_date AS 'Fix_Date',
		SS_Rpr_Mant_RFB_in_House.employee_clk_no AS 'Fix_clk'
	FROM
		SS_Rpr_Mant_RFB_in_House
	WHERE
		SS_Rpr_Mant_RFB_in_House.Inst_Repair_Maint_Rfb_In_House_day_sum !=0
	ORDER BY 2) Fix, 
	
	(SELECT
		SS_Rmt_Hrdwr_Spt.data_date AS 'Spt_Date',
		SS_Rmt_Hrdwr_Spt.employee_clk_no AS 'Spt_clk'
	FROM
		SS_Rmt_Hrdwr_Spt
	WHERE
		SS_Rmt_Hrdwr_Spt.Rmt_Hardware_Support_day_sum !=0
	ORDER BY 2) Spt
	
INNER JOIN employee on
	employee.clk_no = Spt.Spt_clk
	
WHERE
	Fix.Fix_Date = Spt.Spt_Date AND
	Fix.Fix_clk = Spt.Spt_clk
	
GROUP BY
	Spt.Spt_clk
ORDER BY
	count(Fix.Fix_Date) DESC;