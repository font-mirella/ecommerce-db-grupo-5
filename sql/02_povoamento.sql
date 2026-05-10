-- =============================================================
-- POVOAMENTO DO BANCO DE DADOS — AV4
-- Grupo 5: ecommerce-db-grupo-5
-- =============================================================
-- Sequências assumidas (geradas em 01_criacao.sql):
--   seq_matricula_func, seq_cargo, seq_categoria, seq_promocao,
--   seq_entrega, seq_produto, seq_pedido, seq_pagamento,
--   seq_reclamacao
-- Produto IDs gerados: 1..30
-- Pedido  IDs gerados: 1..35
-- Entrega IDs gerados: 1..30
-- =============================================================


-- =============================================================
-- 1. USUARIO (30 registros)
-- =============================================================
INSERT INTO Usuario VALUES ('12345678901', 'Ana Lima',           '50710000', '12',  'Apto 301',  'Residencial');
INSERT INTO Usuario VALUES ('23456789012', 'Bruno Souza',        '50720000', '45',  'Casa',      'Residencial');
INSERT INTO Usuario VALUES ('34567890123', 'Carla Mendes',       '50730000', '8',   'Bloco B',   'Residencial');
INSERT INTO Usuario VALUES ('45678901234', 'Diego Ferreira',     '50740000', '200', 'Sala 5',    'Comercial');
INSERT INTO Usuario VALUES ('56789012345', 'Eduarda Costa',      '50750000', '33',  'Apto 102',  'Residencial');
INSERT INTO Usuario VALUES ('67890123456', 'Felipe Ramos',       '50760000', '77',  NULL,        'Residencial');
INSERT INTO Usuario VALUES ('78901234567', 'Gabriela Nunes',     '50770000', '91',  'Apto 204',  'Residencial');
INSERT INTO Usuario VALUES ('89012345678', 'Henrique Alves',     '50780000', '5',   'Fundos',    'Residencial');
INSERT INTO Usuario VALUES ('90123456789', 'Isabela Rocha',      '50790000', '18',  'Apto 401',  'Residencial');
INSERT INTO Usuario VALUES ('01234567890', 'João Cavalcanti',    '50800000', '62',  NULL,        'Residencial');
INSERT INTO Usuario VALUES ('11122233344', 'Karen Oliveira',     '50810000', '14',  'Apto 501',  'Residencial');
INSERT INTO Usuario VALUES ('22233344455', 'Lucas Pereira',      '50820000', '3',   NULL,        'Residencial');
INSERT INTO Usuario VALUES ('33344455566', 'Mariana Santos',     '50830000', '27',  'Bloco A',   'Residencial');
INSERT INTO Usuario VALUES ('44455566677', 'Nicolas Barbosa',    '50840000', '55',  'Sala 2',    'Comercial');
INSERT INTO Usuario VALUES ('55566677788', 'Olívia Cardoso',     '50850000', '88',  'Apto 303',  'Residencial');
INSERT INTO Usuario VALUES ('66677788899', 'Pedro Monteiro',     '50860000', '101', NULL,        'Residencial');
INSERT INTO Usuario VALUES ('77788899900', 'Quésia Teixeira',    '50870000', '7',   'Apto 201',  'Residencial');
INSERT INTO Usuario VALUES ('88899900011', 'Rafael Gomes',       '50880000', '39',  NULL,        'Residencial');
INSERT INTO Usuario VALUES ('99900011122', 'Sabrina Pinto',      '50890000', '66',  'Apto 102',  'Residencial');
INSERT INTO Usuario VALUES ('00011122233', 'Thiago Azevedo',     '50900000', '22',  'Fundos',    'Residencial');
INSERT INTO Usuario VALUES ('10011223344', 'Ursula Farias',      '50910000', '9',   'Apto 110',  'Residencial');
INSERT INTO Usuario VALUES ('20122334455', 'Vitor Magalhães',    '50920000', '300', 'Sala 10',   'Comercial');
INSERT INTO Usuario VALUES ('30233445566', 'Wanda Correia',      '50930000', '4',   NULL,        'Residencial');
INSERT INTO Usuario VALUES ('40344556677', 'Xavier Andrade',     '50940000', '19',  'Bloco C',   'Residencial');
INSERT INTO Usuario VALUES ('50455667788', 'Yasmin Leal',        '50950000', '52',  'Apto 601',  'Residencial');
INSERT INTO Usuario VALUES ('60566778899', 'Zé Augusto Lima',    '50960000', '73',  NULL,        'Residencial');
INSERT INTO Usuario VALUES ('70677889900', 'Alice Drummond',     '50970000', '88',  'Casa 2',    'Residencial');
INSERT INTO Usuario VALUES ('80788990011', 'Bernardo Queiroz',   '50980000', '11',  'Apto 405',  'Residencial');
INSERT INTO Usuario VALUES ('90899001122', 'Cecília Vasconcelos','50990000', '35',  NULL,        'Residencial');
INSERT INTO Usuario VALUES ('01900112233', 'Daniel Freitas',     '51000000', '60',  'Cobertura', 'Residencial');


-- =============================================================
-- 2. TELEFONE_USUARIO
-- =============================================================
INSERT INTO Telefone_Usuario VALUES ('12345678901', '81991110001');
INSERT INTO Telefone_Usuario VALUES ('12345678901', '81988880001'); -- segundo telefone
INSERT INTO Telefone_Usuario VALUES ('23456789012', '81992220002');
INSERT INTO Telefone_Usuario VALUES ('34567890123', '81993330003');
INSERT INTO Telefone_Usuario VALUES ('45678901234', '81994440004');
INSERT INTO Telefone_Usuario VALUES ('56789012345', '81995550005');
INSERT INTO Telefone_Usuario VALUES ('67890123456', '81996660006');
INSERT INTO Telefone_Usuario VALUES ('78901234567', '81997770007');
INSERT INTO Telefone_Usuario VALUES ('89012345678', '81998880008');
INSERT INTO Telefone_Usuario VALUES ('90123456789', '81999990009');
INSERT INTO Telefone_Usuario VALUES ('01234567890', '81911110010');
INSERT INTO Telefone_Usuario VALUES ('11122233344', '81912220011');
INSERT INTO Telefone_Usuario VALUES ('22233344455', '81913330012');
INSERT INTO Telefone_Usuario VALUES ('33344455566', '81914440013');
INSERT INTO Telefone_Usuario VALUES ('44455566677', '81915550014');
INSERT INTO Telefone_Usuario VALUES ('55566677788', '81916660015');
INSERT INTO Telefone_Usuario VALUES ('66677788899', '81917770016');
INSERT INTO Telefone_Usuario VALUES ('77788899900', '81918880017');
INSERT INTO Telefone_Usuario VALUES ('88899900011', '81919990018');
INSERT INTO Telefone_Usuario VALUES ('99900011122', '81920000019');
INSERT INTO Telefone_Usuario VALUES ('00011122233', '81921110020');
INSERT INTO Telefone_Usuario VALUES ('10011223344', '81922220021');
INSERT INTO Telefone_Usuario VALUES ('20122334455', '81923330022');
INSERT INTO Telefone_Usuario VALUES ('30233445566', '81924440023');
INSERT INTO Telefone_Usuario VALUES ('40344556677', '81925550024');
INSERT INTO Telefone_Usuario VALUES ('50455667788', '81926660025');
INSERT INTO Telefone_Usuario VALUES ('60566778899', '81927770026');
INSERT INTO Telefone_Usuario VALUES ('70677889900', '81928880027');
INSERT INTO Telefone_Usuario VALUES ('80788990011', '81929990028');
INSERT INTO Telefone_Usuario VALUES ('90899001122', '81930000029');
INSERT INTO Telefone_Usuario VALUES ('01900112233', '81931110030');


