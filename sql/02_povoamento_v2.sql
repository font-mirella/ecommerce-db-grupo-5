-- =============================================================
-- POVOAMENTO EXPANDIDO E RANDÔMICO PARA TESTE DE RELATÓRIOS
-- IMPORTANTE: Reinicie suas sequences antes de executar!
-- =============================================================

-- -------------------------------------------------------------
-- 1. USUARIO (Mantido e Expandido)
-- -------------------------------------------------------------
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('12345678901', 'Ana Lima', '50710000', '12', 'Apto 301', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('23456789012', 'Bruno Souza', '50720000', '45', 'Casa', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('34567890123', 'Carla Mendes', '50730000', '8', 'Bloco B', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('45678901234', 'Diego Ferreira', '50740000', '200', 'Sala 5', 'Comercial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('56789012345', 'Eduarda Costa', '50750000', '33', 'Apto 102', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('67890123456', 'Felipe Ramos', '50760000', '77', NULL, 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('78901234567', 'Gabriela Nunes', '50770000', '91', 'Apto 204', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('89012345678', 'Henrique Alves', '50780000', '5', 'Fundos', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('90123456789', 'Isabela Rocha', '50790000', '18', 'Apto 401', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('01234567890', 'João Cavalcanti', '50800000', '62', NULL, 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('11122233344', 'Karen Oliveira', '50810000', '14', 'Apto 501', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('22233344455', 'Lucas Pereira', '50820000', '3', NULL, 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('33344455566', 'Mariana Santos', '50830000', '27', 'Bloco A', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('44455566677', 'Nicolas Barbosa', '50840000', '55', 'Sala 2', 'Comercial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('55566677788', 'Olívia Cardoso', '50850000', '88', 'Apto 303', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('66677788899', 'Pedro Monteiro', '50860000', '101', NULL, 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('77788899900', 'Quésia Teixeira', '50870000', '7', 'Apto 201', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('88899900011', 'Rafael Gomes', '50880000', '39', NULL, 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('99900011122', 'Sabrina Pinto', '50890000', '66', 'Apto 102', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco) VALUES ('00011122233', 'Thiago Azevedo', '50900000', '22', 'Fundos', 'Residencial');


-- -------------------------------------------------------------
-- 2. TELEFONE_USUARIO
-- -------------------------------------------------------------
INSERT INTO Telefone_Usuario (cpf_usuario, numero) VALUES ('12345678901', '81991110001');
INSERT INTO Telefone_Usuario (cpf_usuario, numero) VALUES ('23456789012', '81992220002');
INSERT INTO Telefone_Usuario (cpf_usuario, numero) VALUES ('34567890123', '81993330003');
INSERT INTO Telefone_Usuario (cpf_usuario, numero) VALUES ('45678901234', '81994440004');
INSERT INTO Telefone_Usuario (cpf_usuario, numero) VALUES ('56789012345', '81995550005');
INSERT INTO Telefone_Usuario (cpf_usuario, numero) VALUES ('67890123456', '81996660006');
INSERT INTO Telefone_Usuario (cpf_usuario, numero) VALUES ('78901234567', '81997770007');
INSERT INTO Telefone_Usuario (cpf_usuario, numero) VALUES ('89012345678', '81998880008');


-- -------------------------------------------------------------
-- 3. CLIENTE
-- -------------------------------------------------------------
INSERT INTO Cliente (cpf_cliente, tipo_assinatura) VALUES ('12345678901', 'Premium');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura) VALUES ('23456789012', 'Básico');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura) VALUES ('34567890123', 'Premium');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura) VALUES ('45678901234', 'Básico');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura) VALUES ('56789012345', 'Gold');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura) VALUES ('67890123456', 'Básico');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura) VALUES ('78901234567', 'Gold');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura) VALUES ('89012345678', 'Premium');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura) VALUES ('90123456789', 'Básico');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura) VALUES ('01234567890', 'Gold');


