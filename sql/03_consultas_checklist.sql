-- =============================================================
-- SCRIPT DE CONSULTAS E PL/SQL — AV4
-- Grupo 5 | CIN0137- Banco de Dados | Prof. Valéria Times
-- Checklist: 26 SQL + 20 PL = 46 itens
-- =============================================================


-- =============================================================
-- SEÇÃO SQL
-- =============================================================

-- [01] ALTER TABLE — adiciona coluna usada nos UPDATEs abaixo
ALTER TABLE Cliente ADD limite_credito NUMBER(10,2) DEFAULT 0;

-- [02] CREATE INDEX — acelera JOINs e filtros frequentes
CREATE INDEX idx_pedido_cliente  ON Pedido(cpf_cliente);
CREATE INDEX idx_itempedido_prod ON ItemPedido(cod_produto);

-- [03] INSERT INTO — dados extras para enriquecer cenários de IS NULL / NOT IN
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Impressora HP LaserJet', 1250.00, 8);
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('10111213140', 'Vera Lustosa', '50910000', '4', NULL, 'Residencial');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('10111213140', 'Básico');

-- [04] UPDATE — define limite de crédito por tipo de assinatura
UPDATE Cliente
   SET limite_credito = CASE tipo_assinatura
                            WHEN 'Gold'    THEN 5000
                            WHEN 'Premium' THEN 3000
                            ELSE                1000
                        END;

-- [05] DELETE — remove promoções sem nenhum item associado
DELETE FROM Promocao
 WHERE cod_promocao NOT IN (SELECT DISTINCT cod_promocao FROM ItemPedido
                             WHERE cod_promocao IS NOT NULL);

-- ---------------------------------------------------------------
-- [06 SELECT-FROM-WHERE] [07 BETWEEN] [08 IN] [09 LIKE]
-- [10 IS NOT NULL] [11 INNER JOIN] [14 AVG] [21 ORDER BY]
-- Relatório de produtos avaliados por faixa de preço e categoria
-- ---------------------------------------------------------------
SELECT p.nome                                    AS produto,
       c.nome                                    AS categoria,
       p.preco,
       ROUND(AVG(ip.nota_avaliacao), 1)          AS nota_media
  FROM Produto    p
  INNER JOIN Pertence   pe ON pe.cod_produto  = p.cod_produto
  INNER JOIN Categoria  c  ON c.cod_categoria = pe.cod_categoria
  INNER JOIN ItemPedido ip ON ip.cod_produto  = p.cod_produto
 WHERE p.preco BETWEEN 200 AND 2000                           -- [07]
   AND c.nome IN ('Eletrônicos', 'Calçados', 'Esportes')     -- [08]
   AND p.nome LIKE '%a%'                                     -- [09]
   AND ip.nota_avaliacao IS NOT NULL                         -- [10]
 GROUP BY p.nome, c.nome, p.preco
 ORDER BY nota_media DESC, p.preco;                          -- [21]

-- [10] IS NULL — entregas em trânsito e usuários sem complemento
SELECT e.cod_rastreio, t.nome AS transportadora, e.data_estimada
  FROM Entrega e JOIN Transportadora t ON t.cnpj = e.cnpj_transportadora
 WHERE e.data_hora_entrega IS NULL;

SELECT cpf, nome FROM Usuario WHERE complemento IS NULL;

-- ---------------------------------------------------------------
-- [12 MAX] [13 MIN] [14 AVG] [15 COUNT] [22 GROUP BY] [23 HAVING]
-- Resumo financeiro por meio de pagamento (apenas aprovados, ≥ 2 transações)
-- ---------------------------------------------------------------
SELECT pg.meio_pagamento,
       COUNT(*)                                        AS transacoes,
       MAX(ip.valor_unitario * ip.quantidade)          AS maior_item,
       MIN(ip.valor_unitario * ip.quantidade)          AS menor_item,
       ROUND(AVG(ip.valor_unitario * ip.quantidade),2) AS ticket_medio
  FROM Pagamento pg JOIN ItemPedido ip ON ip.cod_pedido = pg.pedido
 WHERE pg.status = 'Aprovado'
 GROUP BY pg.meio_pagamento
HAVING COUNT(*) >= 2
 ORDER BY ticket_medio DESC;

