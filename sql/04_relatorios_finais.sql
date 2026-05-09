-- =============================================================
-- RELATÓRIOS FINAIS E RESPOSTAS ÀS PERGUNTAS DE NEGÓCIO
-- Grupo 5: ecommerce-db-grupo-5
-- =============================================================

-- -------------------------------------------------------------
-- 6. PERGUNTAS DE NEGÓCIO
-- -------------------------------------------------------------

-- [6.1] Quantas reclamações foram registradas por produto?
-- Relaciona as reclamações aos itens contidos nos pedidos reclamados.
SELECT p.nome AS produto, 
       COUNT(r.cod_reclamacao) AS total_reclamacoes
FROM Produto p
JOIN ItemPedido ip ON p.cod_produto = ip.cod_produto
JOIN Reclamacao r ON r.cod_pedido = ip.cod_pedido
GROUP BY p.nome
ORDER BY total_reclamacoes DESC;


-- [6.2] Quais pedidos de um cliente estão com status "Enviado" (em entrega)?
-- Substitua '12345678901' pelo CPF desejado.
SELECT cod_pedido, 
       data_hora, 
       status
FROM Pedido
WHERE cpf_cliente = '12345678901' 
  AND status = 'Enviado';


-- [6.3] Qual o histórico de preços de um determinado produto?
-- Exibe a evolução dos valores registrados para o produto 1.
SELECT hp.data_vigencia, 
       hp.valor,
       p.nome
FROM HistoricoPrecos hp
JOIN Produto p ON p.cod_produto = hp.cod_produto_preco
WHERE hp.cod_produto_preco = 1
ORDER BY hp.data_vigencia DESC;


-- [6.4] Quais produtos de uma categoria específica estão com estoque zerado?
-- Exemplo para a categoria 'Eletrônicos'.
SELECT p.nome, 
       p.quantidade_estoque
FROM Produto p
JOIN Pertence pe ON p.cod_produto = pe.cod_produto
JOIN Categoria c ON c.cod_categoria = pe.cod_categoria
WHERE c.nome = 'Eletrônicos' 
  AND p.quantidade_estoque = 0;


-- [6.5] Quais produtos possuem menor número de avaliações?
-- Mostra os produtos que receberam poucas ou nenhuma avaliação.
SELECT p.nome, 
       COUNT(ip.nota_avaliacao) AS num_avaliacoes
FROM Produto p
LEFT JOIN ItemPedido ip ON p.cod_produto = ip.cod_produto
GROUP BY p.nome
ORDER BY num_avaliacoes ASC;


-- -------------------------------------------------------------
-- 7. RELATÓRIOS GERENCIAIS
-- -------------------------------------------------------------

-- [7.1] Quais os 10 produtos mais vendidos (em quantidade)?
-- Considera todo o histórico de vendas.
SELECT p.nome, 
       SUM(ip.quantidade) AS total_vendido
FROM Produto p
JOIN ItemPedido ip ON p.cod_produto = ip.cod_produto
GROUP BY p.nome
ORDER BY total_vendido DESC
FETCH FIRST 10 ROWS ONLY;


-- [7.2] Qual o ticket médio dos pedidos por meio de pagamento?
-- Calcula a média de valor gasto em cada modalidade de pagamento aprovada.
SELECT pg.meio_pagamento, 
       ROUND(AVG(ip.valor_unitario * ip.quantidade), 2) AS ticket_medio
FROM Pagamento pg
JOIN ItemPedido ip ON pg.pedido = ip.cod_pedido
WHERE pg.status = 'Aprovado'
GROUP BY pg.meio_pagamento
ORDER BY ticket_medio DESC;


-- [7.3] Qual o tempo médio de entrega por transportadora?
-- Diferença entre a data de postagem e a data efetiva de entrega.
SELECT t.nome AS transportadora,
       -- O Truc 'zera' as horas (meia-noite) para que a subtração resulte em dias inteiros
       ROUND(AVG(TRUNC(e.data_hora_entrega) - e.data_postagem), 1) || ' dias' AS tempo_medio_entrega
FROM Entrega e
JOIN Transportadora t ON e.cnpj_transportadora = t.cnpj
WHERE e.data_hora_entrega IS NOT NULL
GROUP BY t.nome;


-- [7.4] Quais clientes utilizaram promoções e quanto economizaram?
-- Baseado no percentual da promoção aplicada ao item.
SELECT u.nome AS cliente, 
       SUM(ROUND(ip.valor_unitario * ip.quantidade * (pr.percentual / 100), 2)) AS total_economizado
FROM Usuario u
JOIN Cliente c ON u.cpf = c.cpf_cliente
JOIN Pedido pd ON c.cpf_cliente = pd.cpf_cliente
JOIN ItemPedido ip ON pd.cod_pedido = ip.cod_pedido
JOIN Promocao pr ON ip.cod_promocao = pr.cod_promocao
GROUP BY u.nome
ORDER BY total_economizado DESC;


-- [7.5] Evolução da nota média de avaliação dos produtos ao longo dos meses
-- Mostra como a satisfação dos clientes varia mês a mês.
SELECT TO_CHAR(pd.data_hora, 'YYYY-MM') AS mes,
       p.nome AS produto,
       ROUND(AVG(ip.nota_avaliacao), 2) AS nota_media
FROM Produto p
JOIN ItemPedido ip ON p.cod_produto = ip.cod_produto
JOIN Pedido pd ON pd.cod_pedido = ip.cod_pedido
WHERE ip.nota_avaliacao IS NOT NULL
GROUP BY TO_CHAR(pd.data_hora, 'YYYY-MM'), p.nome
ORDER BY mes ASC, nota_media DESC;
