CREATE DATABASE projeto;
CREATE TABLE Alunos(
  Nome VARCHAR(255),
  RA VARCHAR(255),
  id_Curso Varchar(255),
  Semestre int,
  Tot_cred int,
  id_Tcc VARCHAR(10),
  formado int,
  PRIMARY KEY(RA)
);
CREATE TABLE Professores(
  Nome VARCHAR(255),
  id VARCHAR(255),
  Depart_id VARCHAR(255),
  PRIMARY KEY(id)
);
CREATE TABLE Cursos(
  Nome VARCHAR(255),
  id VARCHAR(255),
  Coordenador Varchar(255),
  PRIMARY KEY(id)
);
CREATE TABLE Departamentos(
  Nome VARCHAR(255),
  id VARCHAR(255),
  id_chefe Varchar(255),
  PRIMARY KEY(id)
);
CREATE TABLE Disciplinas(
  Nome VARCHAR(255),
  id VARCHAR(255),
  Depart_id Varchar(255),
  PRIMARY KEY(id)
);
CREATE TABLE MCC(
  id_curso VARCHAR(255),
  ciclo int,
  Nome_Curso VARCHAR(255),
  id_disc VARCHAR(255),
  Nome_disc VARCHAR(255)
);
CREATE TABLE TCC(
  Tcc_id VARCHAR(255),
  id_professor VARCHAR(255),
  PRIMARY KEY(Tcc_id)
);
CREATE TABLE Hist_a(
  id_aluno VARCHAR(255),
  id_curso VARCHAR(255),
  id_disciplinas VARCHAR(255),
  semestre int,
  ano int,
  nota int
);
CREATE TABLE Hist_p(
  id_professor VARCHAR(255),
  id_disciplina VARCHAR(255),
  id_curso VARCHAR(255),
  semestre int,
  ano int
);
CREATE TABLE Ensina(
  id_professor VARCHAR(255),
  id_disciplina VARCHAR(255)
);
CREATE TABLE Formado (
  RA VARCHAR(255),
  Ano INT,
  PRIMARY KEY (RA)
);

insert into Alunos (Nome, RA, id_curso, Semestre, Tot_cred, Id_tcc, formado) values ('Briney Crips',     '7144486071', '5356',  1, 1,   '716',1);
insert into Alunos (Nome, RA, id_curso, Semestre, Tot_cred, Id_tcc, formado) values ('Hunt Burberry',    '6390410948', '5356',    2, 2,   '634',0);
insert into Alunos (Nome, RA, id_curso, Semestre, Tot_cred, Id_tcc, formado) values ('Merralee Aiken',   '8676755329', '9583',    3, 3,   '716',0);
insert into Alunos (Nome, RA, id_curso, Semestre, Tot_cred, Id_tcc, formado) values ('Jerry Summerson',  '5370601909', '9583',     4, 4,   '634',0);
insert into Alunos (Nome, RA, id_curso, Semestre, Tot_cred, Id_tcc, formado) values ('Carey Gillingham', '4581949548', '9876', 5, 5,   '716',1);
insert into Alunos (Nome, RA, id_curso, Semestre, Tot_cred, Id_tcc, formado) values ('Giana Harback',    '2884642765', '9876',     6, 6,   '',1);
insert into Alunos (Nome, RA, id_curso, Semestre, Tot_cred, Id_tcc, formado) values ('Leland Jimes',     '6703616205', '1914',  7, 7,   '565',0);
insert into Alunos (Nome, RA, id_curso, Semestre, Tot_cred, Id_tcc, formado) values ('Nicola Arro',      '5913577698', '1914',   8, 8,   '565',1);
insert into Alunos (Nome, RA, id_curso, Semestre, Tot_cred, Id_tcc, formado) values ('Conrad Spears',    '5591245617', '1521',  9, 9,   '',0);
insert into Alunos (Nome, RA, id_curso, Semestre, Tot_cred, Id_tcc, formado) values ('Edita Heustace',   '1040251110', '1521',     10, 10, '',0);

