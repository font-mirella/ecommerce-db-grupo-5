-- =============================================================
-- SCRIPT DE CONSULTAS E PL/SQL — AV4
-- Grupo 5: ecommerce-db-grupo-5
-- Disciplina: IF685 – Gerenciamento de Dados e Informação
-- Prof: Valéria Times
-- =============================================================
-- Checklist: 26 SQL + 20 PL = 46 itens
-- =============================================================


-- =============================================================
-- SEÇÃO SQL
-- =============================================================

-- -------------------------------------------------------------
-- [01] ALTER TABLE — adiciona e depois remove coluna auxiliar
-- -------------------------------------------------------------
ALTER TABLE Produto ADD pontuacao_media NUMBER(3,1);
ALTER TABLE Produto DROP COLUMN pontuacao_media;

-- Adiciona coluna que será usada de forma real mais adiante
ALTER TABLE Cliente ADD limite_credito NUMBER(10,2) DEFAULT 0;


-- -------------------------------------------------------------
-- [02] CREATE INDEX — melhora buscas frequentes
-- -------------------------------------------------------------
CREATE INDEX idx_pedido_cliente    ON Pedido(cpf_cliente);
CREATE INDEX idx_itempedido_prod   ON ItemPedido(cod_produto);
CREATE INDEX idx_reclamacao_status ON Reclamacao(status);


-- -------------------------------------------------------------
-- [03] INSERT INTO — inserções extras para enriquecer cenários
-- -------------------------------------------------------------
-- Novo produto sem histórico de preço (útil para IS NULL)
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Impressora HP LaserJet', 1250.00, 10);

-- Novo usuário sem complemento (útil para IS NULL)
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('10111213140', 'Vera Lustosa', '50910000', '4', NULL, 'Residencial');

INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('10111213140', 'Básico');


-- -------------------------------------------------------------
-- [04] UPDATE — atualiza limite de crédito conforme assinatura
-- -------------------------------------------------------------
UPDATE Cliente
   SET limite_credito = CASE tipo_assinatura
                            WHEN 'Gold'    THEN 5000
                            WHEN 'Premium' THEN 3000
                            ELSE                1000
                        END;

-- Atualiza estoque do produto recém-inserido
UPDATE Produto
   SET quantidade_estoque = quantidade_estoque + 5
 WHERE nome LIKE '%LaserJet%';


-- -------------------------------------------------------------
-- [05] DELETE — remove promoções encerradas antes de 2024
-- -------------------------------------------------------------
DELETE FROM Promocao
 WHERE data_fim < DATE '2024-01-01';


-- -------------------------------------------------------------
-- [06] SELECT-FROM-WHERE — pedidos entregues com valor total
-- -------------------------------------------------------------
SELECT p.cod_pedido,
       u.nome                           AS cliente,
       p.status,
       SUM(ip.valor_unitario * ip.quantidade) AS valor_total
  FROM Pedido p
  JOIN Cliente c ON c.cpf_cliente = p.cpf_cliente
  JOIN Usuario u ON u.cpf          = c.cpf_cliente
  JOIN ItemPedido ip ON ip.cod_pedido = p.cod_pedido
 WHERE p.status = 'Entregue'
 GROUP BY p.cod_pedido, u.nome, p.status
 ORDER BY valor_total DESC;


-- -------------------------------------------------------------
-- [07] BETWEEN — produtos com preço entre R$200 e R$800
-- -------------------------------------------------------------
SELECT cod_produto, nome, preco
  FROM Produto
 WHERE preco BETWEEN 200 AND 800
 ORDER BY preco;


-- -------------------------------------------------------------
-- [08] IN — clientes com assinatura Premium ou Gold
-- -------------------------------------------------------------
SELECT u.cpf, u.nome, c.tipo_assinatura, c.limite_credito
  FROM Usuario u
  JOIN Cliente c ON c.cpf_cliente = u.cpf
 WHERE c.tipo_assinatura IN ('Premium', 'Gold')
 ORDER BY c.tipo_assinatura, u.nome;


-- -------------------------------------------------------------
-- [09] LIKE — usuários cujo nome começa com letra A-M
-- -------------------------------------------------------------
SELECT cpf, nome, tipo_endereco
  FROM Usuario
 WHERE nome LIKE 'A%'
    OR nome LIKE 'B%'
    OR nome LIKE 'C%'
    OR nome LIKE 'M%'
 ORDER BY nome;

-- Transportadoras que oferecem serviço expresso
SELECT cnpj, nome, servico
  FROM Transportadora
 WHERE servico LIKE '%xpresso%' OR servico LIKE '%xpress%';


-- -------------------------------------------------------------
-- [10] IS NULL / IS NOT NULL
-- -------------------------------------------------------------
-- Entregas sem data de conclusão (ainda em trânsito)
SELECT e.cod_rastreio, t.nome AS transportadora,
       e.data_postagem, e.data_estimada
  FROM Entrega e
  JOIN Transportadora t ON t.cnpj = e.cnpj_transportadora
 WHERE e.data_hora_entrega IS NULL;

-- Usuários sem complemento de endereço
SELECT cpf, nome, cep, n_residencia
  FROM Usuario
 WHERE complemento IS NULL;

