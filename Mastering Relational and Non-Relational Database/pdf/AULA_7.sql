/*
O maior inimigo da performance em bancos de dados Oracle é o Context Switching (Troca de Contexto). Imagine um porteiro (Engine SQL) e um administrador (Engine PL/SQL). Se o administrador pede uma folha de papel por vez ao porteiro, ele perde muito tempo abrindo e fechando a porta. O BULK COLLECT permite que o administrador peça uma "caixa" inteira de papéis de uma só vez.

----------------------------------
Sistema de Bônus de Performance
----------------------------------

A empresa TechSoluções possui 50.000 funcionários. No final do ano, ela precisa calcular o bônus salarial baseado no departamento de cada funcionário. As regras de bônus são dinâmicas e mudam conforme o desempenho do setor.

1.  Você deve carregar as regras de bônus (que estão em uma tabela de configurações) em uma INDEX BY table para que a busca seja instantânea (in-memory lookup).
2.  Você deve buscar todos os funcionários que têm direito ao bônus usando BULK COLLECT para evitar lentidão no banco de dados.
3.  O sistema deve imprimir o novo salário calculado.
*/

SET SERVEROUTPUT ON;

DECLARE

    -- 1. INDEX BY TABLE para Cache de Regras (Key: ID Dept, Value: Percentual)
    -- Indispensável para busca rápida sem novos SELECTs
    TYPE t_regras_bonus IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    v_cache_bonus t_regras_bonus;

    -- 2. Registro e Coleção para processamento em massa (BULK)
    TYPE t_emp_rec IS RECORD (
        emp_id      NUMBER,
        nome        VARCHAR2(100),
        dept_id     NUMBER,
        salario     NUMBER
    );
	
    TYPE t_emp_coll IS TABLE OF t_emp_rec; -- Nested table para o bulk collect
    
	v_funcionarios t_emp_coll;

    -- Variáveis de controle
    v_novo_salario NUMBER;
    v_percentual   NUMBER;

BEGIN

    -- PASSO 1: Populando o "Dicionário" de Regras (INDEX BY)
    v_cache_bonus(10) := 0.15; -- Dept 10 ganha 15%
    v_cache_bonus(20) := 0.20; -- Dept 20 ganha 20%
    v_cache_bonus(30) := 0.05; -- Dept 30 ganha 5%

    -- PASSO 2: BULK COLLECT (A "Caixa" de dados)
    -- Buscamos todos os funcionários de uma vez para a memória
	/*Redução de I/O: Sem o BULK COLLECT, o Oracle faria uma viagem de ida e volta entre as engines SQL e PL/SQL para cada funcionário. Com 50.000 linhas, isso destruiria a performance.*/
	
    SELECT employee_id, first_name, department_id, salary 
    BULK COLLECT INTO v_funcionarios
    FROM employees
    WHERE department_id IN (10, 20, 30);

    DBMS_OUTPUT.PUT_LINE('Processando ' || v_funcionarios.COUNT || ' funcionários...');

    -- PASSO 3: Processamento em Memória
	/*O Uso da INDEX BY como Hash Map: Note que aqui usamos v_cache_bonus(v_funcionarios(i).dept_id). Não houve um SELECT percentual FROM regras WHERE dept_id = .... A busca foi feita diretamente na memória RAM do servidor (PGA), o que é milhares de vezes mais rápido que um acesso a disco ou busca em tabela.*/
	
    FOR i IN 1 .. v_funcionarios.COUNT LOOP
	
        -- Buscamos o percentual no nosso INDEX BY Table (Rápido!)
        v_percentual := v_cache_bonus(v_funcionarios(i).dept_id);
        
		-- o novo salário será multiplicado por 1.05 (5% de aument), 1.15 ou 1.20
        v_novo_salario := v_funcionarios(i).salario * (1 + v_percentual);

        DBMS_OUTPUT.PUT_LINE('Func: ' || v_funcionarios(i).nome || 
                             ' | Antigo: ' || v_funcionarios(i).salario || 
                             ' | Novo: ' || v_novo_salario);
    END LOOP;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Regra de bônus não encontrada para o departamento.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
END;
/