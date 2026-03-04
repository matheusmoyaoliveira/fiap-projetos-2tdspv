import oracledb as oracledb # type: ignore
import time

# 1. Configuração da Conexão
conn = oracledb.connect(
    user="SEU RA",
    password="SUA_SENHA",
    dsn="oracle.fiap.com.br:1521/orcl"
)
cursor = conn.cursor()

# Preparando o ambiente de teste
cursor.execute("BEGIN EXECUTE IMMEDIATE 'DROP TABLE alunos_teste'; EXCEPTION WHEN OTHERS THEN NULL; END;")
cursor.execute("CREATE TABLE alunos_teste (id NUMBER, nome VARCHAR2(50))")

qtd_registros = 10000

# --- ABORDAGEM A: SEM BIND (LITERAIS) ---
# O banco precisa processar (Parse) cada comando individualmente.
print("Executando SEM bind...")
inicio_a = time.time()
for i in range(qtd_registros):
    # O valor é "soldado" na string SQL. O Oracle vê 1000 comandos diferentes.
    sql = f"INSERT INTO alunos_teste VALUES ({i}, 'Aluno {i}')"
    cursor.execute(sql)
fim_a = time.time()

# --- ABORDAGEM B: COM BIND (PARÂMETROS) ---
# O banco processa o comando uma única vez e apenas troca os valores.
cursor.execute("TRUNCATE TABLE alunos_teste")
print("Executando COM bind...")
inicio_b = time.time()

# O SQL usa um "placeholder" (:id e :nome)
sql_bind = "INSERT INTO alunos_teste VALUES (:id, :nome)"
for i in range(qtd_registros):
    # Passamos os dados separadamente da estrutura do comando
    cursor.execute(sql_bind, [i, f"Aluno {i}"])
    
fim_b = time.time()

# 3. Resultados
print(f"\nTempo SEM Bind: {fim_a - inicio_a:.4f} segundos")
print(f"Tempo COM Bind: {fim_b - inicio_b:.4f} segundos")

cursor.close()
conn.close()