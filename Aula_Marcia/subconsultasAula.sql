-- SUBCONSULTAS

-- WHERE (Slide 9)
SELECT Nome_Produto, Preco
FROM Produtos
WHERE ID_Categoria = (
    SELECT ID_Categoria
    FROM Categorias
    WHERE Nome_Categoria = 'Eletrônicos'
);

-- OPERADORES (IN e NOT IN)
-- IN (Slide 18)
SELECT Nome_Produto, Preco
FROM Produtos
WHERE ID_Fornecedor IN (
    SELECT ID_Fornecedor
    FROM Fornecedores
    WHERE Pais = 'EUA'
);

-- IN NOT (Slide 26)
SELECT Nome_Produto, Preco
FROM Produtos
WHERE ID_Fornecedor NOT IN (
    SELECT ID_Fornecedor
    FROM Fornecedores
    WHERE Pais = 'EUA'
);

-- OPERADORES (ANY e ALL)
-- ANY (Slide 35)
SELECT Nome_Produto, Preco FROM Produtos
WHERE Preco > ANY (
    SELECT Preco 
    FROM Produtos 
    WHERE ID_Categoria = 2
);

-- ALL (Slide 38)
SELECT Nome_Produto, Preco FROM Produtos
WHERE Preco > ALL (
    SELECT Preco 
    FROM Produtos 
    WHERE ID_Categoria = 2
);

-- OPERADORES EXISTS e NOT EXISTS
-- EXISTS (Slide 43)
SELECT Nome_Categoria
FROM Categorias
WHERE EXISTS (
	SELECT *
    FROM Produtos
    WHERE Produtos.ID_Categoria = Categorias.ID_Categoria
);

-- NOT EXISTS (Slide 45)
SELECT Nome_Fornecedor
FROM Fornecedores
WHERE NOT EXISTS (
   SELECT 1
    FROM Produtos
    WHERE Produtos.ID_Fornecedor = Fornecedores.ID_Fornecedor
);


-- FROM (Slide 48)
SELECT Nome_Categoria, Media_Preco_Categoria
FROM (
 SELECT
 C.Nome_Categoria,
 AVG(P.Preco) AS Media_Preco_Categoria
 FROM Produtos AS P
 JOIN Categorias AS C ON P.ID_Categoria = C.ID_Categoria
 GROUP BY C.Nome_Categoria
) AS Tabela_Medias
WHERE Media_Preco_Categoria > 100;


-- SELECT (Slide 60)
SELECT
 Nome_Categoria,
 (
 SELECT COUNT(*)
 FROM Produtos
 WHERE Produtos.ID_Categoria = Categorias.ID_Categoria
 ) AS Quantidade_Produtos
FROM Categorias;
