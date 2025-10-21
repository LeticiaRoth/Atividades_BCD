USE BibliotecaOnline;

-- EXERCICIO 1
SELECT Livro.titulo, Categoria.nome
FROM LivroCategoria
INNER JOIN Livro ON Livro.id = LivroCategoria.livro_id
INNER JOIN Categoria ON Categoria.id = LivroCategoria.categoria_id
WHERE Categoria.nome = "Mistério"
ORDER BY Livro.titulo ASC;

-- EXERCICIO 2
SELECT titulo,isbn
FROM Livro
WHERE titulo LIKE "O%";

-- EXERCICIO 3
SELECT nome, nivel_associacao
FROM Usuario
WHERE data_cadastro > "2023-06-01";

-- EXERCICIO 4
SELECT nome
FROM Autor
WHERE data_nascimento IS NULL;

-- EXERCICIO 5
SELECT titulo, descricao
FROM Livro
WHERE descricao IS NOT NULL;

-- EXERCICIO 6
SELECT nome, data_cadastro
FROM Usuario
WHERE nivel_associacao IN ('regular', 'premium');

-- EXERCICIO 7 
SELECT id, titulo, isbn, descricao
FROM Livro
WHERE id BETWEEN 303 AND 306;

-- EXERCICIO 8
SELECT nome,email
FROM Usuario
WHERE nome NOT LIKE "M%";

-- EXERCICIO 9
SELECT Livro.titulo
FROM Emprestimo
INNER JOIN Livro ON Emprestimo.livro_id = Livro.id
WHERE data_devolucao IS NULL;

-- EXERCICIO 10 
SELECT id, titulo, isbn, descricao
FROM Livro
LIMIT 5;

-- EXERCICIO 11
SELECT id,titulo, isbn, descricao
FROM Livro
LIMIT 5 OFFSET 3;

-- EXERCICIO 12
SELECT titulo
FROM Livro
WHERE titulo LIKE "_____rry";

-- EXERCICIO 13
SELECT nome
FROM Usuario
WHERE nivel_associacao = "premium" AND data_cadastro > "2023-07-01-";

-- EXERCICIO 14
SELECT Livro.titulo
FROM LivroCategoria
INNER JOIN Livro ON Livro.id = LivroCategoria.livro_id
INNER JOIN Categoria ON Categoria.id = LivroCategoria.categoria_id
WHERE (Categoria.nome = "Ficção" OR Categoria.nome = "Mistério") 
	AND Livro.descricao IS NOT NULL;
    

-- EXERCICIO 15
SELECT Livro.titulo, Autor.nome, Categoria.nome
FROM Emprestimo
-- Pega o titulo do livro
INNER JOIN Livro ON Livro.id = Emprestimo.livro_id
INNER JOIN LivroAutor ON Livro.id = LivroAutor.livro_id
-- Pega o nome do autor
INNER JOIN Autor ON LivroAutor.autor_id = Autor.id
INNER JOIN LivroCategoria ON Livro.id = LivroCategoria.livro_id
-- Pega o nome da categoria
INNER JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id

WHERE Emprestimo.data_emprestimo BETWEEN '2024-01-01' AND '2024-02-29'
  AND Livro.titulo LIKE 'O%'
  AND Livro.descricao IS NOT NULL
  AND Categoria.nome IN ('Mistério', 'Ficção', 'Fantasia')
  AND Autor.nome LIKE '%a%'
ORDER BY Livro.titulo ASC;
