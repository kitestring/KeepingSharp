ATTACH DATABASE 'SepSci_emp.db' AS 'e';

SELECT clk_no, employee_name FROM e.employee
	ORDER BY clk_no ASC;
	
SELECT employee_clk_no, COUNT(Installations_day_sum) FROM SS_Installations
	WHERE Installations_day_sum !=0
	GROUP BY employee_clk_no
	ORDER BY COUNT(Installations_day_sum) ASC;
	
SELECT employee_clk_no, SUM(Installations_day_sum) FROM SS_Installations
	WHERE data_date LIKE '2016-%'
	GROUP BY employee_clk_no
	ORDER BY SUM(Installations_day_sum) DESC
	LIMIT 5;
	
SELECT employee_clk_no, ROUND(AVG(Document_Generation_day_sum) * 7, 2) FROM SS_Doc_Gen
	GROUP BY employee_clk_no 
	ORDER BY AVG(Document_Generation_day_sum) DESC;