insert into Departamentos (Nome, id, id_chefe) values ('Ciências da Computação', 'CC', '88580');
insert into Departamentos (Nome, id, id_chefe) values ('Administração', 'AD', '24486');
insert into Departamentos (Nome, id, id_chefe) values ('Eng. Elétrica', 'EE', '55321');
insert into Departamentos (Nome, id, id_chefe) values ('Física', 'FI', '99154');
insert into Departamentos (Nome, id, id_chefe) values ('Estudos Sociais', 'ES', '20783');

insert into Disciplinas (Nome, id, Depart_id) values ('Python', '7615', 'CC');
insert into Disciplinas (Nome, id, Depart_id) values ('C', '0842', 'CC');
insert into Disciplinas (Nome, id, Depart_id) values ('Eng. de Software', '6057', 'CC');
insert into Disciplinas (Nome, id, Depart_id) values ('Estatística', '1014', 'AD');
insert into Disciplinas (Nome, id, Depart_id) values ('Cálculo', '1983', 'FI');
insert into Disciplinas (Nome, id, Depart_id) values ('Termodinâmica', '9882', 'FI');
insert into Disciplinas (Nome, id, Depart_id) values ('Circuitos', '1248', 'EE');
insert into Disciplinas (Nome, id, Depart_id) values ('Sociologia', '8598', 'ES');
insert into Disciplinas (Nome, id, Depart_id) values ('Filosofia', '7927', 'ES');
insert into Disciplinas (Nome, id, Depart_id) values ('Estudo Social Cristão', '5890', 'ES');
insert into Disciplinas (Nome, id, Depart_id) values ('Macroeconomia', '1880', 'AD');
insert into Disciplinas (Nome, id, Depart_id) values ('Sistemas Digitais', '3448', 'EE');
insert into Disciplinas (Nome, id, Depart_id) values ('Gestão', '8940', 'AD');
insert into Disciplinas (Nome, id, Depart_id) values ('Mecânica Geral', '4847', 'FI');
insert into Disciplinas (Nome, id, Depart_id) values ('Microprocessadores', '4296', 'EE');

insert into Cursos (Nome, id, Coordenador) values ('Ciências da computação', '5356', '88580');
insert into Cursos (Nome, id, Coordenador) values ('Eng. Elétrica', '9583', '90276');
insert into Cursos (Nome, id, Coordenador) values ('Administração', '9876', '99154');
insert into Cursos (Nome, id, Coordenador) values ('Eng. Automotiva', '1914', '24486');
insert into Cursos (Nome, id, Coordenador) values ('Eng. Civil', '1521', '20783');

insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('5356',1,'Ciências da computação','7615','Python');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('5356',2,'Ciências da computação','0842','C');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('5356',3,'Ciências da computação','5890','Estudo Social Cristão');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('5356',4,'Ciências da computação','1983','Cálculo');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('9583',1,'Eng. Elétrica','1248','Circuitos');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('9583',2,'Eng. Elétrica','3448','Sistemas Digitais');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('9876',1,'Administração','8940','Gestão');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('9876',2,'Administração','1880','Macroeconomia');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('1914',1,'Eng. Automotiva','4847','Mecânica Geral');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('1914',2,'Eng. Automotiva','1248','Circuitos');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('1521',1,'Eng. Civil','9882','Termodinâmica');
insert into MCC (id_curso, ciclo, Nome_curso, id_disc, Nome_disc) values ('1521',2,'Eng. Civil','1983','Cálculo');

insert into Professores (Nome, id, Depart_id) values ('Cléber','88580','CC');
insert into Professores (Nome, id, Depart_id) values ('João','90276','AD');
insert into Professores (Nome, id, Depart_id) values ('Cleiton','99154','EE');
insert into Professores (Nome, id, Depart_id) values ('Rosana','24486','FI');
insert into Professores (Nome, id, Depart_id) values ('Maria','20783','ES');
insert into Professores (Nome, id, Depart_id) values ('Paulo','57452','CC');
insert into Professores (Nome, id, Depart_id) values ('Nicole','55321','FI');

