-- =============================================================
-- SCRIPT DE CRIAÇÃO DO BANCO DE DADOS (AV3)
-- Grupo 5: E-Commerce
-- =============================================================

-- -------------------------------------------------------------
-- REMOÇÃO DE TABELAS E SEQUENCES (PARA REEXECUÇÃO)
-- -------------------------------------------------------------
DROP TABLE Pertence CASCADE CONSTRAINTS;
DROP TABLE ItemPedido CASCADE CONSTRAINTS;
DROP TABLE Atribui CASCADE CONSTRAINTS;
DROP TABLE Reclamacao CASCADE CONSTRAINTS;
DROP TABLE PedidoPagamento CASCADE CONSTRAINTS;
DROP TABLE HistoricoPrecos CASCADE CONSTRAINTS;
DROP TABLE HistoricoCargos CASCADE CONSTRAINTS;
DROP TABLE Produto CASCADE CONSTRAINTS;
DROP TABLE Telefone_Transportadora CASCADE CONSTRAINTS;
DROP TABLE Entrega CASCADE CONSTRAINTS;
DROP TABLE Transportadora CASCADE CONSTRAINTS;
DROP TABLE Promocao CASCADE CONSTRAINTS;
DROP TABLE Categoria CASCADE CONSTRAINTS;
DROP TABLE Cargo CASCADE CONSTRAINTS;
DROP TABLE Funcionario CASCADE CONSTRAINTS;
DROP TABLE Cliente CASCADE CONSTRAINTS;
DROP TABLE Telefone_Usuario CASCADE CONSTRAINTS;
DROP TABLE Usuario CASCADE CONSTRAINTS;

DROP SEQUENCE seq_matricula_func;
DROP SEQUENCE seq_categoria;
DROP SEQUENCE seq_promocao;
DROP SEQUENCE seq_entrega;
DROP SEQUENCE seq_produto;
DROP SEQUENCE seq_pedido;
DROP SEQUENCE seq_pagamento;
DROP SEQUENCE seq_reclamacao;
DROP SEQUENCE seq_cargo;

-- -------------------------------------------------------------
-- 1. ENTIDADES BASE (SEM DEPENDÊNCIAS FORTES)
-- -------------------------------------------------------------

CREATE TABLE Usuario (
    cpf CHAR(11),
    nome VARCHAR2(50) NOT NULL, 
    cep CHAR(8) NOT NULL,
    n_residencia VARCHAR2(10) NOT NULL,
    complemento VARCHAR2(50),
    tipo_endereco VARCHAR2(20) NOT NULL,
    CONSTRAINT usuario_pkey PRIMARY KEY (cpf)
);

CREATE TABLE Telefone_Usuario (
    cpf_usuario CHAR(11),
    numero CHAR(11),
    CONSTRAINT telef_usuario_pkey PRIMARY KEY (cpf_usuario, numero),
    CONSTRAINT telef_usuario_fkey FOREIGN KEY (cpf_usuario) 
        REFERENCES Usuario (cpf) ON DELETE CASCADE
);

CREATE TABLE Cliente (
    cpf_cliente CHAR(11),
    tipo_assinatura VARCHAR2(15),
    CONSTRAINT cliente_pkey PRIMARY KEY (cpf_cliente),
    CONSTRAINT cliente_fkey FOREIGN KEY (cpf_cliente) 
        REFERENCES Usuario (cpf) ON DELETE CASCADE
);

CREATE TABLE Funcionario (
    cpf_funcionario CHAR(11),
    matricula INTEGER UNIQUE,
    cpf_supervisor CHAR(11),    
    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf_funcionario),
    CONSTRAINT funcionario_fkey FOREIGN KEY (cpf_funcionario) 
        REFERENCES Usuario (cpf) ON DELETE CASCADE,
    CONSTRAINT funcionarioSup_fkey FOREIGN KEY (cpf_supervisor) 
        REFERENCES Funcionario (cpf_funcionario)
);

CREATE SEQUENCE seq_matricula_func INCREMENT BY 1 START WITH 1;

