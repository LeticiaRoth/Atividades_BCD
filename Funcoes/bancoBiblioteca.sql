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
SELECT Emprestimo.id,Livro.titulo,Usuario.nome AS usuario,Emprestimo.data_devolucao,Emprestimo.data_devolucao_limite,
	ABS(DATEDIFF(Emprestimo.data_devolucao, Emprestimo.data_devolucao_limite)) AS diferenca_absoluta,
    DATEDIFF(Emprestimo.data_devolucao, Emprestimo.data_devolucao_limite) AS diferenca_normal
FROM Emprestimo
JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
JOIN Livro ON Emprestimo.livro_id = Livro.id
WHERE Emprestimo.data_devolucao IS NOT NULL;

-- Exercicio 7
SELECT Emprestimo.id, Livro.titulo, Usuario.nome AS usuario,Emprestimo.data_devolucao,Emprestimo.data_devolucao_limite,
    ROUND(
        CASE
            WHEN Emprestimo.data_devolucao > Emprestimo.data_devolucao_limite
            THEN DATEDIFF(Emprestimo.data_devolucao, Emprestimo.data_devolucao_limite) * 1
            ELSE 0
        END, 2
    ) AS valor_multa
FROM Emprestimo

JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
JOIN Livro ON Emprestimo.livro_id = Livro.id

WHERE Emprestimo.data_devolucao IS NOT NULL;

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
 
-- Exercicio 16
SELECT nivel_associacao, COUNT(*) AS usuarios_totais
FROM Usuario
GROUP BY nivel_associacao;

-- Exercicio 17
SELECT Usuario.nome AS Usuario, COUNT(Emprestimo.livro_id) AS emprestimos_totais
FROM Emprestimo
JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
GROUP BY Usuario.nome;

-- Exercicio 18
SELECT YEAR(data_emprestimo) AS ano, MONTH(data_emprestimo) AS mes, COUNT(*) AS total_emprestimos
FROM Emprestimo
GROUP BY YEAR(data_emprestimo), MONTH(data_emprestimo)
ORDER BY ano, mes;

-- Exercicio 19
SELECT Categoria.nome AS categoria,COUNT(LivroCategoria.livro_id) AS total_livros
FROM LivroCategoria
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id
GROUP BY Categoria.nome;

-- Exercicio 20
SELECT nivel_associacao,COUNT(*) AS total_usuarios
FROM Usuario
GROUP BY nivel_associacao
HAVING COUNT(*) > 3;
    
-- Exercicio 21
SELECT Usuario.nome AS usuario,COUNT(Emprestimo.id) AS total_emprestimos
FROM Emprestimo
JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
GROUP BY Usuario.nome
HAVING COUNT(Emprestimo.id) > 1;

-- Exercicio 22
SELECT YEAR(data_emprestimo) AS ano,MONTH(data_emprestimo) AS mes,COUNT(*) AS total_emprestimos
FROM Emprestimo
GROUP BY YEAR(data_emprestimo), MONTH(data_emprestimo)
HAVING COUNT(*) > 2
ORDER BY ano, mes;

-- Exercicio 23
SELECT Categoria.nome AS categoria,COUNT(LivroCategoria.livro_id) AS total_livros
FROM LivroCategoria
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id
GROUP BY Categoria.nome
HAVING COUNT(LivroCategoria.livro_id) > 1;