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

--****************************************************
-- CURSOR COM PARÂMETRO (66 linhas)
--****************************************************
SET SERVEROUTPUT ON;

DECLARE

	-- obtem todos os departamentos que possuam funcionarios
	CURSOR c_departamento IS
		SELECT *
		FROM 	departments d
		WHERE   EXISTS (SELECT 1
						FROM 	employees
						WHERE 	department_id = d.department_id);
	
	-- variavel para receber os dados do cursor de departamento
	v_departamento c_departamento%ROWTYPE;
	
	-- obtem os funcionarios por departamento
	CURSOR c_funcionario (v_departamento_id NUMBER) IS
		SELECT *
		FROM 	employees
		WHERE	department_id = v_departamento_id;
	
	-- variável para receber os dados de funcionario
	v_funcionario c_funcionario%ROWTYPE;
	
BEGIN

	-- abre o cursor
	OPEN c_departamento;
	
	-- obtem a primeira linha
	FETCH c_departamento INTO v_departamento;
	
	-- enquanto forem encontrados registros de departamento
	WHILE c_departamento%FOUND LOOP

		-- imprime os dados de departamento
		DBMS_OUTPUT.PUT_LINE('---- DEPARTAMENTO: ' || v_departamento.department_name || '------------------');
		DBMS_OUTPUT.PUT_LINE(RPAD('PRIMEIRO NOME',30) ||  '|' || RPAD('SOBRENOME',30));	
	
		-- abre o cursor
		OPEN c_funcionario(v_departamento.department_id);
		
		-- obtem a linha
		FETCH c_funcionario INTO v_funcionario;
	
		-- enquanto forem encontrados funcionarios no departamento
		WHILE c_funcionario%FOUND LOOP
		
			-- imprime os dados do funcionario
			DBMS_OUTPUT.PUT_LINE(RPAD(v_funcionario.first_name,30) || '|' || RPAD(v_funcionario.last_name,30));
		
			-- obtem o proximo funcionario
			FETCH c_funcionario INTO v_funcionario;
		
		END LOOP;

		-- fecha o cursor
		CLOSE c_funcionario;
		
		-- obtem o proximo departamento
		FETCH c_departamento INTO v_departamento;
		
	END LOOP;
	
	-- fecha o cursor
	CLOSE c_departamento;

END;

--****************************************************
-- O MESMO EXERCICIO, MAS MAIS SIMPLES (26 linhas)
--****************************************************
BEGIN

	-- obtem todos os departamentos que possuam funcionarios
	FOR v_departamento IN (	SELECT *
							FROM 	departments d
							WHERE   EXISTS (SELECT 1
											FROM 	employees
											WHERE 	department_id = d.department_id)) LOOP
											
		-- imprime os dados de departamento
		DBMS_OUTPUT.PUT_LINE('---- DEPARTAMENTO: ' || v_departamento.department_name || '------------------');
		DBMS_OUTPUT.PUT_LINE(RPAD('PRIMEIRO NOME',30) ||  '|' || RPAD('SOBRENOME',30));	
						
		-- obtem os funcionarios do departamento						
		FOR v_funcionario IN (	SELECT *
								FROM 	employees
								WHERE	department_id = v_departamento.department_id) LOOP
	
			-- imprime os dados do funcionario
			DBMS_OUTPUT.PUT_LINE(RPAD(v_funcionario.first_name,30) || '|' || RPAD(v_funcionario.last_name,30));
		
		END LOOP;
	
	END LOOP;

END;

/*************************************************************
CURSOR FOR UPDATE

Inclui o campo END_DATE na tabela EMPLOYEES, desliga todos os funcionarios do departamento 80,
cadastra valor no campo END_DATE nos desligados e inclui o historico dos desligados
*************************************************************/

-- ADICIONE O CAMPOS
ALTER TABLE employees ADD (END_DATE DATE);

-- VERIFIQUE QUE NAO EXISTEM FUNCIONARIOS COM END_DATE PREENCHIDOS
SELECT * FROM EMPLOYEES WHERE END_DATE IS NOT NULL;
SELECT * FROM JOB_HISTORY;

-- PL/SQL
DECLARE

	-- CURSOR
	CURSOR c_funcionario(v_departmento_id NUMBER) IS
		SELECT *
		FROM 	employees
		WHERE 	department_id = v_departmento_id
		--FOR 	UPDATE OF END_DATE WAIT 30;
		FOR 	UPDATE OF END_DATE NOWAIT;
		
	-- variável para receber os dados de funcionario
	v_funcionario c_funcionario%ROWTYPE;

BEGIN 

	OPEN c_funcionario(80);
	
	-- obtem a linha
	FETCH c_funcionario INTO v_funcionario;

	-- enquanto forem encontrados funcionarios no departamento
	WHILE c_funcionario%FOUND LOOP
	
		-- cadastra o historico
		INSERT INTO JOB_HISTORY ( 	EMPLOYEE_ID,
									START_DATE,
									END_DATE,
									JOB_ID,
									DEPARTMENT_ID)
		VALUES (v_funcionario.EMPLOYEE_ID,
				v_funcionario.HIRE_DATE,
				SYSDATE,
				v_funcionario.JOB_ID,
				v_funcionario.DEPARTMENT_ID);
		
		-- atualiza o campo END_DATE apenas do funcionario correspondente ao ponteiro atual
		UPDATE 	employees 
		SET		end_date = SYSDATE
		WHERE CURRENT OF c_funcionario;
	
		-- obtem o proximo funcionario
		FETCH c_funcionario INTO v_funcionario;
	
	END LOOP;

	-- fecha o cursor
	CLOSE c_funcionario;
	
	COMMIT;

END;

-- AGORA FAÇA O SEGUINTE TESTE
UPDATE EMPLOYEES SET END_DATE = NULL;
TRUNCATE TABLE JOB_HISTORY; -- COMANDO DDL COMMIT EMBUTIDO

--ABRA OUTRA SESSÃO E BLOQUEIE UM REGISTRO DO DEPARTAMENTO 80 E VEJA O QUE ACONTECE AO EXECUTAR O PL/SQL
UPDATE employees SET salary=salary WHERE employee_id=169;


-- VERIFIQUE QUE NAO EXISTEM FUNCIONARIOS COM END_DATE PREENCHIDOS
SELECT * FROM EMPLOYEES WHERE END_DATE IS NOT NULL;
SELECT * FROM JOB_HISTORY;


