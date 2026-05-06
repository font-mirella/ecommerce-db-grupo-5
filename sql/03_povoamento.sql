-- =============================================================
-- POVOAMENTO DO BANCO DE DADOS
-- Formato: colunas explícitas + NEXTVAL nas sequences
-- =============================================================


-- -------------------------------------------------------------
-- 1. USUARIO
-- -------------------------------------------------------------
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('12345678901', 'Ana Lima',        '50710000', '12',  'Apto 301', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('23456789012', 'Bruno Souza',     '50720000', '45',  'Casa',     'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('34567890123', 'Carla Mendes',    '50730000', '8',   'Bloco B',  'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('45678901234', 'Diego Ferreira',  '50740000', '200', 'Sala 5',   'Comercial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('56789012345', 'Eduarda Costa',   '50750000', '33',  'Apto 102', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('67890123456', 'Felipe Ramos',    '50760000', '77',  NULL,       'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('78901234567', 'Gabriela Nunes',  '50770000', '91',  'Apto 204', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('89012345678', 'Henrique Alves',  '50780000', '5',   'Fundos',   'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('90123456789', 'Isabela Rocha',   '50790000', '18',  'Apto 401', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('01234567890', 'João Cavalcanti', '50800000', '62',  NULL,       'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('11122233344', 'Karen Oliveira',  '50810000', '14',  'Apto 501', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('22233344455', 'Lucas Pereira',   '50820000', '3',   NULL,       'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('33344455566', 'Mariana Santos',  '50830000', '27',  'Bloco A',  'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('44455566677', 'Nicolas Barbosa', '50840000', '55',  'Sala 2',   'Comercial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('55566677788', 'Olívia Cardoso',  '50850000', '88',  'Apto 303', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('66677788899', 'Pedro Monteiro',  '50860000', '101', NULL,       'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('77788899900', 'Quésia Teixeira', '50870000', '7',   'Apto 201', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('88899900011', 'Rafael Gomes',    '50880000', '39',  NULL,       'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('99900011122', 'Sabrina Pinto',   '50890000', '66',  'Apto 102', 'Residencial');
INSERT INTO Usuario (cpf, nome, cep, n_residencia, complemento, tipo_endereco)
    VALUES ('00011122233', 'Thiago Azevedo',  '50900000', '22',  'Fundos',   'Residencial');


-- -------------------------------------------------------------
-- 2. TELEFONE_USUARIO
-- -------------------------------------------------------------
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('12345678901', '81991110001');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('23456789012', '81992220002');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('34567890123', '81993330003');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('45678901234', '81994440004');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('56789012345', '81995550005');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('67890123456', '81996660006');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('78901234567', '81997770007');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('89012345678', '81998880008');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('90123456789', '81999990009');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('01234567890', '81911110010');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('11122233344', '81912220011');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('22233344455', '81913330012');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('33344455566', '81914440013');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('44455566677', '81915550014');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('55566677788', '81916660015');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('66677788899', '81917770016');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('77788899900', '81918880017');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('88899900011', '81919990018');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('12345678901', '81988880001');
INSERT INTO Telefone_Usuario (cpf_usuario, numero)
    VALUES ('99900011122', '81920000019');


-- -------------------------------------------------------------
-- 3. CLIENTE
-- -------------------------------------------------------------
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('12345678901', 'Premium');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('23456789012', 'Básico');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('34567890123', 'Premium');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('45678901234', 'Básico');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('56789012345', 'Gold');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('67890123456', 'Básico');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('78901234567', 'Gold');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('89012345678', 'Premium');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('90123456789', 'Básico');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('01234567890', 'Gold');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('11122233344', 'Básico');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('22233344455', 'Premium');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('33344455566', 'Básico');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('55566677788', 'Gold');
INSERT INTO Cliente (cpf_cliente, tipo_assinatura)
    VALUES ('66677788899', 'Básico');


-- -------------------------------------------------------------
-- 4. FUNCIONARIO — matricula usa seq_matricula_func.NEXTVAL
-- -------------------------------------------------------------
INSERT INTO Funcionario (cpf_funcionario, matricula, cpf_supervisor)
    VALUES ('44455566677', seq_matricula_func.NEXTVAL, NULL);
INSERT INTO Funcionario (cpf_funcionario, matricula, cpf_supervisor)
    VALUES ('77788899900', seq_matricula_func.NEXTVAL, '44455566677');
INSERT INTO Funcionario (cpf_funcionario, matricula, cpf_supervisor)
    VALUES ('88899900011', seq_matricula_func.NEXTVAL, '44455566677');
INSERT INTO Funcionario (cpf_funcionario, matricula, cpf_supervisor)
    VALUES ('99900011122', seq_matricula_func.NEXTVAL, '77788899900');
INSERT INTO Funcionario (cpf_funcionario, matricula, cpf_supervisor)
    VALUES ('00011122233', seq_matricula_func.NEXTVAL, '77788899900');


-- -------------------------------------------------------------
-- 5. CARGO — cod_cargo usa seq_cargo.NEXTVAL
-- -------------------------------------------------------------
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Comercial',   'Vendedor');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Comercial',   'Supervisor de Vendas');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Logística',   'Separador');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Logística',   'Coordenador de Logística');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Atendimento', 'Atendente');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Atendimento', 'Gerente de Atendimento');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'TI',          'Analista de Sistemas');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'TI',          'Desenvolvedor');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Financeiro',  'Analista Financeiro');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Financeiro',  'Gerente Financeiro');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'RH',          'Analista de RH');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'RH',          'Gerente de RH');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Compras',     'Comprador');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Compras',     'Gerente de Compras');
INSERT INTO Cargo (cod_cargo, setor, nome)
    VALUES (seq_cargo.NEXTVAL, 'Marketing',   'Analista de Marketing');

-- ATENÇÃO: como seq_cargo gera 1..15 em ordem, os INSERTs de
-- HistoricoCargos abaixo referenciam os valores 1..15 diretamente.


-- -------------------------------------------------------------
-- 6. HISTORICOCARGOS — sem sequence, referencia chaves já inseridas
-- -------------------------------------------------------------
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('44455566677', 6,  DATE '2018-03-01', NULL);
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('77788899900', 2,  DATE '2019-06-01', NULL);
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('88899900011', 5,  DATE '2020-01-15', DATE '2022-04-30');
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('88899900011', 6,  DATE '2022-05-01', NULL);
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('99900011122', 1,  DATE '2021-02-10', DATE '2023-01-31');
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('99900011122', 2,  DATE '2023-02-01', NULL);
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('00011122233', 7,  DATE '2022-07-01', NULL);
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('77788899900', 1,  DATE '2017-01-01', DATE '2019-05-31');
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('44455566677', 5,  DATE '2015-06-01', DATE '2018-02-28');
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('00011122233', 8,  DATE '2020-03-01', DATE '2022-06-30');
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('99900011122', 13, DATE '2019-08-01', DATE '2021-02-09');
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('88899900011', 11, DATE '2018-05-01', DATE '2019-12-31');
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('44455566677', 2,  DATE '2012-01-01', DATE '2015-05-31');
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('77788899900', 13, DATE '2014-09-01', DATE '2016-12-31');
INSERT INTO HistoricoCargos (cpf_funcionario, cargo, data_admissao, data_saida)
    VALUES ('00011122233', 15, DATE '2019-01-01', DATE '2020-02-28');


-- -------------------------------------------------------------
-- 7. CATEGORIA — cod_categoria usa seq_categoria.NEXTVAL
-- -------------------------------------------------------------
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Eletrônicos',  'Smartphones, notebooks e acessórios');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Roupas',        'Vestuário masculino e feminino');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Calçados',      'Tênis, sandálias e sapatos');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Livros',        'Literatura, técnicos e didáticos');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Casa e Jardim', 'Móveis, utensílios e decoração');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Esportes',      'Equipamentos e roupas esportivas');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Beleza',        'Cosméticos e cuidados pessoais');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Brinquedos',    'Jogos e brinquedos infantis');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Alimentos',     'Produtos alimentícios e bebidas');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Pet',           'Produtos para animais de estimação');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Ferramentas',   'Ferramentas manuais e elétricas');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Automotivo',    'Acessórios e peças para veículos');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Saúde',         'Suplementos e equipamentos de saúde');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Papelaria',     'Material escolar e de escritório');
INSERT INTO Categoria (cod_categoria, nome, descricao)
    VALUES (seq_categoria.NEXTVAL, 'Games',         'Jogos, consoles e periféricos');


