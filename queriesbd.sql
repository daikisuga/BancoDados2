/*Querie 1:*/
SELECT aluno.nome, disciplina.codigo, disciplina.nome, historico.semestre, historico.ano, historico.nota
FROM aluno
INNER JOIN historico ON aluno.ra = historico.id_alunoh
INNER JOIN disciplina ON historico.id_disciplinah = disciplina.codigo
WHERE aluno.nome = 'Gustavo';

/*Querie 2:*/
SELECT historicoprof.id_professorhp,d.codigo,d.nome,historicoprof.semestre, historicoprof.ano
FROM historicoprof
JOIN disciplina d ON historicoprof.id_disciplinahp = d.codigo
WHERE historicoprof.id_professorhp = '185906565';

/*Querie 3:*/
SELECT aluno.nome
FROM aluno
INNER JOIN historico ON aluno.ra = historico.id_alunoh
INNER JOIN disciplina ON historico.id_disciplinah = disciplina.codigo
WHERE historico.nota >= 5 AND historico.ano = '2004' AND historico.semestre = 'Segundo';

/*Querie 4:*/
SELECT professor.nome,d.nome
FROM professor
INNER JOIN departamento d ON professor.nome = d.chefe;

/*Querie 5:*/
SELECT aluno.nome, aluno.ra, t.tcc_grupo, p.nome
FROM aluno 
INNER JOIN tcc t ON aluno.tcc_a = t.tcc_grupo
INNER JOIN orientador o ON t.tcc_grupo = o.id_grupoo
INNER JOIN professor p ON o.id_professor = p.ra
WHERE t.tcc_grupo = '131201912';