-- =============================================================
-- 3. CLIENTE (22 dos 30 usuários são clientes)
-- Variedade de assinaturas para enriquecer consultas
-- =============================================================
INSERT INTO Cliente VALUES ('12345678901', 'Premium');
INSERT INTO Cliente VALUES ('23456789012', 'Básico');
INSERT INTO Cliente VALUES ('34567890123', 'Premium');
INSERT INTO Cliente VALUES ('45678901234', 'Básico');
INSERT INTO Cliente VALUES ('56789012345', 'Gold');
INSERT INTO Cliente VALUES ('67890123456', 'Básico');
INSERT INTO Cliente VALUES ('78901234567', 'Gold');
INSERT INTO Cliente VALUES ('89012345678', 'Premium');
INSERT INTO Cliente VALUES ('90123456789', 'Básico');
INSERT INTO Cliente VALUES ('01234567890', 'Gold');
INSERT INTO Cliente VALUES ('11122233344', 'Básico');
INSERT INTO Cliente VALUES ('22233344455', 'Premium');
INSERT INTO Cliente VALUES ('33344455566', 'Básico');
INSERT INTO Cliente VALUES ('55566677788', 'Gold');
INSERT INTO Cliente VALUES ('66677788899', 'Básico');
INSERT INTO Cliente VALUES ('10011223344', 'Premium');
INSERT INTO Cliente VALUES ('20122334455', 'Gold');
INSERT INTO Cliente VALUES ('30233445566', 'Básico');
INSERT INTO Cliente VALUES ('40344556677', 'Premium');
INSERT INTO Cliente VALUES ('50455667788', 'Gold');
INSERT INTO Cliente VALUES ('70677889900', 'Básico');
INSERT INTO Cliente VALUES ('80788990011', 'Premium');


-- =============================================================
-- 4. FUNCIONARIO (8 funcionários, hierarquia em dois níveis)
-- =============================================================
INSERT INTO Funcionario VALUES ('44455566677', seq_matricula_func.NEXTVAL, NULL);           -- diretor geral
INSERT INTO Funcionario VALUES ('77788899900', seq_matricula_func.NEXTVAL, '44455566677');
INSERT INTO Funcionario VALUES ('88899900011', seq_matricula_func.NEXTVAL, '44455566677');
INSERT INTO Funcionario VALUES ('99900011122', seq_matricula_func.NEXTVAL, '77788899900');
INSERT INTO Funcionario VALUES ('00011122233', seq_matricula_func.NEXTVAL, '77788899900');
INSERT INTO Funcionario VALUES ('60566778899', seq_matricula_func.NEXTVAL, '88899900011');
INSERT INTO Funcionario VALUES ('90899001122', seq_matricula_func.NEXTVAL, '88899900011');
INSERT INTO Funcionario VALUES ('01900112233', seq_matricula_func.NEXTVAL, '44455566677');


-- =============================================================
-- 5. CARGO (15 cargos, IDs 1..15)
-- =============================================================
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Comercial',   'Vendedor');               -- 1
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Comercial',   'Supervisor de Vendas');   -- 2
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Logística',   'Separador');              -- 3
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Logística',   'Coordenador de Logística');-- 4
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Atendimento', 'Atendente');              -- 5
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Atendimento', 'Gerente de Atendimento'); -- 6
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'TI',          'Analista de Sistemas');   -- 7
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'TI',          'Desenvolvedor');          -- 8
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Financeiro',  'Analista Financeiro');    -- 9
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Financeiro',  'Gerente Financeiro');     -- 10
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'RH',          'Analista de RH');         -- 11
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'RH',          'Gerente de RH');          -- 12
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Compras',     'Comprador');              -- 13
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Compras',     'Gerente de Compras');     -- 14
INSERT INTO Cargo VALUES (seq_cargo.NEXTVAL, 'Marketing',   'Analista de Marketing');  -- 15


-- =============================================================
-- 6. HISTORICOCARGOS (histórico realista com promoções internas)
-- =============================================================
-- Nicolas Barbosa: atendente → gerente (atual)
INSERT INTO HistoricoCargos VALUES ('44455566677', 5,  DATE '2012-01-01', DATE '2015-05-31');
INSERT INTO HistoricoCargos VALUES ('44455566677', 6,  DATE '2015-06-01', DATE '2018-02-28');
INSERT INTO HistoricoCargos VALUES ('44455566677', 10, DATE '2018-03-01', NULL);
-- Quésia Teixeira: vendedor → supervisor
INSERT INTO HistoricoCargos VALUES ('77788899900', 13, DATE '2014-09-01', DATE '2016-12-31');
INSERT INTO HistoricoCargos VALUES ('77788899900', 1,  DATE '2017-01-01', DATE '2019-05-31');
INSERT INTO HistoricoCargos VALUES ('77788899900', 2,  DATE '2019-06-01', NULL);
-- Rafael Gomes: analista RH → atendente → gerente atendimento
INSERT INTO HistoricoCargos VALUES ('88899900011', 11, DATE '2018-05-01', DATE '2019-12-31');
INSERT INTO HistoricoCargos VALUES ('88899900011', 5,  DATE '2020-01-15', DATE '2022-04-30');
INSERT INTO HistoricoCargos VALUES ('88899900011', 6,  DATE '2022-05-01', NULL);
-- Sabrina Pinto: comprador → supervisor de vendas
INSERT INTO HistoricoCargos VALUES ('99900011122', 13, DATE '2019-08-01', DATE '2021-02-09');
INSERT INTO HistoricoCargos VALUES ('99900011122', 1,  DATE '2021-02-10', DATE '2023-01-31');
INSERT INTO HistoricoCargos VALUES ('99900011122', 2,  DATE '2023-02-01', NULL);
-- Thiago Azevedo: marketing → dev → analista de sistemas
INSERT INTO HistoricoCargos VALUES ('00011122233', 15, DATE '2019-01-01', DATE '2020-02-28');
INSERT INTO HistoricoCargos VALUES ('00011122233', 8,  DATE '2020-03-01', DATE '2022-06-30');
INSERT INTO HistoricoCargos VALUES ('00011122233', 7,  DATE '2022-07-01', NULL);
-- Zé Augusto Lima: separador → coordenador logística
INSERT INTO HistoricoCargos VALUES ('60566778899', 3,  DATE '2020-05-01', DATE '2023-04-30');
INSERT INTO HistoricoCargos VALUES ('60566778899', 4,  DATE '2023-05-01', NULL);
-- Cecília Vasconcelos: analista financeiro (atual)
INSERT INTO HistoricoCargos VALUES ('90899001122', 9,  DATE '2021-08-01', NULL);
-- Daniel Freitas: gerente de compras (atual)
INSERT INTO HistoricoCargos VALUES ('01900112233', 14, DATE '2017-03-01', NULL);


