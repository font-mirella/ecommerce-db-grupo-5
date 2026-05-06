# Projeto de Banco de Dados – Grupo 5 (2026.1)

**Disciplina:** Banco de Dados – UFPE CIn  
**Turma:** 2026.1  
**Equipe:** Amanda Trinity, Maria Eduarda, Maria Luísa, Matheus Braglia, Mirella Laura, Willian Neves

---

## 📦 Sobre o Projeto

Sistema de e-commerce desenvolvido como projeto prático da disciplina de Banco de Dados.  
O banco gerencia usuários (clientes e funcionários), produtos, pedidos, pagamentos, entregas, transportadoras, promoções, reclamações e histórico de preços / cargos.

---

## 📁 Estrutura do Repositório

```
Projeto_BD/
├── README.md
├── docs/
│   ├── AV1GRUPO5.html              ← Diagrama EER (AV1)
│   ├── AV2GRUPO5.html              ← Esquema Relacional Normalizado (AV2)
│   ├── AV2_Relacional_Normalizado.md
│   └── Minimundo_Atualizado_Final.md
└── sql/
    ├── 01_criacao.sql              ← CREATE TABLE, SEQUENCE, CONSTRAINT, CHECK
    └── 02_povoamento.sql           ← INSERT INTO (dados coerentes com o domínio)
```

---

## 🛠️ Como Executar

1. Acesse o [Oracle Live SQL](https://livesql.oracle.com/)
2. Faça login com uma conta Oracle gratuita
3. Execute **`01_criacao.sql`** primeiro (drop + create das tabelas e sequences)
4. Em seguida, execute **`02_povoamento.sql`** para popular o banco

> ⚠️ Sempre execute a criação antes do povoamento. Caso queira reiniciar, basta rodar o bloco `DROP` no início de `01_criacao.sql`.

---

## ✅ Checklist AV3

| Item obrigatório         | Arquivo              | Status |
|--------------------------|----------------------|--------|
| `CREATE TABLE`           | `01_criacao.sql`     | ✅     |
| `INSERT INTO`            | `02_povoamento.sql`  | ✅     |
| `CONSTRAINT` em `CREATE` | `01_criacao.sql`     | ✅     |
| `CREATE SEQUENCE`        | `01_criacao.sql`     | ✅     |
| Cláusula `CHECK`         | `01_criacao.sql`     | ✅     |
