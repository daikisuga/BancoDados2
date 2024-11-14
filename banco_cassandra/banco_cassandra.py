# Imports necessários para instalação do scylla
from cassandra.cluster import Cluster, ExecutionProfile, EXEC_PROFILE_DEFAULT
from cassandra.policies import DCAwareRoundRobinPolicy, TokenAwarePolicy
from cassandra.auth import PlainTextAuthProvider

def getCluster():
    profile = ExecutionProfile(load_balancing_policy=TokenAwarePolicy(DCAwareRoundRobinPolicy(local_dc='AWS_SA_EAST_1')))
    return Cluster(
        execution_profiles={EXEC_PROFILE_DEFAULT: profile},
        contact_points=[
            "node-0.aws-sa-east-1.9c47761f0c00f8c261e5.clusters.scylla.cloud",
            "node-1.aws-sa-east-1.9c47761f0c00f8c261e5.clusters.scylla.cloud",
            "node-2.aws-sa-east-1.9c47761f0c00f8c261e5.clusters.scylla.cloud"
        ],
        port=9042,
        auth_provider=PlainTextAuthProvider(username='scylla', password='I7LM85tWudQJxOU')
    )

print('Connecting to cluster...')
cluster = getCluster()
session = cluster.connect()

print('Connected to cluster %s' % cluster.metadata.cluster_name)

# Cria uma keyspace se não existir
keyspace_name = "keyspace"
replication_factor = 3

session.execute(
    f"""
    CREATE KEYSPACE IF NOT EXISTS {keyspace_name}
        WITH replication = {{'class': 'NetworkTopologyStrategy', 'AWS_SA_EAST_1': {replication_factor}}}
        AND durable_writes = true;
    """
)

# Seta a keyspace
session.set_keyspace(keyspace_name)

# Cria uma tabela, se uma de mesmo nome não existe, e coloca os valores e seus tipos
table_departamento = """
CREATE TABLE IF NOT EXISTS departamento (
    nome text,
    chefe text,
    PRIMARY KEY (nome)
)
"""
session.execute(table_departamento)

table_curso = """
CREATE TABLE IF NOT EXISTS curso(
    nome text,
    id_curso text,
    PRIMARY KEY (id_curso)
)
"""
session.execute(table_curso)

table_disciplina="""
CREATE TABLE IF NOT EXISTS disciplina(
    nome text,
    codigo_disc text,
    PRIMARY KEY(codigo_disc)
)
"""
session.execute(table_disciplina)

table_tcc = """
CREATE TABLE IF NOT EXISTS tcc(
    tcc_grupo text,
    id_grupo text,
    id_orientador text,
    PRIMARY KEY (tcc_grupo)
)
"""
session.execute(table_tcc)

table_aluno = """
CREATE TABLE IF NOT EXISTS aluno(
    nome text,
    idade int,
    aluno_ra text,
    id_grupo text,
    PRIMARY KEY (aluno_ra)
)
"""
session.execute(table_aluno)

table_professor="""
    CREATE TABLE IF NOT EXISTS professor(
        nome text,
        idade int,
        professor_ra text,
        id_orientador text,
        PRIMARY KEY (professor_ra)
    )
"""
session.execute(table_professor)

table_historico="""
    CREATE TABLE IF NOT EXISTS historico(
        aluno_ra text,
        codigo_disc text,
        semestre int,
        ano int,
        nota int,
        PRIMARY KEY(aluno_ra, codigo_disc)
    )
"""
session.execute(table_historicoprof)

table_historicoprof="""
    CREATE TABLE IF NOT EXISTS historicoprof(
        professor_ra text,
        codigo_disc text,
        semestre int,
        ano int,
        PRIMARY KEY(professor_ra, codigo_disc)
    )
"""
session.execute(table_historicoprof)

# Lista com arquivos .csv que podem ser lidos
csv_files = [
    'Departamento.csv',
    'Curso.csv',
    'Disciplina.csv',
    'TCC.csv',
    'Aluno.csv',
    'Professor.csv',
    'Hist_aluno.csv',
    'Hist_prof.csv'
]

# Função para inserir dados em tabelas
def insert_data_from_csv(csv_file, insert_query, session):
    try:
        # Abrir o .csv
        df = pd.read_csv(csv_file)
        
        # Tenta ler as linhas do dataframe e insere no banco
        for index, row in df.iterrows():
            session.execute(insert_query, tuple(row))
        print(f'Dados inseridos com sucesso de {csv_file}')
    except Exception as e:
        print(f'Erro ao inserir dados do arquivo {csv_file}: {e}')

# Insere os dados das colunas de cada .csv no banco
insert_queries = {
    'Departamento.csv': "INSERT INTO departamento (nome, chefe) VALUES (%s, %s)",
    'Curso.csv': "INSERT INTO curso (nome, id_curso) VALUES (%s, %s)",
    'Disciplina.csv': "INSERT INTO disciplina (nome, codigo_disc) VALUES (%s, %s)",
    'TCC.csv': "INSERT INTO tcc (tcc_grupo, id_grupo, id_orientador) VALUES (%s, %s, %s)",
    'Aluno.csv': "INSERT INTO aluno (nome, idade, aluno_ra, id_grupo) VALUES (%s, %s, %s, %s)",
    'Professor.csv': "INSERT INTO professor (nome, idade, professor_ra, id_orientador) VALUES (%s, %s, %s, %s, %s)",
    'Hist_aluno.csv': "INSERT INTO historico (aluno_ra, codigo_disc, semestre, ano, nota) VALUES (%s, %s, %s, %s, %s)",
    'Hist_prof.csv': "INSERT INTO historicoprof (professor_ra, codigo_disc, semestre, ano) VALUES (%s, %s, %s, %s)"
}

# Checa se o arquivo .csv informado esta na lista de arquivos, se estiver ele insere os dados
for csv_file in csv_files:
    insert_data_from_csv(csv_file, insert_queries[csv_file], session)

# Fechar a conexão
cluster.shutdown()