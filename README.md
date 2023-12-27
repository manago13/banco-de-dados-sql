# Modelagem e normalização de bancos de dados relacionais
Modelagem e normalização de banco de dados com o objetivo de mapear os clientes de um banco pelos diferentes produtos financeiros contratado por eles.

A companhia tem uma grande quantidade de clientes e oferece uma variedade de produtos financeiros, como cartões de crédito, empréstimos, seguros e investimentos. No entanto, eles estão tendo dificuldades para entender quais produtos eram mais populares entre os clientes e como esses produtos estavam interagindo entre si.

Como ponto de partida, o gestor da companhia deixou claro que um cliente pode contratar vários produtos diferentes ao passo que um mesmo produto pode também estar associado a vários clientes diferentes e elaborou um rústico esboço de banco de dados com duas tabelas, da seguinte forma:

&nbsp;

**Tabela 1:**

Nome da tabela: cliente

Colunas: codigo_cliente, nome_cliente, sobrenome_cliente, telefones_cliente, municipio_cliente, codigo_tipo_cliente, tipo_cliente

&nbsp;

**Tabela 2:**

Nome da tabela: produto

Colunas: codigo_produto, nome_produto, descricao_produto, codigo_tipo_produto, tipo_produto, codigo_diretor_responsavel, nome_diretor_responsavel, email_diretor_responsavel

&nbsp;

Foi feito, então:
1) Modelo conceitual do esboço oferecido pelo gestor da companhia, destacando atributos chaves e multivalorados, apresentando também a cardinalidade dos relacionamentos, pré e pós-normalização.
2) Modelo lógico que expressa as mesmas informações e relacionamentos descritos no modelo original, mas decompondo-os quando necessário para que sejam respeitadas as 3 primeiras formas normais. Com destaque para atributos chaves e multivalorados, apresentando também a cardinalidade dos relacionamentos.

&nbsp;

# Consultas SQL simples e complexas em um banco de dados PostgreSQL
Construção de um banco de dados de e-commerce que tem produtos e categorias, onde um produto pode pertencer a várias categorias e uma categoria pode estar associada a vários produtos.  Nesse caso, teríamos duas tabelas: "produtos" e "categorias", com uma tabela intermediária "produtos_categorias" para relacionar os produtos às suas categorias.

Usando o subconjunto da "structured query language" (DQL), foram realizadas consultas no banco de dados de modo a atender cada uma das seguintes solicitações:
1. Listar os nomes de todos os produtos que custam mais de 100 reais, ordenando-os primeiramente pelo preço e em segundo lugar pelo nome.
2. Listar todos os ids e preços de produtos cujo preço seja maior do que a média de todos os preços encontrados na tabela "produtos".
3. Mostrar o preço médio do conjunto de produtos associados a cada categoria, ordenada pelo nome da categoria. Caso uma categoria não tenha nenhum produto a ela associada, esta categoria não deve aparecer no resultado final.

&nbsp;

# Inserções, alterações e remoções de objetos e dados em um banco de dados PostgreSQL
Construção de um banco de dados de uma escola, com alunos e turmas, que representa um relacionamento do tipo 1,n entre as entidades "aluno" e "turma", partindo do seguinte esboço:

&nbsp;

**Tabela 1:**

Nome da tabela: aluno

Colunas da tabela: id_aluno (SERIAL), nome_aluno (VARCHAR), aluno_alocado (BOOLEAN), id_turma (INT)

&nbsp;

**Tabela 2:**

Nome da tabela: turma

Colunas da tabela: id_turma (SERIAL), código_turma (VARCHAR), nome_turma (VARCHAR)

&nbsp;

Usando o subconjunto da DML, foram atendidas as seguintes solicitações:
1. Inserir pelo menos duas turmas diferentes na tabela de turma;
2. Inserir pelo menos 1 aluno alocado em cada uma destas turmas na tabela aluno (todos com NULL na coluna aluno_alocado);
3. Inserir pelo menos 2 alunos não alocados em nenhuma turma na tabela aluno (todos com NULL na coluna aluno_alocado);
4. Atualizar a coluna aluno_alocado da tabela aluno, de modo que os alunos associados a uma disciplina recebam o valor True e alunos não associdos a nenhuma disciplina recebam o falor False para esta coluna.