insert into Ensina (id_professor, id_disciplina) values ('88580','7615');
insert into Ensina (id_professor, id_disciplina) values ('88580','0842');
insert into Ensina (id_professor, id_disciplina) values ('90276','8940');
insert into Ensina (id_professor, id_disciplina) values ('99154','1248');
insert into Ensina (id_professor, id_disciplina) values ('99154','3448');
insert into Ensina (id_professor, id_disciplina) values ('24486','9882');
insert into Ensina (id_professor, id_disciplina) values ('20783','5890');
insert into Ensina (id_professor, id_disciplina) values ('57452','1983');
insert into Ensina (id_professor, id_disciplina) values ('55321','4847');
insert into Ensina (id_professor, id_disciplina) values ('55321','9882');

insert into TCC (Tcc_id, id_professor) values ('716','88580');
insert into TCC (Tcc_id, id_professor) values ('634','99154');
insert into TCC (Tcc_id, id_professor) values ('565','20783');

insert into Hist_p (id_professor, id_disciplina, id_curso, semestre, ano) values ('88580','7615','5356',1,2018);
insert into Hist_p (id_professor, id_disciplina, id_curso, semestre, ano) values ('90276','1014','9876',2,2015);
insert into Hist_p (id_professor, id_disciplina, id_curso, semestre, ano) values ('99154','1983','1914',3,2013);
insert into Hist_p (id_professor, id_disciplina, id_curso, semestre, ano) values ('24486','1248','9583',2,2020);
insert into Hist_p (id_professor, id_disciplina, id_curso, semestre, ano) values ('20783','8598','1521',2,2018);
insert into Hist_p (id_professor, id_disciplina, id_curso, semestre, ano) values ('57452','0842','5356',3,2024);
insert into Hist_p (id_professor, id_disciplina, id_curso, semestre, ano) values ('55321','3448','9583',4,2021);

insert into Hist_a(id_aluno, id_curso, id_disciplinas, semestre, ano, nota) values ('7144486071','5356','7615',1,2014,5.7);
insert into Hist_a(id_aluno, id_curso, id_disciplinas, semestre, ano, nota) values ('6390410948','5356','6057',2,2010,4.7);
insert into Hist_a(id_aluno, id_curso, id_disciplinas, semestre, ano, nota) values ('8676755329','9583','9882',3,2013,8);
insert into Hist_a(id_aluno, id_curso, id_disciplinas, semestre, ano, nota) values ('5370601909','9583','8598',2,2002,9.3);
insert into Hist_a(id_aluno, id_curso, id_disciplinas, semestre, ano, nota) values ('4581949548','9876','7927',3,2010,2.5);
insert into Hist_a(id_aluno, id_curso, id_disciplinas, semestre, ano, nota) values ('2884642765','9876','1880',1,2020,5.3);
insert into Hist_a(id_aluno, id_curso, id_disciplinas, semestre, ano, nota) values ('6703616205','1914','3448',4,2012,4);
insert into Hist_a(id_aluno, id_curso, id_disciplinas, semestre, ano, nota) values ('5913577698','1914','0842',2,2011,7.8);
insert into Hist_a(id_aluno, id_curso, id_disciplinas, semestre, ano, nota) values ('5591245617','1521','8940',1,2013,5.6);
insert into Hist_a(id_aluno, id_curso, id_disciplinas, semestre, ano, nota) values ('1040251110','1521','4296',4,2009,8.4);

insert into Formado (RA, Ano) Values ('7144486071', 2010);
insert into Formado (RA, Ano) Values ('4581949548', 2010);
insert into Formado (RA, Ano) Values ('2884642765', 2010);
insert into Formado (RA, Ano) Values ('5913577698', 2020);

select a.nome, h.id_disciplinas, d.nome, h.semestre, h.ano, h.nota from hist_a as h, alunos as a, disciplinas as d
where h.id_aluno = a.ra
and h.id_disciplinas = d.id
and a.nome = 'Leland Jimes';

select p.nome, d.nome, h.semestre, h.ano from professores as p, hist_p as h, disciplinas as d
where p.id = h.id_professor
and h.id_disciplina = d.id
and p.nome = 'Maria';

select a.nome, a.ra, a.semestre, a.id_curso, a.formado from alunos as a
inner join formado on a.ra = formado.ra
where formado.ano = 2010;

select p.nome, d.nome from professores as p, departamentos as d
where p.id = d.id_chefe;

select t.tcc_id, a.nome, p.nome from alunos as a, professores as p, tcc as t
where a.id_tcc = t.tcc_id
and p.id = t.id_professor
order by p.nome;
