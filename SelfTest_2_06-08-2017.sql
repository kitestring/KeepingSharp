SELECT DISTINCT employee_clk_no FROM SS_Installations;

SELECT data_date, employee_clk_no, Travel FROM SS_Installations
	WHERE employee_clk_no = '0791' AND
	data_date LIKE '____-12-%';
	
SELECT data_date, employee_clk_no, Hands_On_Instrument FROM SS_Installations
	WHERE employee_clk_no = '1076' AND
	data_date BETWEEN '2016-12-01' AND '2016-12-31' AND
	Hands_On_Instrument != 0;
	
SELECT DISTINCT employee_clk_no FROM SS_Installations
	ORDER BY employee_clk_no DESC
	LIMIT 5; 