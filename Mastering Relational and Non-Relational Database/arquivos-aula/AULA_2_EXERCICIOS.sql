/*************************************
1) Escreva um bloco PL/SQL que calcule e imprima um valor de 12% de bônus sobre o salário do empregado de ID 110.
*************************************/

SET SERVEROUTPUT ON;

DECLARE
	bonus   NUMBER(8,2);
BEGIN
	SELECT 	salary * 0.12 
	INTO 	bonus
	FROM 	employees
	WHERE 	employee_id = 110;
  
	DBMS_OUTPUT.PUT_LINE('bonus  = ' || TO_CHAR(bonus));
	
END;
/

/*************************************
2) Altere o script para usar uma variável bind para receber dinamicamente o valor do employee_id.
*************************************/

SET SERVEROUTPUT ON;

DECLARE
	bonus   NUMBER(8,2);
BEGIN
	SELECT 	salary * 0.12 
	INTO 	bonus
	FROM 	employees
	WHERE 	employee_id = &emp;
  
	DBMS_OUTPUT.PUT_LINE('bonus  = ' || TO_CHAR(bonus));
	
END;
/

/*************************************
3) Declare a variável bonus usando o atributo %TYPE.
*************************************/

SET SERVEROUTPUT ON;

DECLARE
	bonus   employees.salary%TYPE;
BEGIN
	SELECT 	salary * 0.12 
	INTO 	bonus
	FROM 	employees
	WHERE 	employee_id = &emp;
  
	DBMS_OUTPUT.PUT_LINE('bonus  = ' || TO_CHAR(bonus));
	
END;
/

