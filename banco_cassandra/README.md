Querie 1
'Departamento.csv': "INSERT INTO departamento (nome, chefe) VALUES (%s, %s)"
 SELECT * from departamento

Querie 2
 'Curso.csv': "INSERT INTO curso (nome, id_curso) VALUES (%s, %s)"
  SELECT * from departamento

Querie 3
 'Disciplina.csv': "INSERT INTO disciplina (nome, codigo_disc) VALUES (%s, %s)"
  SELECT * from departamento

Querie 4
 'TCC.csv': "INSERT INTO tcc (tcc_grupo, id_grupo, id_orientador) VALUES (%s, %s, %s)"
  SELECT * from departamento

Querie 5
 'Aluno.csv': "INSERT INTO aluno (nome, idade, aluno_ra, id_grupo) VALUES (%s, %s, %s, %s)"
  SELECT * from departamento

Querie 6
 'Professor.csv': "INSERT INTO professor (nome, idade, professor_ra, id_orientador) VALUES (%s, %s, %s, %s, %s)"
  SELECT * from departamento

Querie 7
 'Hist_aluno.csv': "INSERT INTO historico (aluno_ra, codigo_disc, semestre, ano, nota) VALUES (%s, %s, %s, %s, %s)"
  SELECT * from departamento

Querie 8
 'Hist_prof.csv': "INSERT INTO historicoprof (professor_ra, codigo_disc, semestre, ano) VALUES (%s, %s, %s, %s)"
  SELECT * from departamento