-- =============================================================
-- 7. CATEGORIA (15 categorias, IDs 1..15)
-- =============================================================
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Eletrônicos',  'Smartphones, notebooks e acessórios');  -- 1
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Roupas',       'Vestuário masculino e feminino');       -- 2
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Calçados',     'Tênis, sandálias e sapatos');           -- 3
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Livros',       'Literatura, técnicos e didáticos');     -- 4
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Casa e Jardim','Móveis, utensílios e decoração');       -- 5
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Esportes',     'Equipamentos e roupas esportivas');     -- 6
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Beleza',       'Cosméticos e cuidados pessoais');       -- 7
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Brinquedos',   'Jogos e brinquedos infantis');          -- 8
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Alimentos',    'Produtos alimentícios e bebidas');      -- 9
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Pet',          'Produtos para animais de estimação');   -- 10
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Ferramentas',  'Ferramentas manuais e elétricas');      -- 11
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Automotivo',   'Acessórios e peças para veículos');     -- 12
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Saúde',        'Suplementos e equipamentos de saúde'); -- 13
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Papelaria',    'Material escolar e de escritório');     -- 14
INSERT INTO Categoria VALUES (seq_categoria.NEXTVAL, 'Games',        'Jogos, consoles e periféricos');        -- 15


-- =============================================================
-- 8. PROMOCAO (18 promoções ao longo de 2024-2025)
-- =============================================================
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 10.00, DATE '2024-01-01', DATE '2024-01-31');  -- 1
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 15.00, DATE '2024-02-01', DATE '2024-02-29');  -- 2
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 20.00, DATE '2024-03-01', DATE '2024-03-15');  -- 3
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL,  5.00, DATE '2024-04-01', DATE '2024-04-30');  -- 4
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 25.00, DATE '2024-05-01', DATE '2024-05-10');  -- 5
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 30.00, DATE '2024-06-01', DATE '2024-06-30');  -- 6
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 12.00, DATE '2024-07-01', DATE '2024-07-15');  -- 7
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL,  8.00, DATE '2024-08-01', DATE '2024-08-31');  -- 8
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 18.00, DATE '2024-09-01', DATE '2024-09-30');  -- 9
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 22.00, DATE '2024-10-01', DATE '2024-10-31');  -- 10
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 50.00, DATE '2024-11-29', DATE '2024-11-30');  -- 11 Black Friday
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 35.00, DATE '2024-12-20', DATE '2024-12-25');  -- 12 Natal
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL,  7.00, DATE '2025-01-01', DATE '2025-01-15');  -- 13
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 14.00, DATE '2025-02-01', DATE '2025-02-28');  -- 14
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 40.00, DATE '2025-03-01', DATE '2025-03-31');  -- 15
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL,  6.00, DATE '2025-04-01', DATE '2025-04-30');  -- 16
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 45.00, DATE '2025-05-01', DATE '2025-05-05');  -- 17 Dia das Mães
INSERT INTO Promocao VALUES (seq_promocao.NEXTVAL, 11.00, DATE '2025-06-01', DATE '2025-06-30');  -- 18


-- =============================================================
-- 9. TRANSPORTADORA (12 transportadoras)
-- =============================================================
INSERT INTO Transportadora VALUES ('12345678000195', 'Correios',       'PAC e SEDEX');
INSERT INTO Transportadora VALUES ('23456789000106', 'Jadlog',         'Expresso e econômico');
INSERT INTO Transportadora VALUES ('34567890000117', 'Total Express',  'Entrega expressa');
INSERT INTO Transportadora VALUES ('45678901000128', 'Braspress',      'Carga fracionada');
INSERT INTO Transportadora VALUES ('56789012000139', 'Loggi',          'Entrega no dia');
INSERT INTO Transportadora VALUES ('67890123000140', 'Mercado Envios', 'Integrado marketplace');
INSERT INTO Transportadora VALUES ('78901234000151', 'Azul Cargo',     'Aéreo e terrestre');
INSERT INTO Transportadora VALUES ('89012345000162', 'TNT Brasil',     'Expresso nacional');
INSERT INTO Transportadora VALUES ('90123456000173', 'DHL Express',    'Internacional e nacional');
INSERT INTO Transportadora VALUES ('01234567000184', 'FedEx',          'Expresso internacional');
INSERT INTO Transportadora VALUES ('11122233000195', 'Rodonaves',      'Carga rodoviária');
INSERT INTO Transportadora VALUES ('44455566000128', 'Sequoia',        'Varejo e e-commerce');


-- =============================================================
-- 10. TELEFONE_TRANSPORTADORA
-- =============================================================
INSERT INTO Telefone_Transportadora VALUES ('12345678000195', '08007250100');
INSERT INTO Telefone_Transportadora VALUES ('23456789000106', '08000237600');
INSERT INTO Telefone_Transportadora VALUES ('34567890000117', '01131970000');
INSERT INTO Telefone_Transportadora VALUES ('45678901000128', '04003434300');
INSERT INTO Telefone_Transportadora VALUES ('56789012000139', '01140030832');
INSERT INTO Telefone_Transportadora VALUES ('67890123000140', '08004444444');
INSERT INTO Telefone_Transportadora VALUES ('78901234000151', '08007277778');
INSERT INTO Telefone_Transportadora VALUES ('89012345000162', '08007770606');
INSERT INTO Telefone_Transportadora VALUES ('90123456000173', '01131218700');
INSERT INTO Telefone_Transportadora VALUES ('01234567000184', '08007333339');
INSERT INTO Telefone_Transportadora VALUES ('11122233000195', '08004040040');
INSERT INTO Telefone_Transportadora VALUES ('44455566000128', '01140041004');


