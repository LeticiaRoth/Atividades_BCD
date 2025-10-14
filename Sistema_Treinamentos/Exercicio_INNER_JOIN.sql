USE sistema_treinamentos;

-- 1) Nome do aluno e turma
SELECT 
	alunos.nome AS Aluno,
    turmas.nome AS Turma
FROM alunos
INNER JOIN turmas ON turmas.id = alunos.turma_id;

-- 2) Listagem atividades realizadas
SELECT 
	atividades.descricao,
    turmas.nome as Turma,
    materias.nome AS Materia,
    instrutores.nome AS Instrutor

FROM atividades
INNER JOIN turmas ON atividades.turma_id = turmas.id
INNER JOIN materias ON atividades.materia_id = materias.id
INNER JOIN instrutores ON atividades.instrutor_id = instrutores.id;


-- 3) Nome do instrutor e da materia
SELECT 
	instrutores.nome AS Instrutor,
    materias.nome AS Materia
    
FROM instrutores
INNER JOIN instrutor_materia ON instrutor_materia.instrutor_id = instrutores.id
INNER JOIN materias ON instrutor_materia.materia_id = materias.id;


-- 4) Exibição da descrição, nome e especialidade do instrutor
SELECT
	atividades.descricao,
    instrutores.nome AS Instrutor,
    instrutores.especialidade AS Especialidade
FROM atividades
INNER JOIN instrutores ON instrutores.id = atividades.instrutor_id;


-- 5) Descrição das atividades, data inicio, termino e nome da materia
SELECT
	atividades.descricao,
    turmas.data_inicio,
    turmas.data_fim,
    materias.nome AS Materia
FROM atividades
INNER JOIN materias ON materias.id = atividades.materia_id
INNER JOIN turmas ON turmas.id = atividades.turma_id;


-- 6) Nome de cada aluno, turma, descrição da atividade, nome da materia e do instrutor
SELECT
	alunos.nome AS Aluno,
    turmas.nome AS Turma,
    atividades.descricao AS Atividade,
    materias.nome AS Materia,
    instrutores.nome AS Instrutor
FROM atividades
INNER JOIN turmas ON turmas.id = atividades.turma_id
INNER JOIN materias ON materias.id = atividades.materia_id
INNER JOIN instrutores ON instrutores.id = atividades.instrutor_id
INNER JOIN alunos ON alunos.turma_id = turmas.id;