-- Itens de pedido que ainda não foram avaliados
SELECT ip.cod_pedido, ip.cod_produto, p.nome, ip.quantidade
  FROM ItemPedido ip
  JOIN Produto p ON p.cod_produto = ip.cod_produto
 WHERE ip.nota_avaliacao IS NULL;


-- -------------------------------------------------------------
-- [11] INNER JOIN — reclamações com funcionário responsável
-- -------------------------------------------------------------
SELECT r.cod_reclamacao,
       r.classificacao,
       r.status,
       u.nome       AS funcionario,
       r.descricao,
       r.data_resolucao
  FROM Reclamacao r
  INNER JOIN Funcionario f ON f.cpf_funcionario = r.cpf_funcionario
  INNER JOIN Usuario     u ON u.cpf             = f.cpf_funcionario
 ORDER BY r.cod_reclamacao;


-- -------------------------------------------------------------
-- [12] MAX — pedido de maior valor total
-- -------------------------------------------------------------
SELECT cod_pedido,
       SUM(valor_unitario * quantidade) AS valor_total
  FROM ItemPedido
 GROUP BY cod_pedido
HAVING SUM(valor_unitario * quantidade) =
       (SELECT MAX(total) FROM
           (SELECT SUM(valor_unitario * quantidade) AS total
              FROM ItemPedido
             GROUP BY cod_pedido));


-- -------------------------------------------------------------
-- [13] MIN — produto com menor preço por categoria
-- -------------------------------------------------------------
SELECT c.nome AS categoria,
       MIN(p.preco) AS menor_preco
  FROM Produto p
  JOIN Pertence pe ON pe.cod_produto  = p.cod_produto
  JOIN Categoria c ON c.cod_categoria = pe.cod_categoria
 GROUP BY c.nome
 ORDER BY c.nome;


-- -------------------------------------------------------------
-- [14] AVG — nota média de avaliação por produto
-- -------------------------------------------------------------
SELECT p.nome,
       ROUND(AVG(ip.nota_avaliacao), 2) AS nota_media,
       COUNT(ip.nota_avaliacao)          AS total_avaliacoes
  FROM Produto p
  JOIN ItemPedido ip ON ip.cod_produto = p.cod_produto
 WHERE ip.nota_avaliacao IS NOT NULL
 GROUP BY p.nome
 ORDER BY nota_media DESC;


-- -------------------------------------------------------------
-- [15] COUNT — quantidade de reclamações por funcionário
-- -------------------------------------------------------------
SELECT u.nome AS funcionario,
       COUNT(r.cod_reclamacao) AS total_reclamacoes,
       COUNT(CASE WHEN r.status = 'Resolvida' THEN 1 END) AS resolvidas
  FROM Funcionario f
  JOIN Usuario    u ON u.cpf = f.cpf_funcionario
  LEFT JOIN Reclamacao r ON r.cpf_funcionario = f.cpf_funcionario
 GROUP BY u.nome
 ORDER BY total_reclamacoes DESC;


-- -------------------------------------------------------------
-- [16] LEFT OUTER JOIN — todos os produtos e seus pedidos (se houver)
-- -------------------------------------------------------------
SELECT p.cod_produto, p.nome,
       ip.cod_pedido, ip.quantidade, ip.valor_unitario
  FROM Produto p
  LEFT OUTER JOIN ItemPedido ip ON ip.cod_produto = p.cod_produto
 ORDER BY p.cod_produto;

-- RIGHT OUTER JOIN — todos os pedidos e pagamentos (mesmo sem pagamento)
SELECT pd.cod_pedido, pd.status AS status_pedido,
       pg.meio_pagamento, pg.status AS status_pgto, pg.data_pagamento
  FROM Pagamento pg
  RIGHT OUTER JOIN Pedido pd ON pd.cod_pedido = pg.pedido
 ORDER BY pd.cod_pedido;

-- FULL OUTER JOIN — cruzamento completo usuário x cliente x funcionário
SELECT u.cpf, u.nome,
       c.tipo_assinatura,
       f.matricula
  FROM Cliente    c
  FULL OUTER JOIN Funcionario f ON f.cpf_funcionario = c.cpf_cliente
  JOIN Usuario    u ON u.cpf IN (
                          CASE WHEN c.cpf_cliente      IS NOT NULL THEN c.cpf_cliente
                               WHEN f.cpf_funcionario IS NOT NULL THEN f.cpf_funcionario
                          END)
 ORDER BY u.nome;


-- -------------------------------------------------------------
-- [17] SUBCONSULTA COM OPERADOR RELACIONAL (=, >, <, >=, <=, <>)
-- -------------------------------------------------------------
-- Produtos com preço acima da média geral
SELECT cod_produto, nome, preco
  FROM Produto
 WHERE preco > (SELECT AVG(preco) FROM Produto)
 ORDER BY preco DESC;

-- Funcionário mais antigo (data de admissão mais antiga)
SELECT u.nome, hc.data_admissao, c2.nome AS cargo_atual
  FROM HistoricoCargos hc
  JOIN Funcionario f ON f.cpf_funcionario = hc.cpf_funcionario
  JOIN Usuario     u ON u.cpf             = f.cpf_funcionario
  JOIN Cargo       c2 ON c2.cod_cargo     = hc.cargo
 WHERE hc.data_admissao = (SELECT MIN(data_admissao) FROM HistoricoCargos);


