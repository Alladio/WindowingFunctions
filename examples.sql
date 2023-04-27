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

-- UTILIZANDO ROW NUMBER