-- =============================================================
-- 11. ENTREGA (30 entregas — IDs 1..30)
-- Mix de entregues, em trânsito (NULL) e atrasadas
-- =============================================================
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2024-06-01', DATE '2024-06-05', TIMESTAMP '2024-06-05 14:30:00'); -- 1
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '23456789000106', DATE '2024-06-02', DATE '2024-06-04', TIMESTAMP '2024-06-04 09:15:00'); -- 2
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '34567890000117', DATE '2024-06-03', DATE '2024-06-06', TIMESTAMP '2024-06-06 17:00:00'); -- 3
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '45678901000128', DATE '2024-06-04', DATE '2024-06-10', NULL);                            -- 4 em trânsito
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '56789012000139', DATE '2024-06-05', DATE '2024-06-06', TIMESTAMP '2024-06-06 11:45:00'); -- 5
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2024-06-06', DATE '2024-06-12', TIMESTAMP '2024-06-12 15:20:00'); -- 6
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '67890123000140', DATE '2024-06-07', DATE '2024-06-09', TIMESTAMP '2024-06-09 10:00:00'); -- 7
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '78901234000151', DATE '2024-06-08', DATE '2024-06-11', NULL);                            -- 8 em trânsito
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '89012345000162', DATE '2024-06-09', DATE '2024-06-13', TIMESTAMP '2024-06-13 16:30:00'); -- 9
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '23456789000106', DATE '2024-06-10', DATE '2024-06-14', TIMESTAMP '2024-06-14 08:00:00'); -- 10
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '90123456000173', DATE '2024-06-11', DATE '2024-06-15', TIMESTAMP '2024-06-15 13:10:00'); -- 11
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '34567890000117', DATE '2024-06-12', DATE '2024-06-16', NULL);                            -- 12 em trânsito
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '56789012000139', DATE '2024-06-13', DATE '2024-06-14', TIMESTAMP '2024-06-14 18:50:00'); -- 13
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2024-06-14', DATE '2024-06-20', TIMESTAMP '2024-06-20 12:00:00'); -- 14
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '44455566000128', DATE '2024-06-15', DATE '2024-06-18', TIMESTAMP '2024-06-18 09:30:00'); -- 15
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '67890123000140', DATE '2024-06-16', DATE '2024-06-18', NULL);                            -- 16 em trânsito
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '23456789000106', DATE '2024-06-17', DATE '2024-06-21', TIMESTAMP '2024-06-21 14:00:00'); -- 17
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '78901234000151', DATE '2024-06-18', DATE '2024-06-22', TIMESTAMP '2024-06-22 10:45:00'); -- 18
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '11122233000195', DATE '2024-08-01', DATE '2024-08-07', TIMESTAMP '2024-08-07 16:00:00'); -- 19
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2024-08-03', DATE '2024-08-09', TIMESTAMP '2024-08-09 10:30:00'); -- 20
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '56789012000139', DATE '2024-09-10', DATE '2024-09-11', TIMESTAMP '2024-09-11 08:00:00'); -- 21
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '23456789000106', DATE '2024-10-05', DATE '2024-10-09', TIMESTAMP '2024-10-09 17:20:00'); -- 22
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '89012345000162', DATE '2024-11-01', DATE '2024-11-05', TIMESTAMP '2024-11-05 14:10:00'); -- 23
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '44455566000128', DATE '2024-11-30', DATE '2024-12-03', TIMESTAMP '2024-12-03 09:00:00'); -- 24
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2024-12-21', DATE '2024-12-24', TIMESTAMP '2024-12-24 11:00:00'); -- 25
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '34567890000117', DATE '2025-01-05', DATE '2025-01-08', NULL);                            -- 26 em trânsito
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '67890123000140', DATE '2025-02-10', DATE '2025-02-12', TIMESTAMP '2025-02-12 15:30:00'); -- 27
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '78901234000151', DATE '2025-03-15', DATE '2025-03-18', TIMESTAMP '2025-03-18 08:45:00'); -- 28
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '56789012000139', DATE '2025-04-01', DATE '2025-04-02', TIMESTAMP '2025-04-02 19:00:00'); -- 29
INSERT INTO Entrega VALUES (seq_entrega.NEXTVAL, '23456789000106', DATE '2025-05-02', DATE '2025-05-05', NULL);                            -- 30 em trânsito


-- =============================================================
-- 12. PRODUTO (30 produtos — IDs 1..30)
-- Variedade de preços e estoque para testar BETWEEN, IS NULL (estq=0), etc.
-- =============================================================
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Smartphone Samsung Galaxy A55',     1899.99,  50); -- 1
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Notebook Dell Inspiron 15',         3499.00,  20); -- 2
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Tênis Nike Air Max',                 599.90,  80); -- 3
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Camiseta Polo Ralph Lauren',         299.00, 100); -- 4
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Livro Clean Code',                    89.90,  60); -- 5
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Cadeira Gamer ThunderX3',            999.00,   0); -- 6  estoque zerado (query 6.4)
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Fone JBL Tune 510BT',               249.90,  40); -- 7
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Mochila Samsonite 30L',              349.00,  30); -- 8
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Cafeteira Nespresso Essenza',        699.00,  25); -- 9
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Monitor LG 27" 4K',               2199.00,  18); -- 10
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Teclado Mecânico Redragon',          379.00,  35); -- 11
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Mouse Logitech MX Master 3',         599.00,  45); -- 12
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Whey Protein Growth 900g',           179.90,  70); -- 13
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Tênis Adidas Ultraboost',            749.90,  55); -- 14
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Smartwatch Apple Watch SE',         1799.00,  22); -- 15
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Headset HyperX Cloud II',            449.00,  28); -- 16
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Livro Design Patterns',               79.90,  50); -- 17
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Panela de Pressão Tramontina 4L',    199.00,  40); -- 18
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Câmera GoPro Hero 12',             2299.00,  12); -- 19
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Tablet Samsung Tab A9',            1499.00,  30); -- 20
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Controle PS5 DualSense',            449.90,  38); -- 21
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Tênis Puma RS-X',                   389.90,  60); -- 22
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Livro O Poder do Hábito',            49.90,  90); -- 23
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'SSD Kingston 1TB NVMe',             399.00,   0); -- 24  estoque zerado
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Creme Hidratante Neutrogena 400ml',  42.90, 120); -- 25
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Raquete Wilson Pro Staff 97',       1350.00,   8); -- 26
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Câmera Mirrorless Sony ZV-E10',    3799.00,   5); -- 27
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Bermuda Under Armour Tech',          149.90,  75); -- 28
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Impressora HP LaserJet M110we',    1250.00,  10); -- 29
INSERT INTO Produto VALUES (seq_produto.NEXTVAL, 'Caixa de Som JBL Charge 5',         799.00,  15); -- 30