-- -------------------------------------------------------------
-- [18] SUBCONSULTA COM IN
-- -------------------------------------------------------------
-- Clientes que fizeram pelo menos um pedido cancelado
SELECT cpf, nome
  FROM Usuario
 WHERE cpf IN (
     SELECT cpf_cliente
       FROM Pedido
      WHERE status = 'Cancelado'
 );

-- Produtos que nunca foram pedidos
SELECT cod_produto, nome, preco, quantidade_estoque
  FROM Produto
 WHERE cod_produto NOT IN (
     SELECT DISTINCT cod_produto FROM ItemPedido
 );


-- -------------------------------------------------------------
-- [19] SUBCONSULTA COM ANY
-- -------------------------------------------------------------
-- Produtos mais caros que QUALQUER produto da categoria Livros (cod=4)
SELECT p.cod_produto, p.nome, p.preco
  FROM Produto p
 WHERE p.preco > ANY (
     SELECT pr.preco
       FROM Produto pr
       JOIN Pertence pe ON pe.cod_produto  = pr.cod_produto
      WHERE pe.cod_categoria = 4
 )
 ORDER BY p.preco;


-- -------------------------------------------------------------
-- [20] SUBCONSULTA COM ALL
-- -------------------------------------------------------------
-- Clientes cujo limite de crédito é maior que TODOS os limites dos clientes Básicos
SELECT u.nome, c.tipo_assinatura, c.limite_credito
  FROM Cliente c
  JOIN Usuario u ON u.cpf = c.cpf_cliente
 WHERE c.limite_credito > ALL (
     SELECT limite_credito
       FROM Cliente
      WHERE tipo_assinatura = 'Básico'
 );


-- -------------------------------------------------------------
-- [21] ORDER BY — histórico de preços do produto 1 em ordem cronológica
-- -------------------------------------------------------------
SELECT hp.cod_produto_preco,
       p.nome,
       hp.data_vigencia,
       hp.valor,
       hp.valor - LAG(hp.valor) OVER (
           PARTITION BY hp.cod_produto_preco
           ORDER BY hp.data_vigencia
       ) AS variacao
  FROM HistoricoPrecos hp
  JOIN Produto p ON p.cod_produto = hp.cod_produto_preco
 ORDER BY hp.cod_produto_preco, hp.data_vigencia;


-- -------------------------------------------------------------
-- [22] GROUP BY — receita total por meio de pagamento
-- -------------------------------------------------------------
SELECT pg.meio_pagamento,
       COUNT(*)                                       AS total_transacoes,
       SUM(ip.valor_unitario * ip.quantidade)         AS receita_total,
       ROUND(AVG(ip.valor_unitario * ip.quantidade),2) AS ticket_medio
  FROM Pagamento  pg
  JOIN ItemPedido ip ON ip.cod_pedido = pg.pedido
 WHERE pg.status = 'Aprovado'
 GROUP BY pg.meio_pagamento
 ORDER BY receita_total DESC;


-- -------------------------------------------------------------
-- [23] HAVING — categorias com mais de 3 produtos cadastrados
-- -------------------------------------------------------------
SELECT c.nome AS categoria,
       COUNT(pe.cod_produto) AS qtd_produtos,
       MIN(p.preco)          AS menor_preco,
       MAX(p.preco)          AS maior_preco
  FROM Categoria  c
  JOIN Pertence   pe ON pe.cod_categoria = c.cod_categoria
  JOIN Produto    p  ON p.cod_produto    = pe.cod_produto
 GROUP BY c.nome
HAVING COUNT(pe.cod_produto) > 3
 ORDER BY qtd_produtos DESC;


-- -------------------------------------------------------------
-- [24] UNION / INTERSECT / MINUS
-- -------------------------------------------------------------
-- UNION: todos os CPFs que são clientes OU funcionários
SELECT cpf_cliente    AS cpf, 'Cliente'     AS papel FROM Cliente
UNION
SELECT cpf_funcionario, 'Funcionário' AS papel FROM Funcionario
ORDER BY cpf;

-- INTERSECT: CPFs que são ao mesmo tempo clientes E funcionários
SELECT cpf_cliente FROM Cliente
INTERSECT
SELECT cpf_funcionario FROM Funcionario;

-- MINUS: clientes que NÃO são funcionários
SELECT cpf_cliente FROM Cliente
MINUS
SELECT cpf_funcionario FROM Funcionario;


