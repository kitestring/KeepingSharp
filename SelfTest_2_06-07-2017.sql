SELECT DISTINCT employee_clk_no FROM SS_installations;

SELECT employee_clk_no, Travel, data_date 
	FROM SS_installations 
	WHERE data_date like '____-12-%' 
	AND employee_clk_no = '0791';
	
SELECT employee_clk_no, Hands_On_Instrument, data_date 
	FROM SS_installations
	WHERE employee_clk_no = '1076'
	AND data_date BETWEEN '2016-10-01' AND '2016-12-31'
	AND Hands_On_Instrument != 0;
	
SELECT DISTINCT employee_clk_no FROM SS_installations
	ORDER BY employee_clk_no ASC LIMIT 5;