-- -------------------------------------------------------------
-- 8. PROMOCAO — cod_promocao usa seq_promocao.NEXTVAL
-- -------------------------------------------------------------
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 10.00, DATE '2024-01-01', DATE '2024-01-31');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 15.00, DATE '2024-02-01', DATE '2024-02-29');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 20.00, DATE '2024-03-01', DATE '2024-03-15');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL,  5.00, DATE '2024-04-01', DATE '2024-04-30');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 25.00, DATE '2024-05-01', DATE '2024-05-10');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 30.00, DATE '2024-06-01', DATE '2024-06-30');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 12.00, DATE '2024-07-01', DATE '2024-07-15');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL,  8.00, DATE '2024-08-01', DATE '2024-08-31');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 18.00, DATE '2024-09-01', DATE '2024-09-30');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 22.00, DATE '2024-10-01', DATE '2024-10-31');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 50.00, DATE '2024-11-29', DATE '2024-11-30');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 35.00, DATE '2024-12-20', DATE '2024-12-25');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL,  7.00, DATE '2025-01-01', DATE '2025-01-15');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 14.00, DATE '2025-02-01', DATE '2025-02-28');
INSERT INTO Promocao (cod_promocao, percentual, data_inicio, data_fim)
    VALUES (seq_promocao.NEXTVAL, 40.00, DATE '2025-03-01', DATE '2025-03-31');