-- ---------------------------------------------------------------
-- [16] LEFT / RIGHT / FULL OUTER JOIN
-- ---------------------------------------------------------------
-- LEFT: todos os produtos e seus pedidos (inclui produto nunca pedido)
SELECT p.nome, ip.cod_pedido, ip.quantidade
  FROM Produto p LEFT OUTER JOIN ItemPedido ip ON ip.cod_produto = p.cod_produto;

-- RIGHT: todos os pedidos e seu pagamento (inclusive pedidos sem pagamento)
SELECT pd.cod_pedido, pd.status, pg.meio_pagamento
  FROM Pagamento pg RIGHT OUTER JOIN Pedido pd ON pd.cod_pedido = pg.pedido;

-- FULL: clientes vs funcionários — quem é só um dos dois
SELECT NVL(c.cpf_cliente, f.cpf_funcionario) AS cpf,
       c.tipo_assinatura, f.matricula
  FROM Cliente c FULL OUTER JOIN Funcionario f
    ON f.cpf_funcionario = c.cpf_cliente;

-- ---------------------------------------------------------------
-- [17] SUBCONSULTA COM OPERADOR RELACIONAL — produtos acima da média
-- [18] SUBCONSULTA COM IN — clientes com pedido cancelado; produtos nunca pedidos
-- [19] SUBCONSULTA COM ANY — mais caro que qualquer livro
-- [20] SUBCONSULTA COM ALL — limite maior que todos os clientes Básicos
-- ---------------------------------------------------------------
SELECT nome, preco FROM Produto
 WHERE preco > (SELECT AVG(preco) FROM Produto) ORDER BY preco DESC;  -- [17]

SELECT nome FROM Usuario
 WHERE cpf IN (SELECT cpf_cliente FROM Pedido WHERE status = 'Cancelado'); -- [18]

SELECT nome FROM Produto
 WHERE cod_produto NOT IN (SELECT DISTINCT cod_produto FROM ItemPedido);   -- [18]

SELECT nome, preco FROM Produto
 WHERE preco > ANY (SELECT p.preco FROM Produto p                          -- [19]
                     JOIN Pertence pe ON pe.cod_produto = p.cod_produto
                    WHERE pe.cod_categoria = 4) ORDER BY preco;

SELECT u.nome, c.limite_credito FROM Cliente c JOIN Usuario u ON u.cpf = c.cpf_cliente
 WHERE c.limite_credito > ALL (SELECT limite_credito FROM Cliente           -- [20]
                                WHERE tipo_assinatura = 'Básico');

-- ---------------------------------------------------------------
-- [24] UNION / INTERSECT / MINUS — papéis dos usuários
-- ---------------------------------------------------------------
SELECT cpf_cliente AS cpf, 'Cliente' AS papel FROM Cliente
UNION
SELECT cpf_funcionario, 'Funcionário' FROM Funcionario;

SELECT cpf_cliente FROM Cliente INTERSECT SELECT cpf_funcionario FROM Funcionario;
SELECT cpf_cliente FROM Cliente MINUS     SELECT cpf_funcionario FROM Funcionario;

-- ---------------------------------------------------------------
-- [25] CREATE VIEW — pedidos com valor total e status de pagamento
-- ---------------------------------------------------------------
CREATE OR REPLACE VIEW vw_pedidos AS
SELECT p.cod_pedido, u.nome AS cliente, p.status AS status_pedido,
       SUM(ip.valor_unitario * ip.quantidade) AS valor_total,
       pg.meio_pagamento, pg.status           AS status_pgto
  FROM Pedido p
  JOIN Cliente    c  ON c.cpf_cliente = p.cpf_cliente
  JOIN Usuario    u  ON u.cpf         = c.cpf_cliente
  JOIN ItemPedido ip ON ip.cod_pedido = p.cod_pedido
  LEFT JOIN Pagamento pg ON pg.pedido = p.cod_pedido
 GROUP BY p.cod_pedido, u.nome, p.status, pg.meio_pagamento, pg.status;

SELECT * FROM vw_pedidos WHERE status_pedido = 'Entregue' ORDER BY valor_total DESC;

-- [26] GRANT / REVOKE — não executável no Oracle Live SQL; documentado:
-- GRANT SELECT ON vw_pedidos TO usuario_relatorio;
-- REVOKE SELECT ON vw_pedidos FROM usuario_relatorio;


