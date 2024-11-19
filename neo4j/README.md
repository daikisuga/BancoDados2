Querie 1  
MATCH p=(Aluno)-[:Cursou]->(Curso) RETURN p     

Querie 2  
MATCH p=(Professor)-[:Ensinou]->(Disciplina) RETURN p  

Querie 3  
Match p=(a:Aluno)-[:Cursou]->(Curso)    
where a.formado = 1     
return p     

Querie 4  
MATCH p=(Professor)-[:EhChefe]->(Departamento) RETURN p     
   
Querie 5  
match p=(Aluno)-[:Participa]->(TCC)    
return p   
