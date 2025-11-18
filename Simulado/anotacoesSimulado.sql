USE GameZoneDB;

-- 1
SELECT jogo.nome, jogador.nome
FROM jogo
INNER JOIN compra ON jogo.id = compra.jogo_id
INNER JOIN jogador ON jogador.id = compra.jogador_id
WHERE ano_lancamento >= 2023;

-- 2
SELECT jogador.nome, jogo.nome, genero.nome, compra.data_compra
FROM jogador
JOIN compra ON jogador.id = compra.jogador_id
JOIN jogo ON jogo.id = compra.jogo_id
JOIN genero ON genero.id = jogo.genero_id
WHERE genero.nome = "Aventura"
ORDER BY data_compra ASC;

-- 3
SELECT jogador.nome, AVG(avaliacaojogo.nota)
FROM avaliacaojogo
LEFT JOIN jogador ON avaliacaojogo.jogador_id = jogador.id
GROUP BY jogador_id;

-- Pois precisa mostrar o nulo
SELECT Jogador.nome, AVG(AvaliacaoJogo.nota) AS media_nota
FROM Jogador
-- o que vem antes é a esquerda no cado jogadorm e depois 
LEFT JOIN AvaliacaoJogo ON AvaliacaoJogo.jogador_id = Jogador.id
-- agrupa pelo nome, pois estou usando o nome la em cima
GROUP BY Jogador.nome;


-- 4
SELECT jogador.nome, jogo.preco
FROM jogo
JOIN compra ON compra.jogo_id = jogo.id
JOIN jogador ON compra.jogador_id = jogador.id
WHERE jogo.preco > (SELECT AVG(preco) from JOGO);

-- 5
SELECT upper(nome) as nome,
LEFT (nome,2) as apelido
FROM jogador;

-- 6
SELECT AVG(nota)
FROM avaliacaojogo;

-- 7
SELECT genero.nome, AVG(nota) AS total
FROM avaliacaojogo
INNER JOIN jogo ON avaliacaojogo.jogo_id = jogo.id
INNER JOIN genero ON jogo.genero_id = genero.id
WHERE total > 8.5;


SELECT Genero.nome, AVG(AvaliacaoJogo.nota) AS media_genero
FROM Genero
JOIN Jogo ON Jogo.genero_id = Genero.id
JOIN AvaliacaoJogo ON AvaliacaoJogo.jogo_id = Jogo.id
GROUP BY Genero.nome
HAVING AVG(AvaliacaoJogo.nota) > 8.5
ORDER BY media_genero DESC;