-- -------------------------------------------------------------
-- 9. TRANSPORTADORA
-- -------------------------------------------------------------
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('12345678000195', 'Correios',       'PAC e SEDEX');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('23456789000106', 'Jadlog',         'Expresso e econômico');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('34567890000117', 'Total Express',  'Entrega expressa');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('45678901000128', 'Braspress',      'Carga fracionada');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('56789012000139', 'Loggi',          'Entrega no dia');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('67890123000140', 'Mercado Envios', 'Integrado marketplace');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('78901234000151', 'Azul Cargo',     'Aéreo e terrestre');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('89012345000162', 'TNT Brasil',     'Expresso nacional');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('90123456000173', 'DHL Express',    'Internacional e nacional');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('01234567000184', 'FedEx',          'Expresso internacional');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('11122233000195', 'Rodonaves',      'Carga rodoviária');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('22233344000106', 'Rapidão Cometa', 'Encomendas expressas');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('33344455000117', 'Direct',         'Last mile');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('44455566000128', 'Sequoia',        'Varejo e e-commerce');
INSERT INTO Transportadora (cnpj, nome, servico)
    VALUES ('55566677000139', 'Pegaki',         'Pontos de retirada');


-- -------------------------------------------------------------
-- 10. TELEFONE_TRANSPORTADORA
-- -------------------------------------------------------------
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('12345678000195', '08007250100');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('23456789000106', '08000237600');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('34567890000117', '01131970000');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('45678901000128', '04003434300');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('56789012000139', '01140030832');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('67890123000140', '08004444444');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('78901234000151', '08007277778');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('89012345000162', '08007770606');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('90123456000173', '01131218700');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('01234567000184', '08007333339');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('11122233000195', '08004040040');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('22233344000106', '08005001515');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('33344455000117', '01130030303');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('44455566000128', '01140041004');
INSERT INTO Telefone_Transportadora (cnpj_transportadora, numero)
    VALUES ('55566677000139', '01135005000');


-- -------------------------------------------------------------
-- 11. ENTREGA — cod_rastreio usa seq_entrega.NEXTVAL
-- -------------------------------------------------------------
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2024-06-01', DATE '2024-06-05', TIMESTAMP '2024-06-05 14:30:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '23456789000106', DATE '2024-06-02', DATE '2024-06-04', TIMESTAMP '2024-06-04 09:15:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '34567890000117', DATE '2024-06-03', DATE '2024-06-06', TIMESTAMP '2024-06-06 17:00:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '45678901000128', DATE '2024-06-04', DATE '2024-06-10', NULL);
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '56789012000139', DATE '2024-06-05', DATE '2024-06-06', TIMESTAMP '2024-06-06 11:45:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2024-06-06', DATE '2024-06-12', TIMESTAMP '2024-06-12 15:20:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '67890123000140', DATE '2024-06-07', DATE '2024-06-09', TIMESTAMP '2024-06-09 10:00:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '78901234000151', DATE '2024-06-08', DATE '2024-06-11', NULL);
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '89012345000162', DATE '2024-06-09', DATE '2024-06-13', TIMESTAMP '2024-06-13 16:30:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '23456789000106', DATE '2024-06-10', DATE '2024-06-14', TIMESTAMP '2024-06-14 08:00:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '90123456000173', DATE '2024-06-11', DATE '2024-06-15', TIMESTAMP '2024-06-15 13:10:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '34567890000117', DATE '2024-06-12', DATE '2024-06-16', NULL);
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '56789012000139', DATE '2024-06-13', DATE '2024-06-14', TIMESTAMP '2024-06-14 18:50:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '12345678000195', DATE '2024-06-14', DATE '2024-06-20', TIMESTAMP '2024-06-20 12:00:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '44455566000128', DATE '2024-06-15', DATE '2024-06-18', TIMESTAMP '2024-06-18 09:30:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '67890123000140', DATE '2024-06-16', DATE '2024-06-18', NULL);
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '23456789000106', DATE '2024-06-17', DATE '2024-06-21', TIMESTAMP '2024-06-21 14:00:00');
INSERT INTO Entrega (cod_rastreio, cnpj_transportadora, data_postagem, data_estimada, data_hora_entrega)
    VALUES (seq_entrega.NEXTVAL, '78901234000151', DATE '2024-06-18', DATE '2024-06-22', TIMESTAMP '2024-06-22 10:45:00');

