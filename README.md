# BancoDados2
Trabalho em grupo - Topicos avancados de banco de dados
# ProjetoDB
### Integrantes:  

# Como utilizar o código
Para utilizar o código, o usuário deverá copiar o código das tabelas e das inserções e colocar no banco de dados, após isso, copiar a querie que deseja(posicionadas ao fim do código) e colocar no banco de dados, estão presentes os códigos: Criação das tabelas, Inserção de dados nas tabelas e as queries solicitadas. As tabelas criadas são as de Alunos, Professores, Cursos, TCC, Departamento, Disciplinas, Matriz curricular de cursos, Histórico de aluno e professor, Formado (Quais alunos já se formaram) e Ensina (as matérias que um professor ensina). Os dados inseridos foram feitos com auxílio do site Mockaroo. As queries solicitadas estão disponíveis ao fim do código e mostram os dados requisitados pelo usuário. O código foi realizado e testado devidamento no site CockroachDB.
# Diagrama Relacional
```mermaid
erDiagram
    Alunos {
        string Nome
        string RA pk
        string id_Curso
        int Semestre
        int Tot_cred
        string id_tcc
        int formado
    }
    Professores {
        string Nome
        string Id pk
        string id_Departamento
    }
    Cursos {
        string id pk
        string Nome
        string Cordenador
    }
    Departamentos {
        string Id pk
        string Nome
        string Id_chefe
    }
    Disciplinas {
        string Id pk
        string Nome
        string Departamento
    }
    MCC {
        string id_curso
        int Semestre
        string Nome_Curso
        string id_disc
        string Nome_disc
    }
    TCC {
        string TCC_id pk
        string Id_professor
    }
    Hist_a {
        string Id_Aluno
        string Id_Curso
        string Id_disciplina
        int Semestre
        int ano
        int nota
    }
    Hist_p {
        string Id_Professor
        string Id_disciplina
        string Id_Curso
        int Semestre
        int ano
    }
    Formado{
        string RA pk
        int ano
    }
    Ensina{
        string id_disciplina
        string id_professor
    }

    Alunos }|--|{ Professores : leciona
    Alunos }|--|| Cursos : Cursa
    Alunos }|--|| TCC : Participa
    Alunos ||--|| Hist_a : Pertence
    Alunos |o--o| Formado : Esta

    Professores }|--|{ Ensina : Ensina
    Professores ||--o| Cursos : Coordena
    Professores ||--o| Departamentos : Chefia
    Professores ||--|{ TCC : Orienta
    Professores ||--|| Hist_p : Pertence

    Cursos ||--|| Formado : Foi
    Cursos }|--|| MCC : Possui
    Cursos }|--|{ Disciplinas : Possui

    Disciplinas }|--|{ Ensina : Inclui
    Disciplinas }|--|| MCC : Possui

    Departamentos ||--|{ Disciplinas : Possui
```