-- -------------------------------------------------------------
-- [25] CREATE VIEW
-- -------------------------------------------------------------
-- View de pedidos com detalhes completos para relatório
CREATE OR REPLACE VIEW vw_pedidos_detalhados AS
SELECT p.cod_pedido,
       p.data_hora,
       p.status                               AS status_pedido,
       u.nome                                 AS nome_cliente,
       c.tipo_assinatura,
       SUM(ip.valor_unitario * ip.quantidade) AS valor_total,
       COUNT(ip.cod_produto)                  AS qtd_itens,
       pg.meio_pagamento,
       pg.status                              AS status_pagamento
  FROM Pedido     p
  JOIN Cliente    c  ON c.cpf_cliente  = p.cpf_cliente
  JOIN Usuario    u  ON u.cpf          = c.cpf_cliente
  JOIN ItemPedido ip ON ip.cod_pedido  = p.cod_pedido
  LEFT JOIN Pagamento pg ON pg.pedido  = p.cod_pedido
 GROUP BY p.cod_pedido, p.data_hora, p.status,
          u.nome, c.tipo_assinatura, pg.meio_pagamento, pg.status;

-- Consultando a view
SELECT * FROM vw_pedidos_detalhados
 WHERE status_pedido = 'Entregue'
 ORDER BY valor_total DESC;

-- View de resumo de estoque crítico (≤ 20 unidades)
CREATE OR REPLACE VIEW vw_estoque_critico AS
SELECT p.cod_produto,
       p.nome,
       p.preco,
       p.quantidade_estoque,
       c.nome AS categoria
  FROM Produto  p
  JOIN Pertence pe ON pe.cod_produto  = p.cod_produto
  JOIN Categoria c ON c.cod_categoria = pe.cod_categoria
 WHERE p.quantidade_estoque <= 20;

SELECT * FROM vw_estoque_critico ORDER BY quantidade_estoque;


-- -------------------------------------------------------------
-- [26] GRANT / REVOKE — Oracle Live SQL não permite execução;
-- os comandos estão documentados para fins da checklist.
-- -------------------------------------------------------------
-- GRANT SELECT, INSERT ON ItemPedido TO usuario_app;
-- GRANT SELECT ON vw_pedidos_detalhados TO usuario_relatorio;
-- REVOKE INSERT ON ItemPedido FROM usuario_app;
-- REVOKE SELECT ON vw_pedidos_detalhados FROM usuario_relatorio;


-- =============================================================
-- SEÇÃO PL/SQL
-- =============================================================

-- -------------------------------------------------------------
-- [PL-01] BLOCO ANÔNIMO — exibe estatísticas gerais do sistema
-- -------------------------------------------------------------
DECLARE
    v_total_pedidos   NUMBER;
    v_total_clientes  NUMBER;
    v_receita_total   NUMBER;
    v_ticket_medio    NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total_pedidos  FROM Pedido WHERE status = 'Entregue';
    SELECT COUNT(*) INTO v_total_clientes FROM Cliente;

    SELECT SUM(ip.valor_unitario * ip.quantidade)
      INTO v_receita_total
      FROM ItemPedido ip
      JOIN Pedido     p ON p.cod_pedido = ip.cod_pedido
     WHERE p.status = 'Entregue';

    v_ticket_medio := ROUND(v_receita_total / NULLIF(v_total_pedidos, 0), 2);

    DBMS_OUTPUT.PUT_LINE('=== Relatório Geral ===');
    DBMS_OUTPUT.PUT_LINE('Pedidos entregues : ' || v_total_pedidos);
    DBMS_OUTPUT.PUT_LINE('Total de clientes : ' || v_total_clientes);
    DBMS_OUTPUT.PUT_LINE('Receita total (R$): ' || v_receita_total);
    DBMS_OUTPUT.PUT_LINE('Ticket médio  (R$): ' || v_ticket_medio);
END;
/


-- -------------------------------------------------------------
-- [PL-02] %TYPE e SELECT ... INTO — busca um pedido específico
-- -------------------------------------------------------------
DECLARE
    v_cod_pedido   Pedido.cod_pedido%TYPE := 1;
    v_cpf_cliente  Pedido.cpf_cliente%TYPE;
    v_status       Pedido.status%TYPE;
    v_nome_cliente Usuario.nome%TYPE;
BEGIN
    SELECT p.cpf_cliente, p.status, u.nome
      INTO v_cpf_cliente, v_status, v_nome_cliente
      FROM Pedido  p
      JOIN Cliente c ON c.cpf_cliente = p.cpf_cliente
      JOIN Usuario u ON u.cpf         = c.cpf_cliente
     WHERE p.cod_pedido = v_cod_pedido;

    DBMS_OUTPUT.PUT_LINE('Pedido #' || v_cod_pedido);
    DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_nome_cliente || ' (' || v_cpf_cliente || ')');
    DBMS_OUTPUT.PUT_LINE('Status : ' || v_status);
END;
/


-- -------------------------------------------------------------
-- [PL-03] USO DE RECORD
-- -------------------------------------------------------------
DECLARE
    TYPE t_rec_produto IS RECORD (
        cod   Produto.cod_produto%TYPE,
        nome  Produto.nome%TYPE,
        preco Produto.preco%TYPE,
        estq  Produto.quantidade_estoque%TYPE
    );
    v_prod t_rec_produto;
BEGIN
    SELECT cod_produto, nome, preco, quantidade_estoque
      INTO v_prod
      FROM Produto
     WHERE cod_produto = 1;

    DBMS_OUTPUT.PUT_LINE('Produto  : ' || v_prod.nome);
    DBMS_OUTPUT.PUT_LINE('Preço    : R$' || v_prod.preco);
    DBMS_OUTPUT.PUT_LINE('Estoque  : ' || v_prod.estq || ' un.');