-- =============================================================
-- 13. HISTORICO_PRECOS (histórico rico para query 6.3 e trigger 7.3)
-- =============================================================
INSERT INTO HistoricoPrecos VALUES (1,  DATE '2023-01-01', 2199.99);
INSERT INTO HistoricoPrecos VALUES (1,  DATE '2024-01-01', 1999.99);
INSERT INTO HistoricoPrecos VALUES (1,  DATE '2024-06-01', 1899.99);
INSERT INTO HistoricoPrecos VALUES (2,  DATE '2023-01-01', 3999.00);
INSERT INTO HistoricoPrecos VALUES (2,  DATE '2024-01-01', 3699.00);
INSERT INTO HistoricoPrecos VALUES (2,  DATE '2024-06-01', 3499.00);
INSERT INTO HistoricoPrecos VALUES (3,  DATE '2023-06-01',  699.90);
INSERT INTO HistoricoPrecos VALUES (3,  DATE '2024-01-01',  649.90);
INSERT INTO HistoricoPrecos VALUES (3,  DATE '2024-06-01',  599.90);
INSERT INTO HistoricoPrecos VALUES (5,  DATE '2023-01-01',  109.90);
INSERT INTO HistoricoPrecos VALUES (5,  DATE '2024-01-01',   99.90);
INSERT INTO HistoricoPrecos VALUES (5,  DATE '2024-06-01',   89.90);
INSERT INTO HistoricoPrecos VALUES (6,  DATE '2023-01-01', 1399.00);
INSERT INTO HistoricoPrecos VALUES (6,  DATE '2024-01-01', 1199.00);
INSERT INTO HistoricoPrecos VALUES (6,  DATE '2024-06-01',  999.00);
INSERT INTO HistoricoPrecos VALUES (10, DATE '2023-01-01', 2799.00);
INSERT INTO HistoricoPrecos VALUES (10, DATE '2024-01-01', 2499.00);
INSERT INTO HistoricoPrecos VALUES (10, DATE '2024-06-01', 2199.00);
INSERT INTO HistoricoPrecos VALUES (15, DATE '2023-01-01', 2499.00);
INSERT INTO HistoricoPrecos VALUES (15, DATE '2024-01-01', 2199.00);
INSERT INTO HistoricoPrecos VALUES (15, DATE '2024-06-01', 1799.00);
INSERT INTO HistoricoPrecos VALUES (19, DATE '2023-01-01', 2799.00);
INSERT INTO HistoricoPrecos VALUES (19, DATE '2024-01-01', 2499.00);
INSERT INTO HistoricoPrecos VALUES (19, DATE '2024-06-01', 2299.00);
INSERT INTO HistoricoPrecos VALUES (13, DATE '2023-06-01',  219.90);
INSERT INTO HistoricoPrecos VALUES (13, DATE '2024-01-01',  199.90);
INSERT INTO HistoricoPrecos VALUES (13, DATE '2024-06-01',  179.90);
INSERT INTO HistoricoPrecos VALUES (27, DATE '2023-01-01', 4299.00);
INSERT INTO HistoricoPrecos VALUES (27, DATE '2024-01-01', 3999.00);
INSERT INTO HistoricoPrecos VALUES (27, DATE '2024-06-01', 3799.00);


-- =============================================================
-- 14. PERTENCE (produtos distribuídos em categorias)
-- =============================================================
-- Eletrônicos (1)
INSERT INTO Pertence VALUES (1,  1);
INSERT INTO Pertence VALUES (1,  2);
INSERT INTO Pertence VALUES (1,  7);
INSERT INTO Pertence VALUES (1,  10);
INSERT INTO Pertence VALUES (1,  11);
INSERT INTO Pertence VALUES (1,  12);
INSERT INTO Pertence VALUES (1,  15);
INSERT INTO Pertence VALUES (1,  16);
INSERT INTO Pertence VALUES (1,  19);
INSERT INTO Pertence VALUES (1,  20);
INSERT INTO Pertence VALUES (1,  24); -- SSD (estoque zerado → query 6.4 não aparece pois cat é 1, não Eletrônicos... ajustado abaixo)
INSERT INTO Pertence VALUES (1,  27);
INSERT INTO Pertence VALUES (1,  29);
INSERT INTO Pertence VALUES (1,  30);
-- Roupas (2)
INSERT INTO Pertence VALUES (2,  4);
INSERT INTO Pertence VALUES (2,  28);
-- Calçados (3)
INSERT INTO Pertence VALUES (3,  3);
INSERT INTO Pertence VALUES (3,  14);
INSERT INTO Pertence VALUES (3,  22);
-- Livros (4)
INSERT INTO Pertence VALUES (4,  5);
INSERT INTO Pertence VALUES (4,  17);
INSERT INTO Pertence VALUES (4,  23);
-- Casa e Jardim (5)
INSERT INTO Pertence VALUES (5,  9);
INSERT INTO Pertence VALUES (5,  18);
-- Esportes (6)
INSERT INTO Pertence VALUES (6,  8);
INSERT INTO Pertence VALUES (6,  26);
-- Beleza (7)
INSERT INTO Pertence VALUES (7,  25);
-- Games (15)
INSERT INTO Pertence VALUES (15, 6);  -- Cadeira Gamer (estoque 0, cat Eletrônicos e Games)
INSERT INTO Pertence VALUES (15, 21);
-- Saúde (13)
INSERT INTO Pertence VALUES (13, 13);


