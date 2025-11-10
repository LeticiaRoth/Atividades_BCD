USE BibliotecaOnline;

-- Exercicio 1
SELECT nome, YEAR(data_cadastro) FROM Usuario;

-- Exercicio 2
SELECT nome, MONTH(data_nascimento) FROM Autor;

-- Exercicio 3
SELECT usuario.nome, livro.titulo, emprestimo.data_emprestimo, emprestimo.data_devolucao,
DATEDIFF(emprestimo.data_devolucao, emprestimo.data_emprestimo) AS dias_uso
FROM emprestimo
JOIN livro ON emprestimo.livro_id = livro.id
JOIN usuario ON emprestimo.usuario_id = usuario.id
WHERE emprestimo.data_devolucao IS NOT NULL;

-- Exercicio 4
SELECT livro.titulo, DATE_FORMAT(emprestimo.data_emprestimo, "%d/%m/%y")
FROM emprestimo
JOIN livro ON emprestimo.livro_id = livro.id;

-- Exercicio 5
SELECT data_cadastro, DAYNAME(data_cadastro) FROM usuario;

-- Exercicio 6

-- Exercicio 7

-- Exercicio 8
SELECT UPPER(nome) FROM usuario;

-- Exercicio 9
SELECT LEFT(titulo, 5) FROM livro;

-- Exercicio 10
SELECT CONCAT(nome, '-' ,email) FROM usuario;

-- Exercicio 11
SELECT REPLACE(nome, 'a', '@') FROM usuario;

-- Exercicio 12
SELECT nome, LENGTH(nome) FROM usuario;

-- Exercicio 13
SELECT COUNT(id) FROM usuario;

-- Exercicio 14
-- Dentro para fora
SELECT AVG(DATEDIFF(data_devolucao, data_emprestimo)) AS dias
FROM emprestimo
WHERE data_devolucao IS NOT NULL;

 -- Exercicio 15
 SELECT MIN(DATEDIFF(data_devolucao,data_emprestimo)), MAX(DATEDIFF(data_devolucao,data_emprestimo)) FROM emprestimo;
 