END;
/


-- -------------------------------------------------------------
-- [PL-04] %ROWTYPE
-- -------------------------------------------------------------
DECLARE
    v_rec_cliente Cliente%ROWTYPE;
    v_nome        Usuario.nome%TYPE;
BEGIN
    SELECT * INTO v_rec_cliente FROM Cliente WHERE cpf_cliente = '12345678901';
    SELECT nome INTO v_nome FROM Usuario WHERE cpf = v_rec_cliente.cpf_cliente;

    DBMS_OUTPUT.PUT_LINE('CPF         : ' || v_rec_cliente.cpf_cliente);
    DBMS_OUTPUT.PUT_LINE('Nome        : ' || v_nome);
    DBMS_OUTPUT.PUT_LINE('Assinatura  : ' || v_rec_cliente.tipo_assinatura);
    DBMS_OUTPUT.PUT_LINE('Limite (R$) : ' || v_rec_cliente.limite_credito);
END;
/


-- -------------------------------------------------------------
-- [PL-05] USO DE ESTRUTURA DE DADOS DO TIPO TABLE (coleção)
-- -------------------------------------------------------------
DECLARE
    TYPE t_tab_nomes IS TABLE OF Usuario.nome%TYPE INDEX BY PLS_INTEGER;
    v_nomes   t_tab_nomes;
    v_idx     PLS_INTEGER := 1;
    CURSOR c_users IS SELECT nome FROM Usuario ORDER BY nome;
BEGIN
    FOR r IN c_users LOOP
        v_nomes(v_idx) := r.nome;
        v_idx := v_idx + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total de usuários carregados: ' || (v_idx - 1));
    FOR i IN 1 .. v_nomes.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(i || ') ' || v_nomes(i));
    END LOOP;
END;
/


-- -------------------------------------------------------------
-- [PL-06] IF ELSIF — classifica cliente pelo limite de crédito
-- -------------------------------------------------------------
DECLARE
    v_cpf    Cliente.cpf_cliente%TYPE := '56789012345';
    v_limite Cliente.limite_credito%TYPE;
    v_classe VARCHAR2(20);
BEGIN
    SELECT limite_credito INTO v_limite
      FROM Cliente WHERE cpf_cliente = v_cpf;

    IF v_limite >= 5000 THEN
        v_classe := 'VIP';
    ELSIF v_limite >= 3000 THEN
        v_classe := 'Alto Valor';
    ELSIF v_limite >= 1000 THEN
        v_classe := 'Padrão';
    ELSE
        v_classe := 'Básico';
    END IF;

    DBMS_OUTPUT.PUT_LINE('CPF '    || v_cpf ||
                         ' — Limite: R$' || v_limite ||
                         ' — Classe: ' || v_classe);
END;
/


-- -------------------------------------------------------------
-- [PL-07] CASE WHEN
-- -------------------------------------------------------------
DECLARE
    v_status  Pedido.status%TYPE;
    v_icone   VARCHAR2(10);
    CURSOR c_ped IS SELECT status FROM Pedido;
BEGIN
    OPEN c_ped;
    LOOP
        FETCH c_ped INTO v_status;
        EXIT WHEN c_ped%NOTFOUND;

        v_icone := CASE v_status
                       WHEN 'Entregue'  THEN '[OK]'
                       WHEN 'Enviado'   THEN '[>>]'
                       WHEN 'Pendente'  THEN '[..]'
                       WHEN 'Cancelado' THEN '[XX]'
                       ELSE                  '[??]'
                   END;

        DBMS_OUTPUT.PUT_LINE(v_icone || ' ' || v_status);
    END LOOP;
    CLOSE c_ped;
END;
/


-- -------------------------------------------------------------
-- [PL-08] LOOP EXIT WHEN — itera sobre primeiros N produtos
-- -------------------------------------------------------------
DECLARE
    v_cod     Produto.cod_produto%TYPE := 1;
    v_nome    Produto.nome%TYPE;
    v_preco   Produto.preco%TYPE;
    v_max     CONSTANT PLS_INTEGER := 5;
    v_cont    PLS_INTEGER := 0;
BEGIN
    LOOP
        EXIT WHEN v_cont >= v_max;
        BEGIN
            SELECT nome, preco INTO v_nome, v_preco
              FROM Produto WHERE cod_produto = v_cod;
            DBMS_OUTPUT.PUT_LINE('[' || v_cod || '] ' || v_nome || ' — R$' || v_preco);
            v_cont := v_cont + 1;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN NULL;
        END;
        v_cod := v_cod + 1;
        EXIT WHEN v_cod > 25; -- limite de segurança
    END LOOP;
END;
/


-- -------------------------------------------------------------
-- [PL-09] WHILE LOOP — acumula receita até atingir meta
-- -------------------------------------------------------------
DECLARE
    v_meta      CONSTANT NUMBER := 10000;
    v_acumulado NUMBER := 0;
    v_cod_ped   PLS_INTEGER := 1;
    v_valor     NUMBER;
