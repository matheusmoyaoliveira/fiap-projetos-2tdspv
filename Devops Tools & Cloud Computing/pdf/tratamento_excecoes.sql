/*
Capturar uma exceção pré-definida (`NO_DATA_FOUND`)
Crie um bloco PL/SQL que tente recuperar um valor de uma tabela fictícia. Caso não encontre resultados, capture a exceção `NO_DATA_FOUND` e exiba uma mensagem apropriada.
*/

DECLARE
    v_nome VARCHAR2(50);
BEGIN
    SELECT nome INTO v_nome FROM clientes WHERE id = 9999;
    DBMS_OUTPUT.PUT_LINE('Nome do cliente: ' || v_nome);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum cliente encontrado com esse ID.');
	WHEN OTHERS
END;

/*
Capturar exceção de divisão por zero (`ZERO_DIVIDE`)
Implemente um bloco PL/SQL que realize uma divisão. Caso ocorra uma divisão por zero, capture a exceção `ZERO_DIVIDE` e exiba uma mensagem de erro.
*/

DECLARE
    v_num NUMBER := 10;
    v_den NUMBER := 0;
    v_result NUMBER;
BEGIN
    v_result := v_num / v_den;
    DBMS_OUTPUT.PUT_LINE('Resultado: ' || v_result);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Tentativa de divisão por zero.');
END;

/*
Criar uma exceção definida pelo usuário
Defina uma exceção personalizada e a levante caso um número seja negativo.
*/

DECLARE
    v_num NUMBER := -5;
    ex_negativo EXCEPTION;
BEGIN
    IF v_num < 0 THEN
        RAISE ex_negativo;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Número válido: ' || v_num);
EXCEPTION
    WHEN ex_negativo THEN
        DBMS_OUTPUT.PUT_LINE('Erro: O número não pode ser negativo.');
END;

/*
Capturar todas as exceções (`OTHERS`)
Modifique um bloco PL/SQL para capturar exceções usando `WHEN OTHERS`, exibindo a mensagem do erro.
*/

DECLARE
    v_num NUMBER := 10;
    v_den NUMBER := 0;
    v_result NUMBER;
BEGIN
    v_result := v_num / v_den;
    DBMS_OUTPUT.PUT_LINE('Resultado: ' || v_result);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
END;

/*
Registros em `EXCEPTION_INIT`
Associe um código de erro específico a uma exceção personalizada usando `EXCEPTION_INIT`.
*/

DECLARE
    ex_duplicado EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_duplicado, -00001);
BEGIN
    INSERT INTO clientes(id, nome) VALUES (1, 'Teste');
EXCEPTION
    WHEN ex_duplicado THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Chave duplicada.');
END;
