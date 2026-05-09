# Como usar o Oracle Live SQL para gerar os Relatórios

Este guia ensina como carregar o banco de dados e executar as consultas para obter as respostas solicitadas.

## Passo 1: Acessar o Oracle Live SQL
1. Acesse [livesql.oracle.com](https://livesql.oracle.com/).
2. Clique em **"Start Coding Now"**.
3. Faça login com sua conta Oracle (ou crie uma gratuita).

## Passo 2: Criar as Tabelas (Schema)
Para que as consultas funcionem, você precisa criar as tabelas primeiro.
1. Abra o arquivo [01_criacao.sql](file:///Users/willian/Projetos/ecommerce-db-grupo-5/sql/01_criacao.sql).
2. Copie todo o conteúdo do arquivo.
3. No Oracle Live SQL, cole o código na área **SQL Worksheet**.
4. Clique no botão **Run** (canto superior direito).

## Passo 3: Povoar o Banco de Dados (Dados)
Agora vamos inserir os dados de exemplo.
1. Abra o arquivo [02_povoamento.sql](file:///Users/willian/Projetos/ecommerce-db-grupo-5/sql/02_povoamento.sql).
2. Copie todo o conteúdo.
3. No Oracle Live SQL, apague o código anterior, cole o novo e clique em **Run**.

## Passo 4: Executar as Consultas (Relatórios)
Com o banco pronto, você pode obter as respostas:
1. Abra o arquivo [04_relatorios_finais.sql](file:///Users/willian/Projetos/ecommerce-db-grupo-5/sql/04_relatorios_finais.sql).
2. Escolha a consulta que deseja executar (por exemplo, "Quantas reclamações foram registradas por produto?").
3. Copie o bloco de código dessa consulta.
4. No Oracle Live SQL, cole e clique em **Run**.

---

### Dicas Úteis no Oracle Live SQL:
- **My Session**: No menu lateral, você pode ver todas as tabelas criadas em "Schema".
- **Script History**: Se precisar recuperar um código que rodou antes, use o histórico.
- **Erros de "Table Already Exists"**: O script `01_criacao.sql` já contém comandos `DROP TABLE` no início para evitar esse problema.

### Resumo da Organização dos Arquivos:
1. [01_criacao.sql](file:///Users/willian/Projetos/ecommerce-db-grupo-5/sql/01_criacao.sql): Cria as tabelas e sequências.
2. [02_povoamento.sql](file:///Users/willian/Projetos/ecommerce-db-grupo-5/sql/02_povoamento.sql): Insere os dados iniciais.
3. [03_consultas_checklist.sql](file:///Users/willian/Projetos/ecommerce-db-grupo-5/sql/03_consultas_checklist.sql): Consultas variadas (Checklist AV4).
4. [04_relatorios_finais.sql](file:///Users/willian/Projetos/ecommerce-db-grupo-5/sql/04_relatorios_finais.sql): Respostas específicas para as perguntas da imagem.