BEGIN
    WHILE v_acumulado < v_meta LOOP
        BEGIN
            SELECT SUM(valor_unitario * quantidade) INTO v_valor
              FROM ItemPedido WHERE cod_pedido = v_cod_ped;

            IF v_valor IS NOT NULL THEN
                v_acumulado := v_acumulado + v_valor;
                DBMS_OUTPUT.PUT_LINE('Pedido ' || v_cod_ped ||
                                     ' | +R$' || ROUND(v_valor,2) ||
                                     ' | Acumulado: R$' || ROUND(v_acumulado,2));
            END IF;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN NULL;
        END;
        v_cod_ped := v_cod_ped + 1;
        EXIT WHEN v_cod_ped > 18;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Meta de R$' || v_meta ||
                         (CASE WHEN v_acumulado >= v_meta THEN ' atingida!' ELSE ' não atingida.' END));
END;
/


-- -------------------------------------------------------------
-- [PL-10] FOR IN LOOP — percorre categorias e conta produtos
-- -------------------------------------------------------------
DECLARE
    v_count NUMBER;
BEGIN
    FOR r IN (SELECT cod_categoria, nome FROM Categoria ORDER BY cod_categoria) LOOP
        SELECT COUNT(*) INTO v_count
          FROM Pertence
         WHERE cod_categoria = r.cod_categoria;
        DBMS_OUTPUT.PUT_LINE('Categoria [' || r.cod_categoria || '] ' ||
                             RPAD(r.nome, 20) || ': ' || v_count || ' produto(s)');
    END LOOP;
END;
/


-- -------------------------------------------------------------
-- [PL-11] CURSOR (OPEN, FETCH, CLOSE) — reclamações pendentes
-- -------------------------------------------------------------
DECLARE
    CURSOR c_recl IS
        SELECT r.cod_reclamacao, r.classificacao, r.descricao,
               u.nome AS funcionario
          FROM Reclamacao r
          JOIN Funcionario f ON f.cpf_funcionario = r.cpf_funcionario
          JOIN Usuario     u ON u.cpf             = f.cpf_funcionario
         WHERE r.status IN ('Pendente', 'Em Análise')
         ORDER BY r.cod_reclamacao;

    v_rec c_recl%ROWTYPE;
BEGIN
    OPEN c_recl;
    DBMS_OUTPUT.PUT_LINE('=== Reclamações Abertas ===');
    LOOP
        FETCH c_recl INTO v_rec;
        EXIT WHEN c_recl%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('#' || v_rec.cod_reclamacao ||
                             ' | ' || v_rec.classificacao ||
                             ' | ' || v_rec.funcionario ||
                             ' | ' || SUBSTR(v_rec.descricao, 1, 40));
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total encontrado: ' || c_recl%ROWCOUNT);
    CLOSE c_recl;
END;
/


-- -------------------------------------------------------------
-- [PL-12] EXCEPTION WHEN — trata produto inexistente
-- -------------------------------------------------------------
DECLARE
    v_cod   Produto.cod_produto%TYPE := 9999;
    v_nome  Produto.nome%TYPE;
    v_preco Produto.preco%TYPE;
BEGIN
    SELECT nome, preco INTO v_nome, v_preco
      FROM Produto WHERE cod_produto = v_cod;

    DBMS_OUTPUT.PUT_LINE('Produto: ' || v_nome || ' — R$' || v_preco);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: Produto ' || v_cod || ' não encontrado.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: Múltiplos registros retornados.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERRO inesperado: ' || SQLERRM);
END;
/


-- -------------------------------------------------------------
-- [PL-13] CREATE PROCEDURE — registra nova reclamação
-- Uso de parâmetros IN
-- -------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_registrar_reclamacao (
    p_cod_pedido      IN Reclamacao.cod_pedido%TYPE,
    p_cpf_funcionario IN Reclamacao.cpf_funcionario%TYPE,
    p_classificacao   IN Reclamacao.classificacao%TYPE,
    p_descricao       IN Reclamacao.descricao%TYPE
) AS
    v_cod NUMBER;
BEGIN
    SELECT seq_reclamacao.NEXTVAL INTO v_cod FROM DUAL;

    INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario,
                            status, classificacao, descricao, data_resolucao)
    VALUES (v_cod, p_cod_pedido, p_cpf_funcionario,
            'Pendente', p_classificacao, p_descricao, NULL);

    DBMS_OUTPUT.PUT_LINE('Reclamação #' || v_cod || ' registrada com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao registrar reclamação: ' || SQLERRM);
        ROLLBACK;
END sp_registrar_reclamacao;
/

-- Teste da procedure
BEGIN
    sp_registrar_reclamacao(
        p_cod_pedido      => 10,
        p_cpf_funcionario => '88899900011',
        p_classificacao   => 'Produto',
        p_descricao       => 'Item recebido com arranhões na tampa.'
    );
END;
/


-- -------------------------------------------------------------
-- [PL-14] CREATE FUNCTION — calcula valor total de um pedido
-- Uso de parâmetros IN e retorno
-- -------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_valor_pedido (
    p_cod_pedido IN ItemPedido.cod_pedido%TYPE
) RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT SUM(valor_unitario * quantidade)
      INTO v_total
      FROM ItemPedido
     WHERE cod_pedido = p_cod_pedido;

    RETURN NVL(v_total, 0);