-- =============================================================
-- SEÇÃO PL/SQL
-- =============================================================

-- ---------------------------------------------------------------
-- [PL-14] FUNCTION — valor total de um pedido (usada nos blocos abaixo)
-- ---------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_valor_pedido (
    p_cod IN ItemPedido.cod_pedido%TYPE
) RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT NVL(SUM(valor_unitario * quantidade), 0)
      INTO v_total FROM ItemPedido WHERE cod_pedido = p_cod;
    RETURN v_total;
EXCEPTION WHEN OTHERS THEN RETURN -1;
END fn_valor_pedido;
/

-- ---------------------------------------------------------------
-- [PL-01 BLOCO ANÔNIMO] [PL-03 RECORD] [PL-05 TABLE]
-- [PL-06 IF ELSIF] [PL-10 FOR IN LOOP] [PL-13 SELECT INTO]
-- Carrega produtos com estoque crítico em coleção e classifica por preço
-- ---------------------------------------------------------------
DECLARE
    TYPE t_prod IS RECORD (                           -- [PL-03]
        cod   Produto.cod_produto%TYPE,
        nome  Produto.nome%TYPE,
        preco Produto.preco%TYPE,
        estq  Produto.quantidade_estoque%TYPE
    );
    TYPE t_lista IS TABLE OF t_prod INDEX BY PLS_INTEGER; -- [PL-05]
    v_lista  t_lista;
    v_classe VARCHAR2(15);
    v_i      PLS_INTEGER := 1;
BEGIN
    FOR r IN (SELECT cod_produto, nome, preco, quantidade_estoque  -- [PL-10]
                FROM Produto WHERE quantidade_estoque <= 15 ORDER BY quantidade_estoque) LOOP
        v_lista(v_i) := t_prod_rec(r.cod_produto, r.nome, r.preco, r.quantidade_estoque);
        v_i := v_i + 1;
    END LOOP;

    FOR i IN 1 .. v_lista.COUNT LOOP
        IF    v_lista(i).preco < 200  THEN v_classe := 'Econômico'; -- [PL-06]
        ELSIF v_lista(i).preco < 1000 THEN v_classe := 'Médio';
        ELSIF v_lista(i).preco < 2500 THEN v_classe := 'Premium';
        ELSE                               v_classe := 'Luxo';
        END IF;
        DBMS_OUTPUT.PUT_LINE(v_lista(i).nome || ' | Estq: ' || v_lista(i).estq ||
                             ' | R$' || v_lista(i).preco || ' | ' || v_classe);
    END LOOP;
END;
/

-- ---------------------------------------------------------------
-- [PL-02 %TYPE] [PL-04 %ROWTYPE] [PL-07 CASE WHEN]
-- [PL-08 LOOP EXIT WHEN] [PL-12 EXCEPTION WHEN] [PL-13 SELECT INTO]
-- Percorre pedidos e exibe ícone de status com nome do cliente
-- ---------------------------------------------------------------
DECLARE
    v_ped   Pedido%ROWTYPE;       -- [PL-04]
    v_nome  Usuario.nome%TYPE;    -- [PL-02]
    v_icone VARCHAR2(6);
    v_cod   PLS_INTEGER := 1;
BEGIN
    LOOP                                                         -- [PL-08]
        EXIT WHEN v_cod > 18;
        BEGIN
            SELECT * INTO v_ped FROM Pedido WHERE cod_pedido = v_cod;  -- [PL-13]
            SELECT nome INTO v_nome FROM Usuario WHERE cpf = v_ped.cpf_cliente;

            v_icone := CASE v_ped.status                         -- [PL-07]
                           WHEN 'Entregue'  THEN '[OK]'
                           WHEN 'Enviado'   THEN '[>>]'
                           WHEN 'Pendente'  THEN '[..]'
                           WHEN 'Cancelado' THEN '[XX]'
                           ELSE                  '[??]'
                       END;
            DBMS_OUTPUT.PUT_LINE(v_icone || ' #' || v_cod || ' ' ||
                                 v_nome || ' R$' || fn_valor_pedido(v_cod));
        EXCEPTION WHEN NO_DATA_FOUND THEN NULL; -- [PL-12]
        END;
        v_cod := v_cod + 1;
    END LOOP;
END;
/

