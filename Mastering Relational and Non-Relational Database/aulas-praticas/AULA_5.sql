--****************************************************
-- VERIFICA SE O NÚMERO É PAR OU ÍMPAR
--****************************************************
SET SERVEROUTPUT ON;

DECLARE
	
	n1 NUMBER := &num1;

BEGIN
	-- verifica se o número é par ou ímpar
	IF MOD(n1,2) = 0 THEN
	
		DBMS_OUTPUT.PUT_LINE ('O número ' ||n1|| ' é par.');
	
	ELSE
	
		DBMS_OUTPUT.PUT_LINE ('O número '||n1||' é ímpar.');
	
	END IF;

END;

--****************************************************
-- IMPRIME OS CARGOS DOS FUNCIONARIOS
--****************************************************
DECLARE
	
	-- variável para receber o cargo
	v_job_title	employees.job_id%TYPE;

	-- declara o cursor
	CURSOR c_employees IS 
		SELECT 	job_id 
		FROM 	employees;

BEGIN
	
	--abre o cursor
	OPEN c_employees;
  
	DBMS_OUTPUT.PUT_LINE('JOB TITLE');
	DBMS_OUTPUT.PUT_LINE('---------');
	
	-- lê o primeiro registro do cursor
	FETCH c_employees INTO v_job_title;
	
	-- enquanto forem encontrados registros
	WHILE c_employees%FOUND LOOP
	
		-- imprime o conteúdo da variável
		DBMS_OUTPUT.PUT_LINE(v_job_title);
	
		-- lê o próximo registro
		FETCH c_employees INTO v_job_title;
	
	END LOOP;
	
	--fecha o cursor
	CLOSE c_employees;
END;