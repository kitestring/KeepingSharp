ATTACH DATABASE 'SepSci_cat.db' as 'SSc';
ATTACH DATABASE 'SepSci_emp.db' as 'SSe';

SELECT
	virtual_table.employee_name,
	SUM(virtual_table.a),
	SUM(virtual_table.b),
	SUM(virtual_table.c),
	SUM(virtual_table.d),
	SUM(virtual_table.e),
	SUM(virtual_table.f),
	SUM(virtual_table.g),
	SUM(virtual_table.h),
	SUM(virtual_table.i),
	SUM(virtual_table.j),
	SUM(virtual_table.k),
	SUM(virtual_table.l),
	SUM(virtual_table.m),
	SUM(virtual_table.a) + SUM(virtual_table.b) + SUM(virtual_table.c) + SUM(virtual_table.d)
		+ SUM(virtual_table.e) + SUM(virtual_table.f) + SUM(virtual_table.g) + SUM(virtual_table.h)
		+ SUM(virtual_table.i) + SUM(virtual_table.j) + SUM(virtual_table.k) + SUM(virtual_table.l)
		+ SUM(virtual_table.m)

FROM (

	SELECT
		employee.employee_name AS 'employee_name',
		employee.clk_no AS 'clk',
		SS_Installations.data_date,
		SS_Installations.Installations_day_sum AS 'a',
		SS_PM_Site_Visits.PM_Site_Visits_day_sum AS 'b',
		SS_Rpr_Maint_Site_Visits.Inst_Repair_or_Maintenance_on_Site_day_sum AS 'c',
		SS_Rmt_Hrdwr_Spt.Rmt_Hardware_Support_day_sum AS 'd',
		SS_Rmt_Sftwr_Spt.Rmt_Software_Support_day_sum AS 'e',
		SS_Rpr_Mant_RFB_in_House.Inst_Repair_Maint_Rfb_In_House_day_sum AS 'f',
		Miscellaneous.Miscellaneous_day_sum AS 'g',
		SS_Doc_Gen.Document_Generation_day_sum AS 'h',
		SS_Inter_Dep_Spt.Inter_Dep_Spt_day_sum AS 'i',
		SS_Online_Training.Online_Training_day_sum AS 'j',
		SS_Onsite_Training.Onsite_Training_day_sum AS 'k',
		SS_In_House_Training.In_House_Training_day_sum AS 'l',
		Validation_Duties.Validation_Duties_day_sum AS 'm'
		
	FROM
		employee
		
	INNER JOIN SS_Installations ON
		clk = SS_Installations.employee_clk_no
		
	INNER JOIN SS_PM_Site_Visits ON
		clk = SS_PM_Site_Visits.employee_clk_no AND
		SS_Installations.data_date = SS_PM_Site_Visits.data_date
		
	INNER JOIN SS_Rpr_Maint_Site_Visits ON
		clk = SS_Rpr_Maint_Site_Visits.employee_clk_no AND
		SS_PM_Site_Visits.data_date = SS_Rpr_Maint_Site_Visits.data_date
		
	INNER JOIN SS_Rmt_Hrdwr_Spt ON
		clk = SS_Rmt_Hrdwr_Spt.employee_clk_no AND
		SS_Rpr_Maint_Site_Visits.data_date = SS_Rmt_Hrdwr_Spt.data_date
		
	INNER JOIN SS_Rmt_Sftwr_Spt ON
		clk = SS_Rmt_Sftwr_Spt.employee_clk_no AND
		SS_Rmt_Hrdwr_Spt.data_date = SS_Rmt_Sftwr_Spt.data_date
		
	INNER JOIN SS_Rpr_Mant_RFB_in_House ON
		clk = SS_Rpr_Mant_RFB_in_House.employee_clk_no AND
		SS_Rmt_Sftwr_Spt.data_date = SS_Rpr_Mant_RFB_in_House.data_date
		
	INNER JOIN Miscellaneous ON
		clk = Miscellaneous.employee_clk_no AND
		SS_Rpr_Mant_RFB_in_House.data_date = Miscellaneous.data_date
		
	INNER JOIN SS_Doc_Gen ON
		clk = SS_Doc_Gen.employee_clk_no AND
		Miscellaneous.data_date = SS_Doc_Gen.data_date
		
	INNER JOIN SS_Inter_Dep_Spt ON
		clk = SS_Inter_Dep_Spt.employee_clk_no AND
		SS_Doc_Gen.data_date = SS_Inter_Dep_Spt.data_date
		
	INNER JOIN SS_Online_Training ON
		clk = SS_Online_Training.employee_clk_no AND
		SS_Inter_Dep_Spt.data_date = SS_Online_Training.data_date
		
	INNER JOIN SS_Onsite_Training ON
		clk = SS_Onsite_Training.employee_clk_no AND
		SS_Online_Training.data_date = SS_Onsite_Training.data_date
		
	INNER JOIN SS_In_House_Training ON
		clk = SS_In_House_Training.employee_clk_no AND
		SS_Onsite_Training.data_date = SS_In_House_Training.data_date
		
	INNER JOIN Validation_Duties ON
		clk = Validation_Duties.employee_clk_no AND
		SS_In_House_Training.data_date = Validation_Duties.data_date
		
	WHERE
		(SS_Installations.Installations_day_sum !=0 OR
		SS_PM_Site_Visits.PM_Site_Visits_day_sum !=0 OR
		SS_Rpr_Maint_Site_Visits.Inst_Repair_or_Maintenance_on_Site_day_sum != 0 OR
		SS_Rmt_Hrdwr_Spt.Rmt_Hardware_Support_day_sum != 0 OR
		SS_Rmt_Sftwr_Spt.Rmt_Software_Support_day_sum != 0 OR
		SS_Rpr_Mant_RFB_in_House.Inst_Repair_Maint_Rfb_In_House_day_sum != 0 OR
		Miscellaneous.Miscellaneous_day_sum !=0 OR
		SS_Doc_Gen.Document_Generation_day_sum !=0 OR
		SS_Inter_Dep_Spt.Inter_Dep_Spt_day_sum !=0 OR
		SS_Online_Training.Online_Training_day_sum !=0 OR
		SS_Onsite_Training.Onsite_Training_day_sum !=0 OR
		SS_In_House_Training.In_House_Training_day_sum !=0 OR
		Validation_Duties.Validation_Duties_day_sum !=0) AND
		SS_Installations.data_date < '2017-04-01'
		
	ORDER BY
		employee_name ASC, SS_Installations.data_date ASC) virtual_table

GROUP BY
	employee_name
ORDER BY
	employee_name ASC;