-- ---------------------------------------------------------------
-- [PL-09] WHILE LOOP — acumula receita até atingir meta de R$10.000
-- ---------------------------------------------------------------
DECLARE
    v_meta CONSTANT NUMBER := 10000;
    v_acum NUMBER := 0;
    v_cod  PLS_INTEGER := 1;
    v_val  NUMBER;
BEGIN
    WHILE v_acum < v_meta LOOP
        EXIT WHEN v_cod > 18;
        SELECT NVL(SUM(valor_unitario * quantidade), 0)
          INTO v_val FROM ItemPedido WHERE cod_pedido = v_cod;
        v_acum := v_acum + v_val;
        DBMS_OUTPUT.PUT_LINE('Pedido #' || v_cod || ' | Acumulado: R$' || ROUND(v_acum,2));
        v_cod := v_cod + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(CASE WHEN v_acum >= v_meta THEN 'Meta atingida!'
                              ELSE 'Meta não atingida.' END);
END;
/

-- ---------------------------------------------------------------
-- [PL-11] CURSOR explícito (OPEN / FETCH / CLOSE)
-- Lista reclamações abertas com funcionário responsável
-- ---------------------------------------------------------------
DECLARE
    CURSOR c_recl IS
        SELECT r.cod_reclamacao, r.classificacao, r.status,
               r.descricao, u.nome AS funcionario
          FROM Reclamacao r
          JOIN Funcionario f ON f.cpf_funcionario = r.cpf_funcionario
          JOIN Usuario     u ON u.cpf             = f.cpf_funcionario
         WHERE r.status IN ('Pendente', 'Em Análise');
    v_r c_recl%ROWTYPE;
BEGIN
    OPEN c_recl;
    LOOP
        FETCH c_recl INTO v_r;
        EXIT WHEN c_recl%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('#' || v_r.cod_reclamacao || ' [' || v_r.classificacao || '] ' ||
                             v_r.funcionario || ': ' || SUBSTR(v_r.descricao,1,40));
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total: ' || c_recl%ROWCOUNT);
    CLOSE c_recl;
END;
/

-- ---------------------------------------------------------------
-- [PL-13] CREATE PROCEDURE — registra reclamação
-- [PL-15] Parâmetro IN | [PL-16] Parâmetro IN OUT | [PL-17] Parâmetro OUT
-- ---------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_registrar_reclamacao (
    p_cpf_func      IN OUT VARCHAR2,                       -- [PL-16] normaliza CPF
    p_cod_pedido    IN  Reclamacao.cod_pedido%TYPE,        -- [PL-15]
    p_classificacao IN  Reclamacao.classificacao%TYPE,     -- [PL-15]
    p_descricao     IN  Reclamacao.descricao%TYPE,         -- [PL-15]
    p_cod_gerado    OUT Reclamacao.cod_reclamacao%TYPE     -- [PL-17]
) AS
BEGIN
    p_cpf_func   := REGEXP_REPLACE(p_cpf_func, '[^0-9]', ''); -- IN OUT: retorna normalizado
    p_cod_gerado := seq_reclamacao.NEXTVAL;
    INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario,
                            status, classificacao, descricao, data_resolucao)
    VALUES (p_cod_gerado, p_cod_pedido, p_cpf_func,
            'Pendente', p_classificacao, p_descricao, NULL);
    DBMS_OUTPUT.PUT_LINE('Reclamação #' || p_cod_gerado || ' criada.');
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM); ROLLBACK;
END sp_registrar_reclamacao;
/

DECLARE
    v_cpf VARCHAR2(20) := '888.999.000-11';
    v_cod Reclamacao.cod_reclamacao%TYPE;
BEGIN
    sp_registrar_reclamacao(v_cpf, 10, 'Produto', 'Item com embalagem avariada.', v_cod);
    DBMS_OUTPUT.PUT_LINE('CPF: ' || v_cpf || ' | Código: ' || v_cod);
END;
/

-- ---------------------------------------------------------------
-- [PL-18] CREATE OR REPLACE PACKAGE (spec)
-- [PL-19] CREATE OR REPLACE PACKAGE BODY
-- ---------------------------------------------------------------
CREATE OR REPLACE PACKAGE pkg_ecommerce AS
    C_ESTQ_MIN CONSTANT INTEGER := 15;
    FUNCTION  fn_pedidos_cliente  (p_cpf   IN Cliente.cpf_cliente%TYPE) RETURN NUMBER;
    PROCEDURE sp_reajustar_precos (p_cat   IN NUMBER, p_pct IN NUMBER);
    FUNCTION  fn_classificar      (p_preco IN NUMBER) RETURN VARCHAR2;
