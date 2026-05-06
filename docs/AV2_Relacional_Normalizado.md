# Modelo Relacional Normalizado & Justificativas (AV2 - Grupo 5)

## 1. Mapeamento Lógico (Esquema Relacional)
A partir da estrutura EER (já com as correções aplicadas da AV1), extraímos o seguinte esquema relacional. Chaves primárias (PK) estão marcadas e sublinhadas nas justificativas ou denotadas por **(PK)** e chaves estrangeiras por **(FK)**.

**Usuário (Superclasse)**
* `Usuario` ( **CPF_Usuario (PK)**, Nome, CEP, N_Residencia, Complemento, TipoEndereco )
* `Usuario_Telefone` ( **CPF_Usuario (PK/FK)**, **Telefone (PK)** )
> *Justificativa Mapeamento:* A superclasse `Usuario` possui atributos compostos e multivalorados. Como Endereço tem itens pré-determinados, ele vira várias colunas. O Telefone, por ser multivalorado, vai para uma tabela separada `Usuario_Telefone`.

**Subclasses de Usuário**
* `Cliente` ( **CPF_Usuario (PK/FK)**, TipoAssinatura )
* `Funcionario` ( **CPF_Usuario (PK/FK)**, Matricula (UNIQUE) )
> *Justificativa Mapeamento:* Adota-se CPF_Usuario como chave de interligação para tabelas derivadas devido à restrição de sobreposição informada (um usuário pode ser cliente e funcionário ao mesmo tempo). A matrícula vira chave única na tabela Funcionário.

**Relacionamento Hierárquico: Supervisiona**
* A tabela `Funcionario` sofre alteração para incluir a chave estrangeira do supervisor:
* `Funcionario` ( **CPF_Usuario (PK/FK)**, Matricula, CPF_Supervisor (FK) )

**Catálogo e Produto**
* `Categoria` ( **CODCategoria (PK)**, Nome, Descricao )
* `Produto` ( **CODProduto (PK)**, Nome, PrecoAtual, Estoque )
* `Produto_Categoria` ( **CODProduto (PK/FK)**, **CODCategoria (PK/FK)** )
> *Justificativa Mapeamento:* O relacionamento N:N entre Produto e Categoria gera a tabela associativa `Produto_Categoria`. O atributo `NotaMedia` não é inserido como coluna fixa, visto que é um dado derivado oriundo de uma query sobre as Reclamações/Avaliações (conforme padrão relacional).

**Relacionamentos Temporais (Correção Aplicada)**
Criamos entidades regulares para os históricos do sistema para compor o relacionamento temporal.
* `Cargo` ( **CODCargo (PK)**, Titulo )
* `Assume_Cargo` ( **CPF_Funcionario (PK/FK)**, **CODCargo (PK/FK)**, **DataInicio (PK)** )
* `Preco_Historico` ( **CODProduto (PK/FK)**, **DataVigencia (PK)**, Valor )
> *Justificativa:* O relacionamento temporal garante que o mesmo funcionário pode assumir o mesmo cargo mais de uma vez em dadas diferentes. A mesma regra define o Produto_Histórico_Preços.

**Pedidos e Transações**
* `Pedido` ( **CODPedido (PK)**, DataHora, Status, CPF_Cliente (FK) )
* `Pagamento` ( **CODTransacao (PK)**, MeioPagamento, Data, Status, CODPedido (FK - UNIQUE) )
> *Justificativa Mapeamento:* O relacionamento `Realiza (1:N)` envia o CPF_Cliente para o Pedido. O relacionamento `Exige (1:1)` envia o número do Pedido para o pagamento. O atributo derivado `ValorPago` ou `ValorTotal` do Pedido são omitidos pois não são colunas base e são obtidos calculando os itens e os descontos.

**Entidade Associativa: Item do Pedido**
* `Item_Pedido` ( **CODPedido (PK/FK)**, **CODProduto (PK/FK)**, Quantidade, ValorUnitario_Aquisicao, CPF_Cliente_Avaliador (FK), NotaAvaliacao, Comentario, CODPromocao_Aplicada (FK), Desconto )
> *Justificativa Mapeamento:* Sendo a avaliação obrigatoriamente vinculada a um item de pedido (Avalia 1:N) e a uma Promoção direta, a tabela Item_Pedido absorve a ação de atribuição "recebe desconto de" e a ação opcional "foi avaliado em e por fulano".

