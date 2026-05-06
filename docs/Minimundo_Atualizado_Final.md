# Descrição do Minimundo – Grupo 5 (ATUALIZADO E FINAL)

**Banco de Dados – 2026.1 – UFPE CIn**
**ECOMMERCE**
**Alunos:** Amanda Trinity, Maria Eduarda, Maria Luísa, Matheus Braglia, Mirella Laura, Willian Neves

---

## 1. Descrição do Mundo Real
O sistema de e-commerce tem como objetivo gerenciar as operações de uma plataforma digital de vendas, na qual usuários devem assumir papel de cliente, funcionário ou ambos. Cada usuário possui informações cadastrais como CPF, nome, endereço (atributo composto por complemento, número de endereço, tipo de endereço e CEP) e múltiplos telefones. Os clientes possuem tipo de assinatura e são responsáveis por realizar pedidos de compra de produtos disponíveis no sistema, podendo também avaliar itens dos pedidos realizados e registrar reclamações. Os funcionários possuem matrícula e atuam em atividades operacionais internas, como supervisão de outros funcionários e gestão do fluxo de atendimento de reclamações. 

Cada funcionário atua sob um cargo regular e formal da empresa. Como o sistema exige auditoria contínua, os funcionários **assumem cargos ao longo do tempo (relacionamento temporal)**, onde a data de início da posse os diferencia, ou seja, um mesmo funcionário pode assumir diferentes cargos em datas distintas. Existe ainda uma hierarquia interna de supervisão: um funcionário pode supervisionar vários outros funcionários (auto-relacionamento). Um funcionário pode atender várias reclamações.

Cada promoção possui um código identificador, um percentual de desconto e um período ativo. A atribuição de promoções ocorre simultaneamente entre um cliente e uma categoria de produto. Quando utilizada, a promoção é aplicada diretamente a um item de pedido específico. Os produtos comercializados possuem código identificador, nome, preço, quantidade em estoque e nota média de avaliações (derivada). Para manter registros íntegros contra flutuações, **o produto possui um histórico de preços controlado temporalmente**, permitindo saber o valor na respectiva data de vigência.

Esses produtos são organizados em categorias. Cada categoria é identificada por um código e possui nome e descrição. O pedido possui código identificador e atributos como data/hora, status e valor total (derivado). Um pedido deve ser composto por um ou mais itens. Cada item do pedido representa a associação entre um pedido e um produto específico; Além de conter quantidade e valores, **a avaliação feita pelo cliente surge e fica acoplada diretamente à resolução deste próprio item do pedido**, registrando nota e comentário, sem ser necessário espelhar isso solto pro produto.

Cada pedido exige exatamente um pagamento. Cada pagamento possui código de transação, meio de pagamento, status (aprovado ou negado), data e valor pago — derivado do pedido com os descontos. Entregas (com código de rastreio e datas) são obrigatoriamente conduzidas por transportadoras (dotadas de múltiplos telefones). Toda entrega possui itens de pedido associados. 

Ao encontrar problemas, cada **reclamação é diretamente engatada e registrada sobre um Pedido**, documentando código, classificação, status, descrição e data de resolução, sendo atendida por um funcionário.

---

## 2. Descrição das Entidades e Atributos Chaves

**3.1 Usuário (Forte):** CPF (PK), Nome, Endereço (CEP, N_Residência, Complemento, TipoEndereco), Telefones (Multivalorado).
**3.2 Cliente (Subclasse de Usuário):** TipoAssinatura.
**3.3 Funcionário (Subclasse de Usuário):** Matrícula.
**3.4 Produto (Forte):** CODProduto (PK), Nome, Preço, Estoque, NotaMedia (Derivado).
**3.5 Categoria (Forte):** CODCategoria (PK), Nome, Descrição.
**3.6 Pedido (Forte):** CODPedido (PK), DataHora, Status, ValorTotal (Derivado).
**3.7 Pagamento (Forte):** CODTransacao (PK), MeioPagamento, Data, Status, ValorPago (Derivado).
**3.8 Promoção (Forte):** CODPromocao (PK), Percentual, PeriodoAtivo.
**3.9 Transportadora (Forte):** CNPJ (PK), Nome, ValorFrete, Telefone (Multivalorado).
**3.10 Entrega (Forte):** CODRastreio (PK), DataPostagem, DataEstimada, DataHoraEntrega.
**3.11 Reclamação (Forte):** CODReclamacao (PK), Classificação, Descrição, Status, DataResolução.
**3.12 Cargo (Forte - Correção Monitoria):** CODCargo (PK), NomeCargo, Departamento.
**3.13 Item do Pedido (Associativa):** Quantidade, ValorUnitário, ValorTotal (Derivado).

---

## 3. Descrição dos Relacionamentos

**4.1 Realiza (Cliente – Pedido):** 1:N.
**4.2 Pertence (Produto – Categoria):** N:1 (cada produto abriga uma categoria).
**4.3 Composto Por (Pedido – Produto):** N:N gerando "Item do Pedido".
**4.4 Exige (Pedido – Pagamento):** 1:1. (S/ redundância de DataHora).
**4.5 Conduz (Transportadora – Entrega):** 1:N.
**4.6 Contém (Entrega – Item do Pedido):** 1:N.
**4.7 Avalia (Cliente – Item do Pedido):** N:1. (A nota e o comentário ficam aqui - elimina redundância da ligação para o produto puro).
**4.8 Aplica (Item do Pedido – Promoção):** N:1. Atributo: Desconto gerado.
**4.9 Atribui (Cliente – Categoria – Promoção):** Relacionamento ternário N:1:N.
**4.10 Supervisiona (Funcionário – Funcionário):** Auto-relacionamento 1:N.
**4.11 Atende (Funcionário – Reclamação):** 1:N.
**4.12 Sobre (Reclamação – Pedido):** N:1 - Cada reclamação investiga estritamente um pedido.
**4.13 Assume (Funcionário – Cargo) [TEMPORAL - CORREÇÃO]:** Relacionamento de N:M mediado pelo Tempo. Atributo agregador: DataInicio.
**4.14 Possui Preço (Produto - Histórico Tabela) [TEMPORAL]:** Relacionamento com data referencial isolando o valor na DataVigencia.

---

## 4. Generalização / Especialização
**Superclasse:** Usuário | **Subclasses:** Cliente e Funcionário.
**Tipo:** Parcial e Sobreposta (o). A especialização suporta que um usuário seja apenas cadastrado, ou ocupe ambos os papéis sem colisão.
