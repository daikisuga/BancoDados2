CREATE DATABASE projeto;

CREATE TABLE departamento(
  nome VARCHAR(20),
  chefe VARCHAR(30),
  PRIMARY KEY(nome)
);

CREATE TABLE curso(
  nome VARCHAR(30),
  id_curso VARCHAR(2),
  id_deptoc VARCHAR(20),
  PRIMARY KEY (id_curso),
  FOREIGN KEY (id_deptoc) REFERENCES departamento(nome)
);

CREATE TABLE disciplina(
  nome VARCHAR(30),
  id_cursot VARCHAR(2),
  codigo VARCHAR(10),
  PRIMARY KEY(codigo),
  FOREIGN KEY (id_cursot) REFERENCES curso(id_curso)
);

CREATE TABLE tcc(
  tcc_grupo VARCHAR(9),
  PRIMARY KEY (tcc_grupo)
);

CREATE TABLE aluno(
  nome VARCHAR(30),
  idade INT,
  id_cursoa VARCHAR(2),
  ra VARCHAR(9),
  tcc_a VARCHAR(9),
  PRIMARY KEY(ra),
  FOREIGN KEY (id_cursoa) REFERENCES curso(id_curso),
  FOREIGN KEY (tcc_a) REFERENCES tcc(tcc_grupo)
);

CREATE TABLE professor(
  nome VARCHAR(30),
  idade INT,
  id_deptop VARCHAR(20),
  id_disciplinap VARCHAR(10),
  ra VARCHAR(9),
  PRIMARY KEY(ra),
  FOREIGN KEY (id_deptop) REFERENCES departamento(nome),
  FOREIGN KEY (id_disciplinap) REFERENCES disciplina(codigo)
);

CREATE TABLE orientador(
  id_grupoo VARCHAR(9),
  id_professor VARCHAR(9),
  FOREIGN KEY (id_grupoo) REFERENCES tcc(tcc_grupo),
  FOREIGN KEY (id_professor) REFERENCES professor(ra)
);

CREATE TABLE historico(
  id_alunoh VARCHAR(9),
  nota FLOAT(2),
  semestre VARCHAR(10),
  ano VARCHAR(10),
  id_disciplinah VARCHAR(10),
  FOREIGN KEY (id_alunoh) REFERENCES aluno(ra),
  FOREIGN KEY (id_disciplinah) REFERENCES disciplina(codigo)
);

CREATE TABLE historicoprof(
  id_professorhp VARCHAR(9),
  id_disciplinahp VARCHAR(10),
  semestre VARCHAR(10),
  ano VARCHAR(10),
  FOREIGN KEY (id_professorhp) REFERENCES professor(ra),
  FOREIGN KEY (id_disciplinahp) REFERENCES disciplina(codigo)
);