**Promoção e Atribuição**
* `Promocao` ( **CODPromocao (PK)**, Percentual, DataInicio, DataFim )
* `Atribui_Promocao` ( **CPF_Cliente (PK/FK)**, **CODPromocao (PK/FK)**, **CODCategoria (PK/FK)** )
> *Justificativa:* O relacionamento "Atribui" é ternário e de muitos-para-muitos com categorias e clientes no mesmo agrupamento, gerando imediatamente uma tabela relacional dedicada.

**Processo de Logística (Envio)**
* `Transportadora` ( **CNPJ (PK)**, Nome, ValorFrete )
* `Transportadora_Telefone` ( **CNPJ (PK/FK)**, **Telefone (PK)** )
* `Entrega` ( **CODRastreio (PK)**, DataPostagem, DataEstimada, DataHoraEntrega, CNPJ_Transportadora (FK) )
> *Justificativa:* O N:1 de Entregas x Transportadora empurra o CNPJ para dentro de Entrega. A Transportadora possui também atributo multivalorado e repete a lógica da tabela Usuario_Telefone.

**Atendimento/Reclamação**
* `Reclamacao` ( **CODReclamacao (PK)**, Classificacao, Status, Descricao, DataResolucao, CODPedido (FK), CPF_Funcionario_Designado (FK) )
> *Justificativa:* Como corrigido do feedback da AV1, Reclamação é atrelada diretamente ao Pedido, resolvendo as perguntas feitas pelo cliente sobre seus pedidos globais! A cardinalidade empurra as FKs do `Pedido` e de `Funcionario` (quem recebe do auto-relacionamento Atende) para a tebela principal.

---

## 2. Passos e Justificativas de Normalização (1FN, 2FN, 3FN)

Foram executadas as rotinas de normalização do modelo.

### Primeira Forma Normal (1FN)
* **Regra:** Não ter campos multivalorados, campos compostos e tabelas aninhadas.
* **Justificativa da Solução:** Nenhuma tabela criada no Mapeamento possui arrays/listas. O atributo composto `Endereço` do Usuário foi espalhado em 4 colunas atômicas diretas (CEP, N_Residencia, Complemento, TipoEndereco). O atributo multivalorado `Telefone` (tanto de Empresa/Transportadora quanto de Usuários físicos) foi movido para uma tabela separada dedicada ao cruzamento (ex: `Usuario_Telefone`), satisfazendo em 100% a Primeira Forma Normal.

### Segunda Forma Normal (2FN)
* **Regra:** A tabela precisa estar na 1FN, e todo campo não chave precisa depender da chave primária composta inteira, e não parte dela.
* **Justificativa da Solução:** As tabelas que detêm chaves primárias compostas neste modelo são: `Item_Pedido`, `Assume_Cargo`, `Preco_Historico`, `Atribui_Promocao` e `Produto_Categoria`.
  * Em `Item_Pedido (PK: Pedido + Produto)`, propriedades como `Quantidade` ou `ValorUnitario_Aquisicao` fazem total sentido apenas se aliadas as DUAS partes (não faz sentido ter a quantia atrelada puramente ao Pedido ou inversamente só ao Produto puro).
  * A tabela está plenamente qualificada na 2FN pois todos os descritores nestas tabelas associativas dependem mutuamente do par composto PK.

### Terceira Forma Normal (3FN)
* **Regra:** O modelo precisa estar na 2FN garantindo a ausência de Atributos Derivados ou Transitividade entre atributos que não são chaves primárias. "Um tributo não-chave não pode descrever outro tributo não-chave".
* **Justificativa da Solução:** Para alinhar o modelo em 3FN, **Removemos formalmente todos os atributos derivados que estavam no EER**: `ValorTotal` do Pedido, `NotaMedia` do Produto e `ValorTotal_Item` do `Item_Pedido`. Suas existências nas tabelas quebravam a 3FN já que poderiam ser descobertos via aritmética/calculo (Soma e Multiplicação transiente do Banco de dados). Adicionalmente, verificamos que os campos de Categorias (Descrição), Produtos (Estoque) e Endereços referenciam única e exlusivamente sua própria chave (PK), garantindo ausência de relação cruzada parasita e total sucesso no atingimento à Terceira Forma Normal.