-- -------------------------------------------------------------
-- 4. FUNCIONARIO
-- -------------------------------------------------------------
INSERT INTO Funcionario (cpf_funcionario, matricula, cpf_supervisor) VALUES ('44455566677', seq_matricula_func.NEXTVAL, NULL);
INSERT INTO Funcionario (cpf_funcionario, matricula, cpf_supervisor) VALUES ('77788899900', seq_matricula_func.NEXTVAL, '44455566677');
INSERT INTO Funcionario (cpf_funcionario, matricula, cpf_supervisor) VALUES ('88899900011', seq_matricula_func.NEXTVAL, '44455566677');
INSERT INTO Funcionario (cpf_funcionario, matricula, cpf_supervisor) VALUES ('99900011122', seq_matricula_func.NEXTVAL, '77788899900');
INSERT INTO Funcionario (cpf_funcionario, matricula, cpf_supervisor) VALUES ('00011122233', seq_matricula_func.NEXTVAL, '77788899900');


-- -------------------------------------------------------------
-- 5. CARGO
-- -------------------------------------------------------------
INSERT INTO Cargo (cod_cargo, setor, nome) VALUES (seq_cargo.NEXTVAL, 'Comercial', 'Vendedor');
INSERT INTO Cargo (cod_cargo, setor, nome) VALUES (seq_cargo.NEXTVAL, 'Comercial', 'Supervisor de Vendas');
INSERT INTO Cargo (cod_cargo, setor, nome) VALUES (seq_cargo.NEXTVAL, 'Logística', 'Separador');
INSERT INTO Cargo (cod_cargo, setor, nome) VALUES (seq_cargo.NEXTVAL, 'Logística', 'Coordenador de Logística');
INSERT INTO Cargo (cod_cargo, setor, nome) VALUES (seq_cargo.NEXTVAL, 'Atendimento', 'Atendente');
INSERT INTO Cargo (cod_cargo, setor, nome) VALUES (seq_cargo.NEXTVAL, 'Atendimento', 'Gerente de Atendimento');


-- -------------------------------------------------------------
-- 6. HISTORICOCARGOS
-- -------------------------------------------------------------
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida) VALUES ('44455566677', 6, DATE '2018-03-01', NULL);
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida) VALUES ('77788899900', 2, DATE '2019-06-01', NULL);
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida) VALUES ('88899900011', 5, DATE '2020-01-15', NULL);


-- -------------------------------------------------------------
-- 7. CATEGORIA
-- -------------------------------------------------------------
INSERT INTO Categoria (cod_categoria, nome, descricao) VALUES (seq_categoria.NEXTVAL, 'Eletrônicos', 'Smartphones, notebooks e acessórios');
INSERT INTO Categoria (cod_categoria, nome, descricao) VALUES (seq_categoria.NEXTVAL, 'Roupas', 'Vestuário masculino e feminino');
INSERT INTO Categoria (cod_categoria, nome, descricao) VALUES (seq_categoria.NEXTVAL, 'Calçados', 'Tênis, sandálias e sapatos');
INSERT INTO Categoria (cod_categoria, nome, descricao) VALUES (seq_categoria.NEXTVAL, 'Livros', 'Literatura, técnicos e didáticos');
INSERT INTO Categoria (cod_categoria, nome, descricao) VALUES (seq_categoria.NEXTVAL, 'Casa e Jardim', 'Móveis, utensílios e decoração');


-- -------------------------------------------------------------
-- 8. PROMOCAO
-- -------------------------------------------------------------
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim) VALUES (seq_promocao.NEXTVAL, 10.00, DATE '2023-11-01', DATE '2023-11-30');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim) VALUES (seq_promocao.NEXTVAL, 20.00, DATE '2023-12-01', DATE '2023-12-31');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim) VALUES (seq_promocao.NEXTVAL, 15.00, DATE '2024-01-01', DATE '2024-06-30'); -- Promo longa
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim) VALUES (seq_promocao.NEXTVAL, 50.00, DATE '2024-03-01', DATE '2024-03-15');