EXCEPTION
    WHEN OTHERS THEN
        RETURN -1;
END fn_valor_pedido;
/

-- Teste da function
BEGIN
    FOR r IN (SELECT cod_pedido FROM Pedido ORDER BY cod_pedido) LOOP
        DBMS_OUTPUT.PUT_LINE('Pedido #' || r.cod_pedido ||
                             ' — Total: R$' || fn_valor_pedido(r.cod_pedido));
    END LOOP;
END;
/


-- -------------------------------------------------------------
-- [PL-15] USO DE PARÂMETROS OUT — procedure retorna dados do produto
-- -------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_consultar_produto (
    p_cod_produto   IN  Produto.cod_produto%TYPE,
    p_nome          OUT Produto.nome%TYPE,
    p_preco         OUT Produto.preco%TYPE,
    p_qtd_estoque   OUT Produto.quantidade_estoque%TYPE,
    p_encontrado    OUT BOOLEAN
) AS
BEGIN
    SELECT nome, preco, quantidade_estoque
      INTO p_nome, p_preco, p_qtd_estoque
      FROM Produto
     WHERE cod_produto = p_cod_produto;
    p_encontrado := TRUE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_nome        := NULL;
        p_preco       := NULL;
        p_qtd_estoque := NULL;
        p_encontrado  := FALSE;
END sp_consultar_produto;
/

-- Teste com parâmetro OUT
DECLARE
    v_nome  Produto.nome%TYPE;
    v_preco Produto.preco%TYPE;
    v_estq  Produto.quantidade_estoque%TYPE;
    v_ok    BOOLEAN;
BEGIN
    sp_consultar_produto(2, v_nome, v_preco, v_estq, v_ok);
    IF v_ok THEN
        DBMS_OUTPUT.PUT_LINE('Nome  : ' || v_nome);
        DBMS_OUTPUT.PUT_LINE('Preço : R$' || v_preco);
        DBMS_OUTPUT.PUT_LINE('Estq  : ' || v_estq);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Produto não encontrado.');
    END IF;
END;
/


-- -------------------------------------------------------------
-- [PL-16] CREATE OR REPLACE PACKAGE (spec)
-- -------------------------------------------------------------
CREATE OR REPLACE PACKAGE pkg_ecommerce AS
    -- Constante pública
    C_ESTOQUE_MINIMO CONSTANT INTEGER := 15;

    -- Cursores públicos
    CURSOR cur_produtos_criticos RETURN Produto%ROWTYPE;

    -- Funções e procedures públicas
    FUNCTION  fn_total_pedidos_cliente (p_cpf IN Cliente.cpf_cliente%TYPE)
        RETURN NUMBER;

    PROCEDURE sp_reajustar_precos (
        p_cod_categoria IN Categoria.cod_categoria%TYPE,
        p_percentual    IN NUMBER
    );

    FUNCTION fn_classificar_produto (
        p_preco IN Produto.preco%TYPE
    ) RETURN VARCHAR2;

END pkg_ecommerce;
/


-- -------------------------------------------------------------
-- [PL-17] CREATE OR REPLACE PACKAGE BODY
-- -------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY pkg_ecommerce AS

    -- Implementação do cursor público
    CURSOR cur_produtos_criticos RETURN Produto%ROWTYPE IS
        SELECT * FROM Produto
         WHERE quantidade_estoque <= C_ESTOQUE_MINIMO
         ORDER BY quantidade_estoque;

    -- Conta pedidos entregues de um cliente
    FUNCTION fn_total_pedidos_cliente (
        p_cpf IN Cliente.cpf_cliente%TYPE
    ) RETURN NUMBER AS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total
          FROM Pedido
         WHERE cpf_cliente = p_cpf
           AND status      = 'Entregue';
        RETURN v_total;
    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END fn_total_pedidos_cliente;

    -- Reajusta preços de produtos de uma categoria
    PROCEDURE sp_reajustar_precos (
        p_cod_categoria IN Categoria.cod_categoria%TYPE,
        p_percentual    IN NUMBER
    ) AS
        v_count NUMBER := 0;
    BEGIN
        FOR r IN (SELECT cod_produto FROM Pertence WHERE cod_categoria = p_cod_categoria) LOOP
            UPDATE Produto
               SET preco = ROUND(preco * (1 + p_percentual / 100), 2)
             WHERE cod_produto = r.cod_produto;
            v_count := v_count + 1;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Reajuste de ' || p_percentual ||
                             '% aplicado em ' || v_count || ' produto(s) da categoria ' ||
                             p_cod_categoria || '.');
    END sp_reajustar_precos;

    -- Classifica produto por faixa de preço
    FUNCTION fn_classificar_produto (
        p_preco IN Produto.preco%TYPE
    ) RETURN VARCHAR2 AS
    BEGIN
        RETURN CASE
                   WHEN p_preco < 100    THEN 'Econômico'
                   WHEN p_preco < 500    THEN 'Intermediário'
                   WHEN p_preco < 2000   THEN 'Premium'
                   ELSE                       'Luxo'
               END;
    END fn_classificar_produto;