CREATE TABLE Cargo (
    cod_cargo INTEGER,
    setor VARCHAR2(30),
    nome VARCHAR2(50) NOT NULL,
    CONSTRAINT cargo_pkey PRIMARY KEY (cod_cargo)
);

CREATE SEQUENCE seq_cargo INCREMENT BY 1 START WITH 1;

CREATE TABLE HistoricoCargos (
    cpf_funcionario CHAR(11),
    cargo INTEGER,
    data_admissao DATE, 
    data_saida DATE,
    CONSTRAINT assume_pkey PRIMARY KEY (cpf_funcionario, cargo, data_admissao),
    CONSTRAINT assume_funcionario FOREIGN KEY (cpf_funcionario) 
        REFERENCES Funcionario (cpf_funcionario),
    CONSTRAINT assume_cargo_fkey FOREIGN KEY (cargo) 
        REFERENCES Cargo (cod_cargo)
);

CREATE TABLE Categoria (
    cod_categoria INTEGER,
    nome VARCHAR2(50),
    descricao VARCHAR2(100),
    CONSTRAINT categoria_pkey PRIMARY KEY (cod_categoria)
);

CREATE SEQUENCE seq_categoria INCREMENT BY 1 START WITH 1;

CREATE TABLE Promocao (
    cod_promocao INTEGER,
    percentual NUMBER(5, 2) CHECK(percentual BETWEEN 0 AND 100), 
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    CONSTRAINT check_datas_validas CHECK (data_fim >= data_inicio),
    CONSTRAINT promocao_pkey PRIMARY KEY (cod_promocao)
);

CREATE SEQUENCE seq_promocao INCREMENT BY 1 START WITH 1;

CREATE TABLE Transportadora (
    cnpj CHAR(14),
    nome VARCHAR2(50) NOT NULL,
    servico VARCHAR2(50),
    CONSTRAINT transportadora_pkey PRIMARY KEY (cnpj)
);

CREATE TABLE Telefone_Transportadora (
    cnpj_transportadora CHAR(14), 
    numero CHAR(11),
    CONSTRAINT telef_trans_pkey PRIMARY KEY (cnpj_transportadora, numero),
    CONSTRAINT telef_trans_fkey FOREIGN KEY (cnpj_transportadora) 
        REFERENCES Transportadora (cnpj) ON DELETE CASCADE
);

CREATE TABLE Entrega (
    cod_rastreio INTEGER,
    cnpj_transportadora CHAR(14) NOT NULL,
    data_postagem DATE, 
    data_estimada DATE,
    data_hora_entrega TIMESTAMP,
    CONSTRAINT entrega_pkey PRIMARY KEY (cod_rastreio),
    CONSTRAINT entrega_fkey FOREIGN KEY (cnpj_transportadora) 
        REFERENCES Transportadora(cnpj)
);

CREATE SEQUENCE seq_entrega INCREMENT BY 1 START WITH 1;

-- -------------------------------------------------------------
-- 2. PRODUTOS E LOGÍSTICA
-- -------------------------------------------------------------

CREATE TABLE Produto (
    cod_produto INTEGER,
    nome VARCHAR2(50) NOT NULL,
    preco NUMBER(9, 2) CHECK(preco > 0) NOT NULL, 
    quantidade_estoque INTEGER CHECK(quantidade_estoque >= 0) NOT NULL,
    CONSTRAINT produto_pkey PRIMARY KEY (cod_produto)
);

CREATE SEQUENCE seq_produto INCREMENT BY 1 START WITH 1;

CREATE TABLE HistoricoPrecos (
    cod_produto_preco INTEGER,
    data_vigencia DATE,
    valor NUMBER(9,2) NOT NULL,
    CONSTRAINT historicopPrecos_pkey PRIMARY KEY (cod_produto_preco, data_vigencia),
    CONSTRAINT historicopPrecos_fkey FOREIGN KEY (cod_produto_preco) 
        REFERENCES Produto (cod_produto)
);

