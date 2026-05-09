# ecommerce-db-grupo-5 (2026.1)

**Disciplina:** Banco de Dados – UFPE CIn  
**Turma:** 2026.1  
**Equipe:** Amanda Trinity, Maria Eduarda, Maria Luísa, Matheus Braglia, Mirella Laura, Willian Neves

---

## Sobre o Projeto

Este repositório contém a implementação física (SQL), mapeamento lógico e relatórios de um sistema de E-Commerce. O projeto foi desenvolvido seguindo as melhores práticas de modelagem relacional, garantindo integridade de dados e normalização até a 3ª Forma Normal.

---

## Decisões de Modelagem e Normalização

Durante a transição do modelo conceitual (EER) para o relacional, aplicamos as seguintes etapas críticas:

### 1. Relacionamento Temporal (M:N) - Histórico de Cargos
O relacionamento entre Funcionário e Cargo foi mapeado como N:N (Temporal).
*   **Tabela:** HistoricoCargos.
*   **Lógica:** A chave primária é composta por (cpf_funcionario, cargo, data_admissao). Isso permite que um funcionário assuma o mesmo cargo múltiplas vezes em datas diferentes, mantendo o histórico de admissão e saída completo.

### 2. Normalização e Integridade
*   **1FN:** Atomização de endereços e separação de telefones multivalorados.
*   **2FN:** Dependência total da chave primária em tabelas associativas como ItemPedido e Pertence.
*   **3FN:** Eliminação de atributos derivados para evitar redundância.

---

## Estrutura do Repositório

O projeto está organizado de forma a facilitar a execução sequencial dos scripts no Oracle Live SQL ou ambientes similares.

```
ecommerce-db-grupo-5/
├── README.md
├── docs/                           
│   ├── AV1 GRUPO 5.pdf             -- Documentação da AV1
│   ├── AV2-Grupo-5.pdf             -- Documentação da AV2
│   ├── plano.txt                   -- Planejamento de consultas e checklist
│   └── walkthrough_oracle_livesql.md -- Guia de execução passo a passo
└── sql/                            
    ├── 01_criacao.sql              -- DDL: Tabelas, Sequências e Constraints
    ├── 02_povoamento.sql           -- DML: Inserção de dados para teste
    ├── 02_povoamento_v2.sql        -- DML: Versão expandida para teste de relatórios
    ├── 03_consultas_checklist.sql  -- DQL/PL-SQL: Atendimento aos requisitos da disciplina
    └── 04_relatorios_finais.sql    -- DQL: Consultas de negócio e relatórios gerenciais
```

---

## Instruções de Execução

Para garantir o funcionamento correto das referências e chaves estrangeiras, execute os scripts na ordem numérica indicada na pasta sql:

1.  Execute **01_criacao.sql**: Prepara o esquema do banco de dados.
2.  Execute **02_povoamento.sql** (ou **02_povoamento_v2.sql** para testes mais complexos): Popula o banco com dados realistas.
3.  Execute **03_consultas_checklist.sql** ou **04_relatorios_finais.sql** conforme a necessidade de análise.

Para um guia detalhado sobre como utilizar o Oracle Live SQL, consulte o arquivo [docs/walkthrough_oracle_livesql.md](file:///Users/willian/.gemini/antigravity/brain/c7c5fd44-fd21-4cd2-9d65-4b154120adc8/walkthrough_oracle_livesql.md).

---

## Checklist da Entrega

- [x] CREATE TABLE com constraints adequadas.
- [x] INSERT INTO com dados realistas e coerentes.
- [x] CONSTRAINT (Primary Key e Foreign Key) implementadas.
- [x] CREATE SEQUENCE para geração automática de identificadores.
- [x] CLÁUSULA CHECK para validações de domínio.
- [x] Consultas SQL (Select, Joins, Group By, Having).
- [x] Blocos PL/SQL (Procedures, Functions, Triggers e Packages).
- [x] Organização sistemática do repositório.
