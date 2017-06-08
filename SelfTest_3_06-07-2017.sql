SELECT employee_clk_no, SUM(Installations_day_sum) FROM SS_Installations
	WHERE data_date BETWEEN '2016-04-04' AND '2017-04-02'
	AND employee_clk_no = '0912'
	GROUP BY employee_clk_no;
	
	
SELECT employee_clk_no, SUM(Installations_day_sum) FROM SS_Installations
	WHERE data_date BETWEEN '2016-04-04' AND '2017-04-02'
	GROUP BY employee_clk_no
	ORDER BY SUM(Installations_day_sum) ASC;
	
ATTACH DATABASE 'SepSci_emp.db' as 'e';

SELECT clk_no, employee_name FROM e.employee
	ORDER BY clk_no ASC;
	
SELECT employee_clk_no, ROUND(AVG(Document_Generation_day_sum) * 7, 2) FROM SS_Doc_Gen
	GROUP BY employee_clk_no
	ORDER BY AVG(Document_Generation_day_sum) DESC;