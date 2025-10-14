use biblioteca_leticia;

-- SELECT 1
-- Select onde os IDS são 3 e 5
SELECT titulo,descricao FROM Livro
WHERE
	id_livro = 3;
    
    
    
-- INSERT 1
-- Insert do novo gênero dentro de Categoria 
INSERT INTO Categoria(nome)
VALUES
	(
		'Técnico'
    );
SELECT * FROM Categoria;

-- Alter Table da tabela Livro
ALTER TABLE Livro
ADD COLUMN edicao VARCHAR(150),
ADD COLUMN data_publicacao DATE;
SELECT * FROM Livro;

-- Insert da tabela Autor
INSERT INTO Autor(nome,data_nascimento,biografia)
VALUES 
	(
		'Eric Matthes',
        '1913-07-25',
        'O senador Eric Randall Matthews, também um grande autor de livros de desenvolvimento'
    );
SELECT * FROM Autor;


-- Insert na tabela Livro
INSERT INTO Livro (titulo,descricao,quantidade_paginas,isbn,edicao,data_publicacao)
VALUES
	(
		'Python',
        'Livro sobre programação em Python do inciante até o avançado',
        '89',
        '652419890',
        '3° Edição',
        '2023-04-24'
    );
SELECT * FROM Livro;


-- Insert na tabela Categoria_Livro
INSERT INTO Categoria_Livro(id_livro,id_categoria)
VALUES
	(11,11);
SELECT * FROM Categoria_Livro;



-- UPDATE (3)

-- Update 1
-- Atualização do email do usuario
UPDATE Usuario
SET email = 'teste@email.com'
WHERE
	id_usuario =1;
SELECT * FROM Usuario;


-- Update 2
-- Correção do Título do Python
UPDATE Livro
SET titulo = 'Curso Intensivo de Python: uma Introdução Prática e Baseada em Projetos à Programação'
WHERE
	id_livro = 11;
SELECT * FROM Livro;


-- Marcação de livros publicados antes de 2000 como status = inativo
ALTER TABLE Livro
ADD COLUMN status ENUM('Ativo', 'Inativo') NOT NULL;
SELECT * FROM Livro;

-- Insert na tabela Livro
INSERT INTO Livro (titulo,descricao,quantidade_paginas,isbn,edicao,data_publicacao)
VALUES
	(
		'Java',
        'Livro sobre programação em Java do inciante até o avançado',
        '289',
        '82766662',
        '1° Edição',
        '1900-04-24'
    );

-- Update 3
-- Código
UPDATE Livro
SET status = 'Inativo'
WHERE data_publicacao < '2000-01-01';
SELECT * FROM Livro;



-- DELETE (4)
-- Delete 1, deletar livro de todas as tabelas que o utilizam
DELETE FROM autor_livro
WHERE id_livro = 2;

DELETE FROM categoria_livro
WHERE id_livro = 2;

DELETE FROM emprestimo
WHERE id_livro = 2;

DELETE FROM livro
WHERE id_livro = 2;


-- Delete 2
-- Insert do Usuário Teste Testador
INSERT INTO Usuario (nome,email,data_cadastro,nivel_associacao)
VALUES 
	('Teste Testador', 'testetestador@gmail.com','2023-09-23','Regular');
SELECT * FROM Usuario;

-- Delete do Usuário Teste Testador
DELETE FROM Usuario
WHERE
	nome = 'Teste Testador';
    
    
    
-- Delete 3    
-- Insert de um emprestimo no ano 202
insert into Emprestimo(id_usuario,id_livro,data_emprestimo,data_limite_devolucao,data_devolucao)
values
	(3,9,'2020-04-11','2020-04-29','2020-04-19');
SELECT * FROM Emprestimo;

   
-- Delete 4
-- Delete de empréstimo realizado no ano 2020
DELETE FROM Emprestimo
WHERE 
	data_emprestimo = '2020-04-11';
    

-- Desativar o bloqueio em usar UPDATE e DELETE dentro do banco 
SET SQL_SAFE_UPDATES = 0;