CREATE TABLE Pertence (
    cod_categoria INTEGER,
    cod_produto INTEGER,
    CONSTRAINT pertence_pkey PRIMARY KEY (cod_categoria, cod_produto),
    CONSTRAINT pertence_categoria_fkey FOREIGN KEY (cod_categoria) 
        REFERENCES Categoria (cod_categoria),
    CONSTRAINT pertence_produto_fkey FOREIGN KEY (cod_produto) 
        REFERENCES Produto (cod_produto)
);

-- -------------------------------------------------------------
-- 3. VENDAS, TRANSAÇÕES E ATENDIMENTO
-- -------------------------------------------------------------

-- PedidoPagamento: Fusão 1:1 entre Pedido e Pagamento
CREATE TABLE PedidoPagamento (
    cod_pedido INTEGER,
    cpf_cliente CHAR(11) NOT NULL,
    data_hora TIMESTAMP,
    status_pedido VARCHAR2(20),
    cod_transacao INTEGER NOT NULL,
    data_pagamento DATE NOT NULL,
    meio_pagamento VARCHAR2(20),
    status_pagamento VARCHAR2(20),
    CONSTRAINT pedido_pkey PRIMARY KEY (cod_pedido),
    CONSTRAINT pedido_cliente_fkey FOREIGN KEY (cpf_cliente) 
        REFERENCES Cliente (cpf_cliente)
);

CREATE SEQUENCE seq_pedido INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_pagamento INCREMENT BY 1 START WITH 1;

CREATE TABLE ItemPedido (
    cod_pedido INTEGER,
    cod_produto INTEGER,
    cod_rastreio_entrega INTEGER NOT NULL,
    cod_promocao INTEGER,
    quantidade INTEGER CHECK(quantidade > 0),
    valor_unitario NUMBER(9, 2) NOT NULL,
    nota_avaliacao NUMBER(2, 1) CHECK(nota_avaliacao BETWEEN 0 AND 5),
    comentario VARCHAR2(200),
    CONSTRAINT itemPedido_pkey PRIMARY KEY (cod_pedido, cod_produto),
    CONSTRAINT itemPedido_pedido_fkey FOREIGN KEY (cod_pedido) 
        REFERENCES PedidoPagamento (cod_pedido),
    CONSTRAINT itemPedido_produto_fkey FOREIGN KEY (cod_produto) 
        REFERENCES Produto (cod_produto),
    CONSTRAINT itemPedido_entrega_fkey FOREIGN KEY (cod_rastreio_entrega) 
        REFERENCES Entrega (cod_rastreio),
    CONSTRAINT itemPedido_promocao_fkey FOREIGN KEY (cod_promocao) 
        REFERENCES Promocao (cod_promocao)
);

CREATE TABLE Reclamacao (
    cod_reclamacao INTEGER,
    cod_pedido INTEGER NOT NULL,
    cpf_funcionario CHAR(11) NOT NULL,
    status VARCHAR2(20),
    classificacao VARCHAR2(20),
    descricao VARCHAR2(200),
    data_resolucao DATE,
    CONSTRAINT reclamacao_pkey PRIMARY KEY (cod_reclamacao),
    CONSTRAINT reclamacao_pedido_fkey FOREIGN KEY (cod_pedido) 
        REFERENCES PedidoPagamento (cod_pedido),
    CONSTRAINT reclamacao_funcionario_fkey FOREIGN KEY (cpf_funcionario) 
        REFERENCES Funcionario (cpf_funcionario)
);

CREATE SEQUENCE seq_reclamacao INCREMENT BY 1 START WITH 1;

CREATE TABLE Atribui ( 
    cpf_cliente CHAR(11),
    cod_promocao INTEGER,
    cod_categoria INTEGER,
    CONSTRAINT atribui_pkey PRIMARY KEY (cpf_cliente, cod_promocao, cod_categoria),
    CONSTRAINT atribui_cliente_fkey FOREIGN KEY (cpf_cliente) 
        REFERENCES Cliente (cpf_cliente),
    CONSTRAINT atribui_promocao_fkey FOREIGN KEY (cod_promocao) 
        REFERENCES Promocao (cod_promocao),  
    CONSTRAINT atribui_categoria_fkey FOREIGN KEY (cod_categoria) 
        REFERENCES Categoria (cod_categoria)
);