-- ATENÇÃO: seq_entrega gera 1..18 em ordem. ItemPedido referencia
-- cod_rastreio_entrega com esses mesmos valores (1..18).


-- -------------------------------------------------------------
-- 12. PRODUTO — cod_produto usa seq_produto.NEXTVAL
-- -------------------------------------------------------------
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Smartphone Samsung Galaxy A55', 1899.99, 50);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Notebook Dell Inspiron 15',     3499.00, 20);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Tênis Nike Air Max',             599.90, 80);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Camiseta Polo Ralph Lauren',     299.00, 100);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Livro Clean Code',               89.90, 60);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Cadeira Gamer ThunderX3',        999.00, 15);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Fone JBL Tune 510BT',           249.90, 40);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Mochila Samsonite 30L',          349.00, 30);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Cafeteira Nespresso Essenza',    699.00, 25);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Monitor LG 27" 4K',            2199.00, 18);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Teclado Mecânico Redragon',      379.00, 35);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Mouse Logitech MX Master 3',     599.00, 45);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Whey Protein Growth 900g',       179.90, 70);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Tênis Adidas Ultraboost',        749.90, 55);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Smartwatch Apple Watch SE',     1799.00, 22);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Headset HyperX Cloud II',        449.00, 28);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Livro Design Patterns',           79.90, 50);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Panela de Pressão Tramontina 4L',199.00, 40);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Câmera GoPro Hero 12',          2299.00, 12);
INSERT INTO Produto (cod_produto, nome, preco, quantidade_estoque)
    VALUES (seq_produto.NEXTVAL, 'Tablet Samsung Tab A9',         1499.00, 30);


-- -------------------------------------------------------------
-- 13. HISTORICO_PRECOS
-- -------------------------------------------------------------
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (1,  DATE '2023-01-01', 2199.99);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (1,  DATE '2024-01-01', 1899.99);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (2,  DATE '2023-01-01', 3999.00);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (2,  DATE '2024-01-01', 3499.00);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (3,  DATE '2023-06-01',  649.90);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (3,  DATE '2024-01-01',  599.90);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (5,  DATE '2023-01-01',   99.90);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (5,  DATE '2024-01-01',   89.90);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (6,  DATE '2023-01-01', 1199.00);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (6,  DATE '2024-01-01',  999.00);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (7,  DATE '2023-01-01',  299.90);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (7,  DATE '2024-01-01',  249.90);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (10, DATE '2023-01-01', 2499.00);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (10, DATE '2024-01-01', 2199.00);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (15, DATE '2023-01-01', 2199.00);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (15, DATE '2024-01-01', 1799.00);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (19, DATE '2023-01-01', 2699.00);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (19, DATE '2024-01-01', 2299.00);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (13, DATE '2023-06-01',  199.90);
INSERT INTO HistoricoPrecos (cod_produto_preco, data_vigencia, valor)
    VALUES (13, DATE '2024-01-01',  179.90);


-- -------------------------------------------------------------
-- 14. PERTENCE
-- -------------------------------------------------------------
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1,  1);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1,  2);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1,  7);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1,  10);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1,  11);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1,  12);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1,  15);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1,  16);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1,  19);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (1,  20);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (3,  3);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (3,  14);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (2,  4);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (4,  5);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (4,  17);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (5,  6);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (5,  9);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (5,  18);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (13, 13);
INSERT INTO Pertence (cod_categoria, cod_produto) VALUES (15, 11);