-- -------------------------------------------------------------
-- 9. TRANSPORTADORA
-- -------------------------------------------------------------
INSERT INTO Transportadora (cnpj, nome, servico) VALUES ('12345678000195', 'Correios', 'PAC e SEDEX');
INSERT INTO Transportadora (cnpj, nome, servico) VALUES ('23456789000106', 'Jadlog', 'Expresso e econômico');
INSERT INTO Transportadora (cnpj, nome, servico) VALUES ('34567890000117', 'Total Express', 'Entrega expressa');


-- -------------------------------------------------------------
-- 10. TELEFONE_TRANSPORTADORA
-- -------------------------------------------------------------
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero) VALUES ('12345678000195', '08007250100');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero) VALUES ('23456789000106', '08000237600');


-- -------------------------------------------------------------
-- 11. PRODUTO (Criando produtos com e sem estoque)
-- -------------------------------------------------------------
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque) VALUES (seq_produto.NEXTVAL, 'Smartphone Samsung Galaxy A55', 1899.99, 50); -- Prod 1
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque) VALUES (seq_produto.NEXTVAL, 'Notebook Dell Inspiron 15', 3499.00, 20); -- Prod 2
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque) VALUES (seq_produto.NEXTVAL, 'Tênis Nike Air Max', 599.90, 80); -- Prod 3
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque) VALUES (seq_produto.NEXTVAL, 'Camiseta Polo Ralph Lauren', 299.00, 100); -- Prod 4
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque) VALUES (seq_produto.NEXTVAL, 'Livro Clean Code', 89.90, 60); -- Prod 5
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque) VALUES (seq_produto.NEXTVAL, 'Cadeira Gamer ThunderX3', 999.00, 15); -- Prod 6
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque) VALUES (seq_produto.NEXTVAL, 'Smart TV LG 55 4K OLED', 3599.00, 0); -- Prod 7 (ESTOQUE ZERO, CAT: Eletrônicos)
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque) VALUES (seq_produto.NEXTVAL, 'Kindle Paperwhite 11a Ger', 699.00, 0); -- Prod 8 (ESTOQUE ZERO, CAT: Eletrônicos)
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque) VALUES (seq_produto.NEXTVAL, 'MacBook Pro M3', 14999.00, 2); -- Prod 9 (Pocas vendas esperadas)
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque) VALUES (seq_produto.NEXTVAL, 'Mouse Pad Genérico', 19.90, 200); -- Prod 10


-- -------------------------------------------------------------
-- 12. HISTORICO_PRECOS (Foco na evolução do Produto 1)
-- -------------------------------------------------------------
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor) VALUES (1, DATE '2022-01-01', 2499.99);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor) VALUES (1, DATE '2023-01-01', 2199.99);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor) VALUES (1, DATE '2023-06-15', 1999.99);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor) VALUES (1, DATE '2023-11-24', 1699.99); -- Black friday
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor) VALUES (1, DATE '2024-01-01', 1899.99);


-- -------------------------------------------------------------
-- 13. PERTENCE
-- -------------------------------------------------------------
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1, 1); -- Eletrônico
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1, 2); -- Eletrônico
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (3, 3); -- Calçados
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (2, 4); -- Roupas
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (4, 5); -- Livros
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (5, 6); -- Casa/Jardim
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1, 7); -- Eletrônico (TV Estoque Zero)
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1, 8); -- Eletrônico (Kindle Estoque Zero)
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1, 9); -- Eletrônico
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1, 10);-- Eletrônico


