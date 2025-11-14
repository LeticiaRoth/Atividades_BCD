USE bcd_subconsulta;

-- Exercicio 1
SELECT 
    p.id_pedido,
    p.data_pedido,
    p.status,
    (
        SELECT SUM(i.qtde * i.preco_unit)
        FROM itens_pedido i
        WHERE i.id_pedido = p.id_pedido
    ) AS total_pedido
FROM pedidos p;

-- Exercicio 2 
-- WITH para criar uma tabelas temporaria paraconsulta
WITH total_pedidos AS (
    SELECT 
        p.id_pedido,
        p.data_pedido,
        SUM(i.qtde * i.preco_unit) AS total_pedido
    FROM pedidos p
    -- Inner join basico para juntas os pedidos
    JOIN itens_pedido i ON i.id_pedido = p.id_pedido
    GROUP BY p.id_pedido, p.data_pedido
),
media_total AS (
    SELECT AVG(total_pedido) AS media
    FROM total_pedidos
)SELECT 
    t.id_pedido,
    t.data_pedido,
    t.total_pedido
FROM total_pedidos t, media_total m
WHERE t.total_pedido > m.media;



-- Exercicio 3
-- Subconsulta com o NOT IN
SELECT id_produto, nome
FROM produtos
WHERE id_produto NOT IN (
    SELECT id_produto
    FROM itens_pedido
);

-- Exercicio 4
SELECT c.id_cliente, c.nome
FROM clientes c
WHERE c.id_cliente NOT IN (
    SELECT p.id_cliente
    FROM pedidos p
    JOIN itens_pedido i ON p.id_pedido = i.id_pedido
    JOIN produtos pr ON i.id_produto = pr.id_produto
    JOIN categorias ca ON pr.id_categoria = ca.id_categoria
    WHERE ca.nome = 'Games'
);



-- Exercicio 5
SELECT p.id_produto, p.nome, p.preco
FROM produtos p
WHERE p.preco = (
    SELECT MAX(p2.preco)
    FROM produtos p2
    WHERE p2.id_categoria = p.id_categoria
);



-- Exercico 6
SELECT e.id_pedido, e.prazo_dias
FROM entregas e
WHERE e.id_pedido IN (
    SELECT id_pedido 
    FROM pedidos 
    WHERE status = 'Pago'
)
-- Usando o AND
AND e.prazo_dias < (
    SELECT AVG(prazo_dias)
    FROM entregas
);

-- Exercicio 7
SELECT 
    p.id_produto,
    p.nome,
    p.preco
FROM produtos p
WHERE p.preco > (
    SELECT AVG(p2.preco)
    FROM produtos p2
    WHERE p2.id_categoria = p.id_categoria
);


-- Exercicio 8.1, consulta um
SELECT
    p.id_produto,
    p.nome,
    (
        SELECT COUNT(*)
        FROM produtos p2
        WHERE p2.id_categoria = p.id_categoria
          AND p2.preco > p.preco
    ) AS qtd_mais_caros
FROM produtos p;

-- Exericio 8.2
SELECT
    p.id_produto,
    p.nome,
    p.preco
FROM produtos p
WHERE (
    SELECT COUNT(*)
    FROM produtos p2
    WHERE p2.id_categoria = p.id_categoria
      AND p2.preco > p.preco
) = 0;


-- Exercicio 9
SELECT DISTINCT
    p.id_produto,
    p.nome
FROM produtos p
JOIN itens_pedido ip ON ip.id_produto = p.id_produto
JOIN pagamentos pg ON pg.id_pedido = ip.id_pedido
WHERE pg.status = 'aprovado';


-- Exercicio 10 - DESAFIO
SELECT
    c.nome,
    p.id_pedido,
    -- Subconsutla correlacionada 
    (SELECT SUM(ip.qtde * ip.preco_unit)
     FROM itens_pedido ip
     WHERE ip.id_pedido = p.id_pedido) AS total_pedido
FROM
    pedidos p
JOIN
    clientes c ON p.id_cliente = c.id_cliente
WHERE
    DATE_FORMAT(p.data_pedido, '%Y-%m') = '2025-08'
HAVING
    
    total_pedido = (
        SELECT MAX(t.total)
        FROM (
            SELECT SUM(ip2.qtde * ip2.preco_unit) AS total
            FROM itens_pedido ip2
            JOIN pedidos p2 ON ip2.id_pedido = p2.id_pedido
            WHERE DATE_FORMAT(p2.data_pedido, '%Y-%m') = '2025-08'
            GROUP BY ip2.id_pedido
        ) AS t
    );
    
-- EXERCICIO 11 - DESAFIO
SELECT 
	-- data formada
    DATE_FORMAT(t.data_pedido, '%Y-%m') AS mes,
    t.id_pedido,
    t.total_pedido AS total
FROM (
        -- vejo o total por pedido
        SELECT 
            p.id_pedido,
            p.data_pedido,
            SUM(i.qtde * i.preco_unit) AS total_pedido
        FROM pedidos p
        JOIN itens_pedido i ON i.id_pedido = p.id_pedido
        GROUP BY p.id_pedido, p.data_pedido
     ) t
JOIN (
        -- para saber o total do mes
        SELECT 
            DATE_FORMAT(data_pedido, '%Y-%m') AS mes,
            MAX(total_pedido) AS maior_do_mes
        FROM (
                SELECT 
                    p.id_pedido,
                    p.data_pedido,
                    SUM(i.qtde * i.preco_unit) AS total_pedido
                FROM pedidos p
                JOIN itens_pedido i ON i.id_pedido = p.id_pedido
                GROUP BY p.id_pedido, p.data_pedido
             ) x
        GROUP BY DATE_FORMAT(data_pedido, '%Y-%m')
     ) m
ON DATE_FORMAT(t.data_pedido, '%Y-%m') = m.mes
AND t.total_pedido = m.maior_do_mes
ORDER BY mes;