END pkg_ecommerce;
/

CREATE OR REPLACE PACKAGE BODY pkg_ecommerce AS

    FUNCTION fn_pedidos_cliente (p_cpf IN Cliente.cpf_cliente%TYPE) RETURN NUMBER AS
        v_n NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_n FROM Pedido
         WHERE cpf_cliente = p_cpf AND status = 'Entregue';
        RETURN v_n;
    END;

    PROCEDURE sp_reajustar_precos (p_cat IN NUMBER, p_pct IN NUMBER) AS
        v_count NUMBER := 0;
    BEGIN
        FOR r IN (SELECT cod_produto FROM Pertence WHERE cod_categoria = p_cat) LOOP
            UPDATE Produto SET preco = ROUND(preco * (1 + p_pct/100), 2)
             WHERE cod_produto = r.cod_produto;
            v_count := v_count + 1;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Reajuste de ' || p_pct || '% em ' || v_count || ' produto(s).');
    END;

    FUNCTION fn_classificar (p_preco IN NUMBER) RETURN VARCHAR2 AS
    BEGIN
        RETURN CASE WHEN p_preco < 200  THEN 'Econômico'
                    WHEN p_preco < 1000 THEN 'Médio'
                    WHEN p_preco < 2500 THEN 'Premium'
                    ELSE                     'Luxo' END;
    END;

END pkg_ecommerce;
/

-- Teste do package
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pedidos entregues (Ana Lima): ' ||
        pkg_ecommerce.fn_pedidos_cliente('12345678901'));
    pkg_ecommerce.sp_reajustar_precos(4, 5); -- Livros +5%
    FOR r IN (SELECT nome, preco FROM Produto
               WHERE quantidade_estoque <= pkg_ecommerce.C_ESTQ_MIN) LOOP
        DBMS_OUTPUT.PUT_LINE(r.nome || ' — ' || pkg_ecommerce.fn_classificar(r.preco));
    END LOOP;
END;
/

-- ---------------------------------------------------------------
-- [PL-20] TRIGGER DE COMANDO (statement-level)
-- Bloqueia INSERTs/UPDATEs em ItemPedido fora do horário comercial
-- ---------------------------------------------------------------
CREATE OR REPLACE TRIGGER trg_horario_itempedido
    BEFORE INSERT OR UPDATE ON ItemPedido
DECLARE
    v_hora NUMBER := TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'));
    v_dia  NUMBER := TO_NUMBER(TO_CHAR(SYSDATE, 'D')); -- 1=Dom, 7=Sáb
BEGIN
    IF v_dia IN (1, 7) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Operação não permitida aos fins de semana.');
    END IF;
    IF v_hora < 6 OR v_hora >= 23 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Operação permitida apenas entre 06h e 23h.');
    END IF;
END trg_horario_itempedido;
/

-- ---------------------------------------------------------------
-- [PL-21] TRIGGER DE LINHA (row-level) — FOR EACH ROW
-- Grava no histórico o preço anterior sempre que ele for alterado
-- ---------------------------------------------------------------
CREATE OR REPLACE TRIGGER trg_historico_preco
    BEFORE UPDATE OF preco ON Produto
    FOR EACH ROW
BEGIN
    IF :NEW.preco <= 0 THEN
        RAISE_APPLICATION_ERROR(-20010, 'Preço deve ser positivo.');
    END IF;
    IF :OLD.preco <> :NEW.preco THEN
        INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
        VALUES (:OLD.cod_produto, TRUNC(SYSDATE), :OLD.preco);
    END IF;
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; -- já existe registro do dia, ignora
END trg_historico_preco;
/

-- Dispara o trigger de linha (reajuste de 2% nos produtos 1, 2 e 3)
UPDATE Produto SET preco = ROUND(preco * 1.02, 2) WHERE cod_produto IN (1, 2, 3);

-- =============================================================
-- FIM DO SCRIPT AV4 — Grupo 5
-- =============================================================
