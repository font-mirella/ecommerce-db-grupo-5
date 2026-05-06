# Projeto de Banco de Dados – Grupo 5 (2026.1)

**Disciplina:** Banco de Dados – UFPE CIn  
**Turma:** 2026.1  
**Equipe:** Amanda Trinity, Maria Eduarda, Maria Luísa, Matheus Braglia, Mirella Laura, Willian Neves

---

## 📦 Sobre o Projeto

Este repositório contém a implementação física (SQL) e o mapeamento lógico de um sistema de **E-Commerce**. O projeto foi desenvolvido seguindo as melhores práticas de modelagem relacional, garantindo integridade de dados e normalização até a 3ª Forma Normal.

---

## 📐 Decisões de Modelagem e Normalização

Durante a transição do modelo conceitual (EER) para o relacional, aplicamos as seguintes etapas críticas:

### 1. Relacionamento Temporal (M:N) - Histórico de Cargos
O relacionamento entre **Funcionário** e **Cargo** foi mapeado como **N:N (Temporal)**.
*   **Tabela:** `HistoricoCargos` (ou `Assume`).
*   **Lógica:** A chave primária é composta por `(cpf_funcionario, cargo, data_admissao)`. Isso permite que um funcionário assuma o mesmo cargo múltiplas vezes em datas diferentes, mantendo o histórico de admissão e saída completo.

### 2. Fusão 1:1 - Pedido e Pagamento
Para otimização de consultas e simplificação do modelo (visto que no nosso domínio cada pedido exige exatamente um pagamento e vice-versa):
*   **Tabela:** `PedidoPagamento`.
*   **Lógica:** Unificamos os atributos de Pedido (status, data/hora) e Pagamento (meio, status transação) em uma única entidade, utilizando `cod_pedido` como identificador único central.

### 3. Normalização e Integridade
*   **1FN:** Atomização de endereços e separação de telefones multivalorados.
*   **2FN:** Dependência total da chave primária em tabelas associativas como `ItemPedido` e `Pertence`.
*   **3FN:** Eliminação de atributos derivados (ValorTotal, NotaMedia) para evitar redundância.

---

## 📁 Estrutura do Repositório

```
Projeto_BD/
├── README.md
├── docs/                           ← Documentação da AV1 e AV2
│   ├── AV1GRUPO5.html              ← Diagrama EER
│   ├── AV2_Relacional_Normalizado.md
│   └── Minimundo_Atualizado_Final.md
└── sql/                            ← Scripts de execução (Oracle Live SQL)
    ├── 01_criacao.sql              ← CREATE TABLE, SEQUENCE, CONSTRAINT, CHECK
    └── 02_povoamento.sql           ← INSERT INTO rico e coerente
```

---

## 🛠️ Como Executar no Oracle Live SQL

1. Execute o script **`01_criacao.sql`**: Limpa o ambiente e cria a estrutura física.
2. Execute o script **`02_povoamento.sql`**: Popula o banco com dados realistas.

---

## ✅ Checklist da Entrega (AV3)

- [x] **CREATE TABLE** com constraints.
- [x] **INSERT INTO** com dados reais.
- [x] **CONSTRAINT** (Primary Key e Foreign Key).
- [x] **CREATE SEQUENCE** para IDs.
- [x] **CLÁUSULA CHECK** para validações.
- [x] **Organização** completa do repositório.
