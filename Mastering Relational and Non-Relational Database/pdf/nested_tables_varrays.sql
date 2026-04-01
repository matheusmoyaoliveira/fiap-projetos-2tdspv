/*
-------------------------------------
Nested Tables (Tabelas Aninhadas)
-------------------------------------

A Nested Table é a coleção mais parecida com uma lista dinâmica ou um ArrayList do Java/C#. Ela não tem um tamanho máximo predefinido e pode crescer dinamicamente conforme a necessidade.

Principais Características:
- Índices Numéricos: O índice sempre começa em 1 e é sequencial.
- Construtor Obrigatório: Diferente da INDEX BY, ela nasce nula. Você precisa inicializá-la usando um construtor.
- Uso do .EXTEND: Para adicionar um novo elemento, é obrigatório abrir espaço na memória usando o método .EXTEND.
- Pode ficar Esparsa: Se você deletar um elemento do meio da lista (ex: elemento 3), os índices restantes continuam sendo 1, 2, 4 e 5. A coleção passa a ter buracos.
*/

DECLARE
    -- 1. Criação do TIPO (apenas na memória neste caso)
    TYPE t_nested_alunos IS TABLE OF VARCHAR2(50);
    
    -- 2. Declaração e Inicialização com Construtor (Vazio)
    v_turma t_nested_alunos := t_nested_alunos(); 
BEGIN
    -- 3. Adicionando elementos (Requer EXTEND)
    v_turma.EXTEND; -- Abre 1 espaço
    v_turma(1) := 'João Silva';
    
    v_turma.EXTEND(2); -- Abre 2 espaços de uma vez
    v_turma(2) := 'Maria Souza';
    v_turma(3) := 'Carlos Mendes';

    DBMS_OUTPUT.PUT_LINE('Total de alunos: ' || v_turma.COUNT);
END;
/


/*
-------------------------------------
VARRAYs (Variable-Size Arrays)
-------------------------------------

O VARRAY é o clássico Array tradicional de tamanho fixo. Você deve definir no momento da criação qual é a capacidade máxima que ele pode suportar. É excelente para dados que têm um limite lógico e conhecido (como os 7 dias da semana ou os 12 meses do ano).

Principais Características:
- Teto Máximo: Você define o limite. Ele pode ter menos elementos que o limite, mas nunca mais.
- Sempre Denso (Dense): Não é possível deletar elementos individuais do meio de um VARRAY. Se ele tem 5 elementos, são estritamente os índices 1, 2, 3, 4 e 5. Sem buracos.
- Também exige Inicialização e .EXTEND: A mecânica de uso em memória é idêntica à da Nested Table.
*/

DECLARE
    -- 1. Criação do TIPO (Máximo de 5 elementos)
    TYPE t_varray_notas IS VARRAY(5) OF NUMBER;
    
    -- 2. Declaração e Inicialização com Construtor
    v_notas_semestre t_varray_notas := t_varray_notas();
BEGIN
    -- 3. Preenchendo o VARRAY
    v_notas_semestre.EXTEND;
    v_notas_semestre(1) := 8.5;
    
    v_notas_semestre.EXTEND;
    v_notas_semestre(2) := 9.0;
    
    -- Se tentarmos dar um v_notas_semestre.EXTEND 6 vezes, o PL/SQL gerará um erro!
    DBMS_OUTPUT.PUT_LINE('Nota da Prova 1: ' || v_notas_semestre(1));
END;
/