-- =============================================================
-- 15. PEDIDO (35 pedidos — IDs 1..35)
-- Distribuídos entre clientes, meses e status variados
-- =============================================================
-- Junho 2024
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '12345678901', TIMESTAMP '2024-06-01 10:00:00', 'Entregue');  -- 1
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '23456789012', TIMESTAMP '2024-06-02 11:30:00', 'Entregue');  -- 2
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '34567890123', TIMESTAMP '2024-06-03 09:15:00', 'Entregue');  -- 3
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '45678901234', TIMESTAMP '2024-06-04 14:45:00', 'Enviado');   -- 4
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '56789012345', TIMESTAMP '2024-06-05 08:00:00', 'Entregue');  -- 5
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '67890123456', TIMESTAMP '2024-06-06 16:20:00', 'Cancelado'); -- 6
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '78901234567', TIMESTAMP '2024-06-07 13:10:00', 'Entregue');  -- 7
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '89012345678', TIMESTAMP '2024-06-08 10:30:00', 'Pendente');  -- 8
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '90123456789', TIMESTAMP '2024-06-09 15:00:00', 'Cancelado'); -- 9
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '01234567890', TIMESTAMP '2024-06-10 09:45:00', 'Entregue');  -- 10
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '12345678901', TIMESTAMP '2024-06-11 11:00:00', 'Entregue');  -- 11
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '23456789012', TIMESTAMP '2024-06-12 14:15:00', 'Enviado');   -- 12
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '34567890123', TIMESTAMP '2024-06-13 08:30:00', 'Entregue');  -- 13
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '56789012345', TIMESTAMP '2024-06-14 17:00:00', 'Pendente');  -- 14
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '78901234567', TIMESTAMP '2024-06-15 12:00:00', 'Entregue');  -- 15
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '11122233344', TIMESTAMP '2024-06-16 10:10:00', 'Entregue');  -- 16
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '22233344455', TIMESTAMP '2024-06-17 13:45:00', 'Enviado');   -- 17
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '33344455566', TIMESTAMP '2024-06-18 09:00:00', 'Entregue');  -- 18
-- Agosto 2024
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '55566677788', TIMESTAMP '2024-08-05 11:00:00', 'Entregue');  -- 19
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '66677788899', TIMESTAMP '2024-08-10 14:30:00', 'Cancelado'); -- 20
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '10011223344', TIMESTAMP '2024-08-12 09:00:00', 'Entregue');  -- 21
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '12345678901', TIMESTAMP '2024-08-20 16:00:00', 'Entregue');  -- 22
-- Setembro-Outubro 2024
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '40344556677', TIMESTAMP '2024-09-15 10:30:00', 'Entregue');  -- 23
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '50455667788', TIMESTAMP '2024-10-01 08:45:00', 'Entregue');  -- 24
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '22233344455', TIMESTAMP '2024-10-22 15:00:00', 'Enviado');   -- 25
-- Black Friday / Natal 2024
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '56789012345', TIMESTAMP '2024-11-29 22:00:00', 'Entregue');  -- 26
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '78901234567', TIMESTAMP '2024-11-30 09:15:00', 'Entregue');  -- 27
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '01234567890', TIMESTAMP '2024-12-21 10:00:00', 'Entregue');  -- 28
-- 2025
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '80788990011', TIMESTAMP '2025-01-08 11:30:00', 'Enviado');   -- 29
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '12345678901', TIMESTAMP '2025-02-14 14:00:00', 'Entregue');  -- 30
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '20122334455', TIMESTAMP '2025-03-20 08:00:00', 'Entregue');  -- 31
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '34567890123', TIMESTAMP '2025-03-25 17:30:00', 'Cancelado'); -- 32
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '50455667788', TIMESTAMP '2025-04-10 10:00:00', 'Entregue');  -- 33
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '70677889900', TIMESTAMP '2025-05-02 13:00:00', 'Enviado');   -- 34
INSERT INTO Pedido VALUES (seq_pedido.NEXTVAL, '55566677788', TIMESTAMP '2025-05-05 09:00:00', 'Pendente');  -- 35


-- =============================================================
-- 16. PAGAMENTO (35 pagamentos, um por pedido)
-- =============================================================
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-01', 'Cartão Crédito', 'Aprovado',  1);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-02', 'PIX',            'Aprovado',  2);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-03', 'Boleto',         'Aprovado',  3);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-04', 'Cartão Débito',  'Aprovado',  4);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-05', 'PIX',            'Aprovado',  5);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-06', 'Cartão Crédito', 'Estornado', 6);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-07', 'PIX',            'Aprovado',  7);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-08', 'Boleto',         'Pendente',  8);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-09', 'Cartão Crédito', 'Estornado', 9);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-10', 'PIX',            'Aprovado',  10);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-11', 'Cartão Crédito', 'Aprovado',  11);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-12', 'PIX',            'Aprovado',  12);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-13', 'Cartão Débito',  'Aprovado',  13);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-14', 'Boleto',         'Pendente',  14);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-15', 'PIX',            'Aprovado',  15);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-16', 'Cartão Crédito', 'Aprovado',  16);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-17', 'PIX',            'Aprovado',  17);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-18', 'Cartão Crédito', 'Aprovado',  18);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-08-05', 'PIX',            'Aprovado',  19);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-08-10', 'Boleto',         'Estornado', 20);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-08-12', 'Cartão Crédito', 'Aprovado',  21);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-08-20', 'PIX',            'Aprovado',  22);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-09-15', 'Cartão Débito',  'Aprovado',  23);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-10-01', 'PIX',            'Aprovado',  24);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-10-22', 'Cartão Crédito', 'Aprovado',  25);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-11-29', 'PIX',            'Aprovado',  26);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-11-30', 'Cartão Crédito', 'Aprovado',  27);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2024-12-21', 'PIX',            'Aprovado',  28);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2025-01-08', 'Boleto',         'Pendente',  29);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2025-02-14', 'PIX',            'Aprovado',  30);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2025-03-20', 'Cartão Crédito', 'Aprovado',  31);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2025-03-25', 'Cartão Débito',  'Estornado', 32);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2025-04-10', 'PIX',            'Aprovado',  33);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2025-05-02', 'Cartão Crédito', 'Aprovado',  34);
INSERT INTO Pagamento VALUES (seq_pagamento.NEXTVAL, DATE '2025-05-05', 'Boleto',         'Pendente',  35);