-- -------------------------------------------------------------
-- 14. ENTREGA (30 entregas cobrindo meses variados)
-- A lógica aqui afeta o tempo médio (Query 7.3)
-- -------------------------------------------------------------
-- Correios (Geralmente leva ~7 a 10 dias)
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega) VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2023-10-01', DATE '2023-10-10', TIMESTAMP '2023-10-09 14:30:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega) VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2023-11-05', DATE '2023-11-15', TIMESTAMP '2023-11-14 10:00:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega) VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2023-12-10', DATE '2023-12-20', TIMESTAMP '2023-12-22 16:00:00'); -- Atrasado
-- Jadlog (Geralmente leva ~4 a 6 dias)
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega) VALUES (seq_entrega.NEXTVAL, '23456789000106', DATE '2024-01-10', DATE '2024-01-15', TIMESTAMP '2024-01-14 09:15:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega) VALUES (seq_entrega.NEXTVAL, '23456789000106', DATE '2024-02-15', DATE '2024-02-20', TIMESTAMP '2024-02-19 11:45:00');
-- Total Express (Geralmente leva ~2 a 3 dias)
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega) VALUES (seq_entrega.NEXTVAL, '34567890000117', DATE '2024-03-01', DATE '2024-03-04', TIMESTAMP '2024-03-03 17:00:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega) VALUES (seq_entrega.NEXTVAL, '34567890000117', DATE '2024-04-10', DATE '2024-04-13', TIMESTAMP '2024-04-12 15:20:00');

-- Adicionando mais até completar 20 entregas variadas (para casar com os pedidos abaixo)
BEGIN
  FOR i IN 8..20 LOOP
    INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega) 
    VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2024-05-01' + i, DATE '2024-05-10' + i, 
            CASE WHEN MOD(i,3)=0 THEN NULL ELSE TIMESTAMP '2024-05-08 12:00:00' + NUMTODSINTERVAL(i, 'DAY') END);
  END LOOP;
END;
/


-- -------------------------------------------------------------
-- 15. PEDIDO (20 Pedidos criados)
-- Espalhados de Set/2023 a Jun/2024 para evolução mensal (7.5)
-- -------------------------------------------------------------
-- Histórico Antigo (Ajudará na Query 7.5 de meses passados)
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '23456789012', TIMESTAMP '2023-09-15 10:00:00', 'Entregue'); -- 1
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '34567890123', TIMESTAMP '2023-10-02 11:30:00', 'Entregue'); -- 2
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '45678901234', TIMESTAMP '2023-11-20 09:15:00', 'Entregue'); -- 3
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '56789012345', TIMESTAMP '2023-12-15 14:45:00', 'Entregue'); -- 4

-- Pedidos recentes da Ana Lima ('12345678901') com Status 'Enviado' (Forçando resultado para a Query 6.2)
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '12345678901', TIMESTAMP '2024-06-18 08:00:00', 'Enviado'); -- 5
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '12345678901', TIMESTAMP '2024-06-19 16:20:00', 'Enviado'); -- 6
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '12345678901', TIMESTAMP '2024-06-20 13:10:00', 'Enviado'); -- 7

-- Mistura de outros status
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '67890123456', TIMESTAMP '2024-01-08 10:30:00', 'Pendente'); -- 8
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '78901234567', TIMESTAMP '2024-02-09 15:00:00', 'Cancelado'); -- 9
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '89012345678', TIMESTAMP '2024-03-10 09:45:00', 'Entregue'); -- 10
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '90123456789', TIMESTAMP '2024-04-11 11:00:00', 'Entregue'); -- 11
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) VALUES (seq_pedido.NEXTVAL, '01234567890', TIMESTAMP '2024-05-12 14:15:00', 'Entregue'); -- 12

-- Expandindo até 20
BEGIN
  FOR i IN 13..20 LOOP
    INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status) 
    VALUES (seq_pedido.NEXTVAL, '23456789012', TIMESTAMP '2024-05-15 00:00:00' + NUMTODSINTERVAL(i, 'DAY'), 'Entregue');
  END LOOP;
END;
/


