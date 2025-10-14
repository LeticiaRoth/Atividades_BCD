USE biblioteca_leticia;

SELECT 
	Livro.titulo, 
    Autor.nome AS autor,
    Categoria.nome AS genero,
    Usuario.nome,
    Emprestimo.data_emprestimo,
    Emprestimo.data_limite_devolucao
    
FROM Emprestimo
INNER JOIN Usuario ON Usuario.id_usuario = Emprestimo.id_usuario
INNER JOIN Livro ON Livro.id_livro = Emprestimo.id_livro

-- Preciso ligar elas o Autor_Livro, para ela existir 
INNER JOIN Autor_Livro ON Autor_Livro.id_livro = Livro.id_livro
INNER JOIN Autor ON Autor.id_autor = Autor_Livro.id_autor

-- Preciso ligar Categoria_Livro, para ela existir
INNER JOIN Categoria_Livro ON Livro.id_livro = Categoria_Livro.id_livro
INNER JOIN Categoria ON Categoria.id_categoria = Categoria_Livro.id_categoria ;