-- =============================================================
-- 17. RECLAMACAO (20 reclamações variadas — query 6.1 e 7.4)
-- =============================================================
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 9,  '88899900011', 'Resolvida',  'Cancelamento', 'Cliente solicitou cancelamento do pedido',        DATE '2024-06-11');
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 3,  '99900011122', 'Resolvida',  'Atraso',       'Produto chegou fora do prazo estimado',           DATE '2024-06-15');
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 8,  '88899900011', 'Pendente',   'Pagamento',    'Boleto venceu e cliente não conseguiu reemitir',  NULL);
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 5,  '00011122233', 'Resolvida',  'Produto',      'Item chegou com embalagem danificada',            DATE '2024-06-10');
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 12, '99900011122', 'Em Análise', 'Entrega',      'Consta entregue mas cliente não recebeu',         NULL);
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 1,  '88899900011', 'Resolvida',  'Produto',      'Produto diferente do anunciado',                  DATE '2024-06-08');
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 14, '00011122233', 'Pendente',   'Pagamento',    'Cobrança duplicada no cartão de crédito',         NULL);
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 7,  '99900011122', 'Resolvida',  'Qualidade',    'Produto parou de funcionar após 2 dias',          DATE '2024-06-20');
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 16, '88899900011', 'Em Análise', 'Entrega',      'Entrega feita no endereço errado',                NULL);
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 2,  '00011122233', 'Resolvida',  'Troca',        'Cliente quer trocar por tamanho diferente',       DATE '2024-06-14');
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 11, '99900011122', 'Pendente',   'Produto',      'Falta de acessório na caixa do produto',          NULL);
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 6,  '60566778899', 'Resolvida',  'Cancelamento', 'Desistência dentro do prazo de arrependimento',   DATE '2024-06-09');
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 18, '90899001122', 'Em Análise', 'Qualidade',    'Produto chegou com defeito de fabricação',        NULL);
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 4,  '60566778899', 'Resolvida',  'Atraso',       'Atraso superior a 5 dias úteis',                  DATE '2024-06-22');
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 10, '88899900011', 'Pendente',   'Troca',        'Cliente recebeu cor errada do produto',           NULL);
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 20, '99900011122', 'Em Análise', 'Entrega',      'Pedido extraviado pela transportadora',           NULL);
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 22, '00011122233', 'Resolvida',  'Produto',      'Produto com peça faltando',                       DATE '2024-08-18');
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 26, '60566778899', 'Resolvida',  'Produto',      'Item danificado na embalagem Black Friday',        DATE '2024-12-05');
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 32, '90899001122', 'Pendente',   'Cancelamento', 'Cliente cancelou mas estorno ainda não caiu',     NULL);
INSERT INTO Reclamacao VALUES (seq_reclamacao.NEXTVAL, 35, '88899900011', 'Em Análise', 'Pagamento',    'Boleto gerado mas sistema não reconhece pagamento',NULL);


-- =============================================================
-- 18. ATRIBUI (promoções atribuídas a clientes por categoria)
-- =============================================================
INSERT INTO Atribui VALUES ('12345678901', 11, 1);
INSERT INTO Atribui VALUES ('12345678901', 12, 2);
INSERT INTO Atribui VALUES ('23456789012', 11, 1);
INSERT INTO Atribui VALUES ('34567890123',  6, 3);
INSERT INTO Atribui VALUES ('34567890123', 11, 1);
INSERT INTO Atribui VALUES ('45678901234',  4, 4);
INSERT INTO Atribui VALUES ('56789012345', 11, 1);
INSERT INTO Atribui VALUES ('56789012345',  5, 13);
INSERT INTO Atribui VALUES ('67890123456',  8, 6);
INSERT INTO Atribui VALUES ('78901234567', 11, 15);
INSERT INTO Atribui VALUES ('78901234567', 12, 1);
INSERT INTO Atribui VALUES ('89012345678',  3, 5);
INSERT INTO Atribui VALUES ('90123456789',  7, 7);
INSERT INTO Atribui VALUES ('01234567890',  9, 4);
INSERT INTO Atribui VALUES ('11122233344', 11, 1);
INSERT INTO Atribui VALUES ('22233344455', 15, 1);
INSERT INTO Atribui VALUES ('33344455566',  2, 2);
INSERT INTO Atribui VALUES ('55566677788', 11, 3);
INSERT INTO Atribui VALUES ('10011223344', 17, 1);
INSERT INTO Atribui VALUES ('20122334455', 15, 6);
INSERT INTO Atribui VALUES ('40344556677',  9, 13);
INSERT INTO Atribui VALUES ('50455667788', 17, 1);
INSERT INTO Atribui VALUES ('80788990011', 13, 2);
INSERT INTO Atribui VALUES ('70677889900',  8, 6);


