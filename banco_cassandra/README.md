'Departamento.csv': "INSERT INTO departamento (nome, chefe) VALUES (%s, %s)",  
'Curso.csv': "INSERT INTO curso (nome, id_curso) VALUES (%s, %s)",  
'Disciplina.csv': "INSERT INTO disciplina (nome, codigo_disc) VALUES (%s, %s)",  
'TCC.csv': "INSERT INTO tcc (tcc_grupo, id_grupo, id_orientador) VALUES (%s, %s, %s)",  
'Aluno.csv': "INSERT INTO aluno (nome, idade, aluno_ra, id_grupo) VALUES (%s, %s, %s, %s)",  
'Professor.csv': "INSERT INTO professor (nome, idade, professor_ra, id_orientador) VALUES (%s, %s, %s, %s, %s)",  
'Hist_aluno.csv': "INSERT INTO historico (aluno_ra, codigo_disc, semestre, ano, nota) VALUES (%s, %s, %s, %s, %s)",  
'Hist_prof.csv': "INSERT INTO historicoprof (professor_ra, codigo_disc, semestre, ano) VALUES (%s, %s, %s, %s)"  
