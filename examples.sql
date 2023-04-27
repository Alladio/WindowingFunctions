-- 

SELECT produto_nome, produto_categoria_nome AS Categoria,
        COUNT(produto_id) AS Total_Produtos
FROM produtos
GROUP BY produto_categoria_nome

-- COM WINDOWING FUNCTIONS
-- Retirar o GROUP BY

SELECT produto_nome, produto_categoria_nome AS Categoria,
        COUNT(produto_id) OVER(PARTITION BY product_category_name) AS Total_Produtos
FROM produtos

--OU, com: DISTINCT

SELECT produto_nome, produto_categoria_nome AS Categoria,
        COUNT(produto_id) OVER(PARTITION BY product_category_name) AS Total_Produtos
FROM produtos


-- UTILIZANDO ROW NUMBER

SELECT produto_nome, 
        produto_id,
        produto_categoria_nome AS Categoria,
        produto_peso AS Peso_do_Produto,
        ROW_NUMBER() OVER(PARTITION BY produto_categoria_nome ORDER BY produto_peso) AS Numero_da_Linha,
        DENSE_RANK() OVER(PARTITION BY produto_categoria_nome ORDER BY produto_peso) AS Rank_da_Linha,
FROM produtos
WHERE produto_categoria_nome = 'bicicletas'
ORDER BY produto_peso DESC