-- =============================================================
-- 19. ITEMPEDIDO (45 itens — múltiplos itens por pedido,
--     notas e promoções variadas para enriquecer todas as queries)
-- =============================================================
-- Pedido 1 — Ana Lima
INSERT INTO ItemPedido VALUES (1,  1,  1,  11,   1, 1899.99, 4.5, 'Produto excelente, chegou rápido');
INSERT INTO ItemPedido VALUES (1,  7,  1,  NULL, 1,  249.90, 4.0, 'Bom custo-benefício');
-- Pedido 2 — Bruno Souza
INSERT INTO ItemPedido VALUES (2,  5,  2,  NULL, 2,   89.90, 5.0, 'Ótimo livro, recomendo muito');
INSERT INTO ItemPedido VALUES (2,  17, 2,  NULL, 1,   79.90, 4.5, 'Leitura essencial para devs');
-- Pedido 3 — Carla Mendes
INSERT INTO ItemPedido VALUES (3,  3,  3,  6,    1,  599.90, 3.5, 'Confortável mas demorou para chegar');
-- Pedido 4 — Diego Ferreira (Enviado, sem avaliação)
INSERT INTO ItemPedido VALUES (4,  10, 4,  NULL, 1, 2199.00, NULL, NULL);
-- Pedido 5 — Eduarda Costa
INSERT INTO ItemPedido VALUES (5,  15, 5,  11,   1, 1799.00, 5.0, 'Melhor compra do ano, incrível');
INSERT INTO ItemPedido VALUES (5,  12, 5,  11,   1,  599.00, 4.5, 'Mouse preciso e confortável');
-- Pedido 6 — Felipe Ramos (Cancelado)
INSERT INTO ItemPedido VALUES (6,  4,  6,  NULL, 2,  299.00, NULL, NULL);
-- Pedido 7 — Gabriela Nunes
INSERT INTO ItemPedido VALUES (7,  2,  7,  NULL, 1, 3499.00, 4.5, 'Rápido e bem embalado');
INSERT INTO ItemPedido VALUES (7,  16, 7,  NULL, 1,  449.00, 4.0, 'Headset com ótimo áudio');
-- Pedido 8 — Henrique Alves (Pendente)
INSERT INTO ItemPedido VALUES (8,  13, 8,  NULL, 2,  179.90, NULL, NULL);
-- Pedido 9 — Isabela Rocha (Cancelado)
INSERT INTO ItemPedido VALUES (9,  6,  9,  NULL, 1,  999.00, NULL, NULL);
-- Pedido 10 — João Cavalcanti
INSERT INTO ItemPedido VALUES (10, 11, 10, NULL, 1,  379.00, 4.0, 'Teclado muito bom, feedback excelente');
INSERT INTO ItemPedido VALUES (10, 21, 10, NULL, 1,  449.90, 4.5, 'Controle perfeito para PS5');
-- Pedido 11 — Ana Lima
INSERT INTO ItemPedido VALUES (11, 12, 11, 11,   1,  599.00, 5.0, 'Vale cada centavo, supersensível');
-- Pedido 12 — Bruno Souza (Enviado)
INSERT INTO ItemPedido VALUES (12, 14, 12, 6,    1,  749.90, 4.0, 'Confortável para corrida diária');
INSERT INTO ItemPedido VALUES (12, 22, 12, NULL, 1,  389.90, 3.5, 'Design bonito mas solado fino');
-- Pedido 13 — Carla Mendes
INSERT INTO ItemPedido VALUES (13, 20, 13, NULL, 1, 1499.00, 4.5, 'Ótimo para estudar e assistir aulas');
-- Pedido 14 — Eduarda Costa (Pendente)
INSERT INTO ItemPedido VALUES (14, 9,  14, NULL, 1,  699.00, NULL, NULL);
-- Pedido 15 — Gabriela Nunes
INSERT INTO ItemPedido VALUES (15, 16, 15, 12,   1,  449.00, 5.0, 'Som perfeito, vale o investimento');
INSERT INTO ItemPedido VALUES (15, 30, 15, NULL, 1,  799.00, 4.0, 'Caixa de som potente e resistente');
-- Pedido 16 — Karen Oliveira
INSERT INTO ItemPedido VALUES (16, 19, 16, NULL, 1, 2299.00, 4.5, 'Câmera incrível para esportes');
-- Pedido 17 — Lucas Pereira (Enviado)
INSERT INTO ItemPedido VALUES (17, 8,  17, NULL, 1,  349.00, 3.5, 'Zíper um pouco fraco, mas espaçosa');
-- Pedido 18 — Mariana Santos
INSERT INTO ItemPedido VALUES (18, 18, 18, NULL, 2,  199.00, 4.0, 'Panela de ótima qualidade e durável');
-- Pedido 19 — Olívia Cardoso (Agosto)
INSERT INTO ItemPedido VALUES (19, 26, 19, 8,    1, 1350.00, 5.0, 'Raquete profissional, excelente acabamento');
INSERT INTO ItemPedido VALUES (19, 13, 19, NULL, 3,  179.90, 4.0, 'Whey de boa qualidade e sabor neutro');
-- Pedido 20 — Pedro Monteiro (Cancelado)
INSERT INTO ItemPedido VALUES (20, 4,  20, NULL, 1,  299.00, NULL, NULL);
-- Pedido 21 — Ursula Farias (Agosto)
INSERT INTO ItemPedido VALUES (21, 27, 21, NULL, 1, 3799.00, 5.0, 'Câmera Sony incrível, imagem nítida');
-- Pedido 22 — Ana Lima (Agosto)
INSERT INTO ItemPedido VALUES (22, 1,  22, NULL, 1, 1899.99, 4.0, 'Segunda compra do mesmo modelo, confiável');
INSERT INTO ItemPedido VALUES (22, 20, 22, NULL, 1, 1499.00, 4.5, 'Tablet excelente para home office');
-- Pedido 23 — Xavier Andrade (Setembro)
INSERT INTO ItemPedido VALUES (23, 14, 23, 9,    2,  749.90, 4.5, 'Comprei dois pares, valeu a pena');
-- Pedido 24 — Yasmin Leal (Outubro)
INSERT INTO ItemPedido VALUES (24, 15, 24, 10,   1, 1799.00, 5.0, 'Apple Watch superou expectativas');
INSERT INTO ItemPedido VALUES (24, 25, 24, NULL, 2,   42.90, 3.0, 'Creme ok mas embalagem simples');
-- Pedido 25 — Lucas Pereira (Outubro, Enviado)
INSERT INTO ItemPedido VALUES (25, 10, 25, NULL, 1, 2199.00, NULL, NULL);
-- Pedido 26 — Eduarda Costa (Black Friday)
INSERT INTO ItemPedido VALUES (26, 1,  26, 11,   1, 1899.99, 5.0, 'Melhor Black Friday que já fiz');
INSERT INTO ItemPedido VALUES (26, 2,  26, 11,   1, 3499.00, 5.0, 'Notebook top, desconto excelente');
-- Pedido 27 — Gabriela Nunes (Black Friday)
INSERT INTO ItemPedido VALUES (27, 6,  27, 11,   1,  999.00, 4.0, 'Cadeira veio montada, fácil de usar');
INSERT INTO ItemPedido VALUES (27, 21, 27, 11,   2,  449.90, 4.5, 'Presentes perfeitos para meus filhos');
-- Pedido 28 — João Cavalcanti (Natal)
INSERT INTO ItemPedido VALUES (28, 19, 28, 12,   1, 2299.00, 5.0, 'GoPro de Natal, filmou a ceia toda');
-- Pedido 29 — Bernardo Queiroz (2025, Enviado)
INSERT INTO ItemPedido VALUES (29, 29, 29, 13,   1, 1250.00, NULL, NULL);
-- Pedido 30 — Ana Lima (Fev 2025, Dia dos Namorados)
INSERT INTO ItemPedido VALUES (30, 30, 30, 14,   1,  799.00, 4.5, 'Presente perfeito, som ótimo');
INSERT INTO ItemPedido VALUES (30, 25, 30, NULL, 3,   42.90, 4.0, 'Creme hidratante muito bom');
-- Pedido 31 — Vitor Magalhães (Mar 2025)
INSERT INTO ItemPedido VALUES (31, 27, 28, 15,   1, 3799.00, 5.0, 'Câmera Sony espetacular');
-- Pedido 32 — Carla Mendes (Cancelado)
INSERT INTO ItemPedido VALUES (32, 26, NULL, NULL, 1, 1350.00, NULL, NULL);
-- Pedido 33 — Yasmin Leal (Abr 2025)
INSERT INTO ItemPedido VALUES (33, 3,  29, 16,   2,  599.90, 4.0, 'Nike confortável para o dia a dia');
INSERT INTO ItemPedido VALUES (33, 28, 29, NULL, 1,  149.90, 3.5, 'Bermuda ok, tecido um pouco grosso');
-- Pedido 34 — Zé Augusto Lima (Mai 2025, Enviado)
INSERT INTO ItemPedido VALUES (34, 15, 30, 17,   1, 1799.00, NULL, NULL);
-- Pedido 35 — Olívia Cardoso (Dia das Mães, Pendente)
INSERT INTO ItemPedido VALUES (35, 25, NULL, 17,  4,   42.90, NULL, NULL);
INSERT INTO ItemPedido VALUES (35, 7,  NULL, NULL, 2,  249.90, NULL, NULL);


-- =============================================================
-- FIM DO POVOAMENTO — Grupo 5
-- =============================================================