-- -------------------------------------------------------------
-- 16. PAGAMENTO
-- Trazendo variedade de meios para enriquecer o ticket médio (7.2)
-- -------------------------------------------------------------
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2023-09-15', 'Cartão Crédito', 'Aprovado', 1);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2023-10-02', 'PIX', 'Aprovado', 2);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2023-11-20', 'Boleto', 'Aprovado', 3);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2023-12-15', 'Cartão Débito', 'Aprovado', 4);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-18', 'Cartão Crédito', 'Aprovado', 5);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-19', 'Cartão Crédito', 'Aprovado', 6);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-20', 'PIX', 'Aprovado', 7);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2024-01-08', 'Boleto', 'Pendente', 8);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2024-02-09', 'Cartão Crédito', 'Estornado', 9);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2024-03-10', 'PIX', 'Aprovado', 10);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2024-04-11', 'Cartão Débito', 'Aprovado', 11);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) VALUES (seq_pagamento.NEXTVAL, DATE '2024-05-12', 'PIX', 'Aprovado', 12);

BEGIN
  FOR i IN 13..20 LOOP
    INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido) 
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-05-15' + i, CASE WHEN MOD(i,2)=0 THEN 'Cartão Crédito' ELSE 'PIX' END, 'Aprovado', i);
  END LOOP;
END;
/


-- -------------------------------------------------------------
-- 17. ITEMPEDIDO
-- Adicionando variação forte de notas de avaliação e promoções
-- -------------------------------------------------------------
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (1, 1, 1, 1, 1, 1899.99, 5.0, 'Produto excelente, bateria dura 2 dias!');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (1, 10, 1, NULL, 3, 19.90, 4.0, 'Simples e funcional.');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (2, 2, 2, NULL, 1, 3499.00, 2.0, 'Veio com arranhão na tampa.');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (3, 3, 3, 2, 2, 599.90, 4.5, 'Tênis top.');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (4, 4, 4, NULL, 5, 299.00, 5.0, 'Comprei para a família toda.');
-- Pedidos "Enviados" da Ana (Ainda sem avaliação, pois não chegaram)
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (5, 1, 5, 3, 1, 1899.99, NULL, NULL); 
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (6, 5, 6, 3, 1, 89.90, NULL, NULL); 
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (7, 6, 7, 3, 1, 999.00, NULL, NULL); 

INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (8, 2, 8, NULL, 1, 3499.00, NULL, NULL);
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (9, 3, 9, NULL, 1, 599.90, NULL, NULL);
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (10, 1, 10, 4, 1, 1899.99, 4.0, 'Gostei bastante.');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (11, 4, 11, NULL, 3, 299.00, 3.0, 'Encolheu na lavagem.');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (12, 1, 12, NULL, 1, 1899.99, 4.5, 'Recomendo.');

-- Preenchendo o restante para não dar erro nas chaves (Pedidos 13 a 20)
BEGIN
  FOR i IN 13..20 LOOP
    INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario) 
    VALUES (i, CASE WHEN MOD(i,2)=0 THEN 1 ELSE 6 END, i, 3, 1, 999.00, CASE WHEN MOD(i,3)=0 THEN 2.5 ELSE 4.8 END, 'Avaliação Média');
  END LOOP;
END;
/


-- -------------------------------------------------------------
-- 18. RECLAMACAO
-- Centralizando várias reclamações no Produto 2 (cod_pedido 2 e 8)
-- Isso destacará o Produto 2 no topo do relatório [6.1]
-- -------------------------------------------------------------
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao) 
    VALUES (seq_reclamacao.NEXTVAL, 2, '88899900011', 'Resolvida', 'Produto', 'Tela do notebook veio riscada', DATE '2023-10-10');
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao) 
    VALUES (seq_reclamacao.NEXTVAL, 2, '99900011122', 'Resolvida', 'Produto', 'Fonte do notebook esquentando muito', DATE '2023-10-12');
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao) 
    VALUES (seq_reclamacao.NEXTVAL, 8, '00011122233', 'Pendente', 'Produto', 'Notebook não liga, parou do nada', NULL);
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao) 
    VALUES (seq_reclamacao.NEXTVAL, 11, '88899900011', 'Em Análise', 'Qualidade', 'Camisa descosturou no primeiro uso', NULL);
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao) 
    VALUES (seq_reclamacao.NEXTVAL, 1, '99900011122', 'Resolvida', 'Atraso', 'Atrasou 2 dias da data prevista', DATE '2023-09-20');