-- -------------------------------------------------------------
-- 15. PEDIDO — cod_pedido usa seq_pedido.NEXTVAL
-- -------------------------------------------------------------
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '12345678901', TIMESTAMP '2024-06-01 10:00:00', 'Entregue');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '23456789012', TIMESTAMP '2024-06-02 11:30:00', 'Entregue');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '34567890123', TIMESTAMP '2024-06-03 09:15:00', 'Entregue');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '45678901234', TIMESTAMP '2024-06-04 14:45:00', 'Enviado');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '56789012345', TIMESTAMP '2024-06-05 08:00:00', 'Entregue');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '67890123456', TIMESTAMP '2024-06-06 16:20:00', 'Enviado');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '78901234567', TIMESTAMP '2024-06-07 13:10:00', 'Entregue');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '89012345678', TIMESTAMP '2024-06-08 10:30:00', 'Pendente');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '90123456789', TIMESTAMP '2024-06-09 15:00:00', 'Cancelado');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '01234567890', TIMESTAMP '2024-06-10 09:45:00', 'Entregue');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '12345678901', TIMESTAMP '2024-06-11 11:00:00', 'Entregue');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '23456789012', TIMESTAMP '2024-06-12 14:15:00', 'Enviado');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '34567890123', TIMESTAMP '2024-06-13 08:30:00', 'Entregue');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '56789012345', TIMESTAMP '2024-06-14 17:00:00', 'Pendente');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '78901234567', TIMESTAMP '2024-06-15 12:00:00', 'Entregue');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '11122233344', TIMESTAMP '2024-06-16 10:10:00', 'Entregue');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '22233344455', TIMESTAMP '2024-06-17 13:45:00', 'Enviado');
INSERT INTO Pedido (cod_pedido, cpf_cliente, data_hora, status)
    VALUES (seq_pedido.NEXTVAL, '33344455566', TIMESTAMP '2024-06-18 09:00:00', 'Entregue');


-- -------------------------------------------------------------
-- 16. PAGAMENTO — cod_transacao usa seq_pagamento.NEXTVAL
-- coluna 'pedido' referencia Pedido(cod_pedido) gerado acima (1..18)
-- -------------------------------------------------------------
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-01', 'Cartão Crédito', 'Aprovado',  1);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-02', 'PIX',            'Aprovado',  2);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-03', 'Boleto',         'Aprovado',  3);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-04', 'Cartão Débito',  'Aprovado',  4);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-05', 'PIX',            'Aprovado',  5);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-06', 'Cartão Crédito', 'Aprovado',  6);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-07', 'PIX',            'Aprovado',  7);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-08', 'Boleto',         'Pendente',  8);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-09', 'Cartão Crédito', 'Estornado', 9);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-10', 'PIX',            'Aprovado',  10);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-11', 'Cartão Crédito', 'Aprovado',  11);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-12', 'PIX',            'Aprovado',  12);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-13', 'Cartão Débito',  'Aprovado',  13);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-14', 'Boleto',         'Pendente',  14);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-15', 'PIX',            'Aprovado',  15);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-16', 'Cartão Crédito', 'Aprovado',  16);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-17', 'PIX',            'Aprovado',  17);
INSERT INTO Pagamento (cod_transacao, data_pagamento, meio_pagamento, status, pedido)
    VALUES (seq_pagamento.NEXTVAL, DATE '2024-06-18', 'Cartão Crédito', 'Aprovado',  18);