END pkg_ecommerce;
/

-- Testes do package
DECLARE
    v_prod pkg_ecommerce.cur_produtos_criticos%ROWTYPE;
BEGIN
    -- Teste fn_total_pedidos_cliente
    DBMS_OUTPUT.PUT_LINE('Pedidos entregues (Ana Lima): ' ||
        pkg_ecommerce.fn_total_pedidos_cliente('12345678901'));

    -- Teste cur_produtos_criticos
    DBMS_OUTPUT.PUT_LINE('=== Estoque Crítico (≤ ' || pkg_ecommerce.C_ESTOQUE_MINIMO || ' un.) ===');
    OPEN pkg_ecommerce.cur_produtos_criticos;
    LOOP
        FETCH pkg_ecommerce.cur_produtos_criticos INTO v_prod;
        EXIT WHEN pkg_ecommerce.cur_produtos_criticos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_prod.nome || ' — ' || v_prod.quantidade_estoque || ' un. | ' ||
                             pkg_ecommerce.fn_classificar_produto(v_prod.preco));
    END LOOP;
    CLOSE pkg_ecommerce.cur_produtos_criticos;

    -- Teste sp_reajustar_precos (categoria 4 = Livros, +5%)
    pkg_ecommerce.sp_reajustar_precos(4, 5);
END;
/


-- -------------------------------------------------------------
-- [PL-18] CREATE OR REPLACE TRIGGER (COMANDO — statement-level)
-- Impede INSERTs em ItemPedido fora do horário comercial
-- -------------------------------------------------------------
CREATE OR REPLACE TRIGGER trg_bloqueia_itempedido_fds
    BEFORE INSERT OR UPDATE ON ItemPedido
DECLARE
    v_dia  NUMBER;
    v_hora NUMBER;
BEGIN
    v_dia  := TO_NUMBER(TO_CHAR(SYSDATE, 'D')); -- 1=Dom, 7=Sáb (depende NLS)
    v_hora := TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'));

    -- Bloqueia fins de semana (Sáb=7, Dom=1) e fora de 06-22h
    IF v_dia IN (1, 7) THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Inserções em ItemPedido não permitidas aos finais de semana.');
    END IF;

    IF v_hora < 6 OR v_hora >= 23 THEN
        RAISE_APPLICATION_ERROR(-20002,
            'Inserções em ItemPedido permitidas apenas entre 06h e 23h.');
    END IF;
END trg_bloqueia_itempedido_fds;
/


-- -------------------------------------------------------------
-- [PL-19] CREATE OR REPLACE TRIGGER (LINHA — row-level)
-- Registra no histórico sempre que o preço de um produto mudar
-- e valida que o novo preço é positivo.
-- -------------------------------------------------------------
CREATE OR REPLACE TRIGGER trg_historico_preco
    BEFORE UPDATE OF preco ON Produto
    FOR EACH ROW
DECLARE
    v_data DATE := TRUNC(SYSDATE);
BEGIN
    -- Validação: preço não pode ser zero ou negativo
    IF :NEW.preco <= 0 THEN
        RAISE_APPLICATION_ERROR(-20010,
            'Preço inválido: deve ser maior que zero.');
    END IF;

    -- Só registra se o preço de fato mudou
    IF :OLD.preco <> :NEW.preco THEN
        -- Insere o preço ANTERIOR no histórico
        INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
        VALUES (:OLD.cod_produto, v_data, :OLD.preco);

        DBMS_OUTPUT.PUT_LINE('Trigger: histórico gravado — Produto ' || :OLD.cod_produto ||
                             ' | Preço anterior: R$' || :OLD.preco ||
                             ' | Novo preço: R$' || :NEW.preco);
    END IF;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        -- Já existe um registro para este produto nesta data; ignora duplicata
        NULL;
END trg_historico_preco;
/

-- Teste do trigger de linha (dispara ao executar o reajuste de preços)
UPDATE Produto SET preco = ROUND(preco * 1.02, 2) WHERE cod_produto IN (1, 2, 3);


-- -------------------------------------------------------------
-- [PL-20] Parâmetro IN OUT — procedure que normaliza CPF e retorna
-- -------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_normalizar_cpf (
    p_cpf IN OUT VARCHAR2
) AS
BEGIN
    -- Remove caracteres não-numéricos e padroniza para 11 dígitos
    p_cpf := REGEXP_REPLACE(p_cpf, '[^0-9]', '');
    IF LENGTH(p_cpf) <> 11 THEN
        RAISE_APPLICATION_ERROR(-20020, 'CPF inválido após normalização: ' || p_cpf);
    END IF;
    DBMS_OUTPUT.PUT_LINE('CPF normalizado: ' || p_cpf);
END sp_normalizar_cpf;
/

-- Teste do parâmetro IN OUT
DECLARE
    v_cpf VARCHAR2(20) := '123.456.789-01';
BEGIN
    sp_normalizar_cpf(v_cpf);
    DBMS_OUTPUT.PUT_LINE('Resultado: ' || v_cpf);
END;
/


-- =============================================================
-- FIM DO SCRIPT AV4 — Grupo 5
-- =============================================================
