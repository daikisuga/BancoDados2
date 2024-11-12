
MATCH p=(Aluno)-[:Cursou]->(Curso) RETURN p 
MATCH p=(Professor)-[:Ensinou]->(Disciplina) RETURN p
Match p=(a:Aluno)-[:Cursou]->(Curso)
where a.formado = 1
return p