-- -------------------------------------------------------------
-- 17. RECLAMACAO — cod_reclamacao usa seq_reclamacao.NEXTVAL
-- -------------------------------------------------------------
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 9,  '88899900011', 'Resolvida',  'Cancelamento', 'Cliente solicitou cancelamento do pedido',        DATE '2024-06-11');
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 3,  '99900011122', 'Resolvida',  'Atraso',       'Produto chegou fora do prazo estimado',           DATE '2024-06-15');
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 8,  '88899900011', 'Pendente',   'Pagamento',    'Boleto venceu, cliente não conseguiu reemitir',   NULL);
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 5,  '00011122233', 'Resolvida',  'Produto',      'Item chegou com embalagem danificada',            DATE '2024-06-10');
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 12, '99900011122', 'Em Análise', 'Entrega',      'Consta entregue mas cliente não recebeu',         NULL);
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 1,  '88899900011', 'Resolvida',  'Produto',      'Produto diferente do anunciado',                  DATE '2024-06-08');
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 14, '00011122233', 'Pendente',   'Pagamento',    'Cobrança duplicada no cartão de crédito',         NULL);
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 7,  '99900011122', 'Resolvida',  'Qualidade',    'Produto parou de funcionar após 2 dias',          DATE '2024-06-20');
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 16, '88899900011', 'Em Análise', 'Entrega',      'Entrega feita no endereço errado',                NULL);
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 2,  '00011122233', 'Resolvida',  'Troca',        'Cliente quer trocar por tamanho diferente',       DATE '2024-06-14');
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 11, '99900011122', 'Pendente',   'Produto',      'Falta de acessório na caixa do produto',          NULL);
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 6,  '88899900011', 'Resolvida',  'Cancelamento', 'Desistência dentro do prazo de arrependimento',   DATE '2024-06-09');
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 18, '00011122233', 'Em Análise', 'Qualidade',    'Produto chegou com defeito de fabricação',        NULL);
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 4,  '99900011122', 'Resolvida',  'Atraso',       'Atraso superior a 5 dias úteis',                  DATE '2024-06-22');
INSERT INTO Reclamacao (cod_reclamacao, cod_pedido, cpf_funcionario, status, classificacao, descricao, data_resolucao)
    VALUES (seq_reclamacao.NEXTVAL, 10, '88899900011', 'Pendente',   'Troca',        'Cliente recebeu cor errada do produto',           NULL);


-- -------------------------------------------------------------
-- 18. ATRIBUI
-- -------------------------------------------------------------
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('12345678901', 11, 1);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('12345678901', 12, 2);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('23456789012', 11, 1);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('34567890123',  6, 3);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('34567890123', 11, 1);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('45678901234',  4, 4);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('56789012345', 11, 1);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('56789012345',  5, 13);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('67890123456',  8, 6);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('78901234567', 11, 15);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('78901234567', 12, 1);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('89012345678',  3, 5);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('90123456789',  7, 7);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('01234567890',  9, 4);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('11122233344', 11, 1);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('22233344455', 15, 1);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('33344455566',  2, 2);
INSERT INTO Atribui (cpf_cliente, cod_promocao, cod_categoria) VALUES ('55566677788', 11, 3);


-- -------------------------------------------------------------
-- 19. ITEMPEDIDO
-- cod_pedido e cod_produto referenciam valores gerados pelas
-- sequences seq_pedido (1..18) e seq_produto (1..20)
-- -------------------------------------------------------------
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (1,  1,  1,  11,   1, 1899.99, 4.5, 'Produto excelente, chegou rápido');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (1,  7,  1,  NULL, 1,  249.90, 4.0, 'Bom custo-benefício');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (2,  5,  2,  NULL, 2,   89.90, 5.0, 'Ótimo livro, recomendo');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (3,  3,  3,  6,    1,  599.90, 3.5, 'Confortável mas demorou');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (4,  10, 4,  NULL, 1, 2199.00, NULL, NULL);
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (5,  15, 5,  11,   1, 1799.00, 5.0, 'Melhor compra do ano');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (6,  4,  6,  NULL, 2,  299.00, 4.0, 'Boa qualidade');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (7,  2,  7,  NULL, 1, 3499.00, 4.5, 'Rápido e bem embalado');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (8,  13, 8,  NULL, 2,  179.90, NULL, NULL);
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (9,  6,  9,  NULL, 1,  999.00, NULL, NULL);
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (10, 11, 10, NULL, 1,  379.00, 4.0, 'Teclado muito bom');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (11, 12, 11, 11,   1,  599.00, 5.0, 'Vale cada centavo');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (12, 14, 12, 6,    1,  749.90, 4.0, 'Confortável para corrida');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (13, 20, 13, NULL, 1, 1499.00, 4.5, 'Ótimo para estudar');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (14, 9,  14, NULL, 1,  699.00, NULL, NULL);
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (15, 16, 15, 12,   1,  449.00, 5.0, 'Som perfeito');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (16, 19, 16, NULL, 1, 2299.00, 4.5, 'Câmera incrível');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (17, 8,  17, NULL, 1,  349.00, 3.5, 'Zíper um pouco fraco');
INSERT INTO ItemPedido (cod_pedido, cod_produto, cod_rastreio_entrega, cod_promocao, quantidade, valor_unitario, nota_avaliacao, comentario)
    VALUES (18, 18, 18, NULL, 2,  199.00, 4.0, 'Panela de ótima qualidade');