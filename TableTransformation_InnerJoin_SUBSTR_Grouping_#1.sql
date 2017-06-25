ATTACH DATABASE 'SepSci_cat.db' as 'SSc';
ATTACH DATABASE 'SepSci_emp.db' as 'SSe';

SELECT '
Returns the summation for the total day sum for each category, aggregated for all employees grouped by month.
';

SELECT
	SUBSTR(data_date,1,7),
	SUM(Name_Data_AllDaySums.a),
	SUM(Name_Data_AllDaySums.b),
	SUM(Name_Data_AllDaySums.c),
	SUM(Name_Data_AllDaySums.d),
	SUM(Name_Data_AllDaySums.e),
	SUM(Name_Data_AllDaySums.f),
	SUM(Name_Data_AllDaySums.g),
	SUM(Name_Data_AllDaySums.h),
	SUM(Name_Data_AllDaySums.i),
	SUM(Name_Data_AllDaySums.j),
	SUM(Name_Data_AllDaySums.k),
	SUM(Name_Data_AllDaySums.l),
	SUM(Name_Data_AllDaySums.m)
	
FROM (


	SELECT
		employee.employee_name AS 'name',
		SS_Installations.data_date AS 'data_date',
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
		employee.clk_no = SS_Installations.employee_clk_no
		
	INNER JOIN SS_PM_Site_Visits ON
		employee.clk_no = SS_PM_Site_Visits.employee_clk_no AND
		SS_Installations.data_date = SS_PM_Site_Visits.data_date

	INNER JOIN SS_Rpr_Maint_Site_Visits ON
		employee.clk_no = SS_Rpr_Maint_Site_Visits.employee_clk_no AND
		SS_PM_Site_Visits.data_date = SS_Rpr_Maint_Site_Visits.data_date
		
	INNER JOIN SS_Rmt_Hrdwr_Spt ON
		employee.clk_no = SS_Rmt_Hrdwr_Spt.employee_clk_no AND
		SS_Rpr_Maint_Site_Visits.data_date = SS_Rmt_Hrdwr_Spt.data_date
		
	INNER JOIN SS_Rmt_Sftwr_Spt ON
		employee.clk_no = SS_Rmt_Sftwr_Spt.employee_clk_no AND 
		SS_Rmt_Hrdwr_Spt.data_date = SS_Rmt_Sftwr_Spt.data_date
		
	INNER JOIN SS_Rpr_Mant_RFB_in_House ON
		employee.clk_no = SS_Rpr_Mant_RFB_in_House.employee_clk_no AND
		SS_Rmt_Sftwr_Spt.data_date = SS_Rpr_Mant_RFB_in_House.data_date
		
	INNER JOIN Miscellaneous ON
		employee.clk_no = Miscellaneous.employee_clk_no AND
		SS_Rpr_Mant_RFB_in_House.data_date = Miscellaneous.data_date
		
	INNER JOIN SS_Doc_Gen ON
		employee.clk_no = SS_Doc_Gen.employee_clk_no AND
		Miscellaneous.data_date = SS_Doc_Gen.data_date
		
	INNER JOIN SS_Inter_Dep_Spt ON
		employee.clk_no = SS_Inter_Dep_Spt.employee_clk_no AND
		SS_Doc_Gen.data_date = SS_Inter_Dep_Spt.data_date
		
	INNER JOIN SS_Online_Training ON
		employee.clk_no = SS_Online_Training.employee_clk_no AND
		SS_Inter_Dep_Spt.data_date = SS_Online_Training.data_date
		
	INNER JOIN SS_Onsite_Training ON
		employee.clk_no = SS_Onsite_Training.employee_clk_no AND
		SS_Online_Training.data_date = SS_Onsite_Training.data_date
		
	INNER JOIN SS_In_House_Training ON
		employee.clk_no = SS_In_House_Training.employee_clk_no AND 
		SS_Onsite_Training.data_date = SS_In_House_Training.data_date
		
	INNER JOIN Validation_Duties ON
		employee.clk_no = Validation_Duties.employee_clk_no AND
		SS_In_House_Training.data_date = Validation_Duties.data_date
		
	WHERE
		(a != 0 OR
		b !=0 OR
		c != 0 OR
		d != 0 OR
		e != 0 OR
		f != 0 OR
		g != 0 OR
		h != 0 OR
		i != 0 OR
		j != 0 OR
		k != 0 OR
		l != 0 OR
		m != 0) AND
		SS_Installations.data_date < '2017-04-01') Name_Data_AllDaySums
		
GROUP BY SUBSTR(data_date,1,7)

ORDER BY SUBSTR(data_date,1,7) ASC;