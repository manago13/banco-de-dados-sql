CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos_categorias (
    produto_id INTEGER REFERENCES produtos(id) ON UPDATE CASCADE,
    categoria_id INTEGER REFERENCES categorias(id) ON UPDATE CASCADE,
    PRIMARY KEY (produto_id, categoria_id)
);

DROP TABLE produtos_categorias;
DROP TABLE produtos;

INSERT INTO produtos (nome, preco)
VALUES
('caneta', 1),
('pen drive', 90),
('caderno', 100),
('ventilador', 101),
('garrafa', 110);

INSERT INTO produtos (nome, preco)
VALUES ('arame', 101);

INSERT INTO categorias (nome)
VALUES
('escolar'),
('eletronicos'),
('eletrodomestico'),
('utensilios'),
('construcao'),
('perfumes')
;

DELETE FROM produtos;

SELECT *
FROM categorias;

SELECT *
FROM produtos;

-- Listar os nomes de todos os produtos que custam mais de 100 reais, ordenando-os primeiramente pelo preço e em segundo lugar pelo nome.
SELECT nome AS "Produto", preco AS "Valor"
FROM produtos
WHERE preco>100
ORDER BY preco, nome
;

-- Listar todos os ids e preços de produtos cujo preço seja maior do que a média de todos os preços encontrados na tabela "produtos".
SELECT id, preco
FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos)
;

-- Mostrar o preço médio do conjunto de produtos associados a cada categoria, ordenada pelo nome da categoria. Caso uma categoria não tenha nenhum produto a ela associada, esta categoria não deve aparecer no resultado final.
INSERT INTO produtos_categorias (produto_id, categoria_id)
VALUES
(6,1),
(7,2),
(8,1),
(9,3),
(10,4),
(11,5);


SELECT *
FROM produtos_categorias;

SELECT * FROM
(SELECT * FROM produtos
LEFT JOIN produtos_categorias
ON id = produto_id) AS produtos_categorias
LEFT JOIN categorias
ON produtos_categorias.categoria_id = categorias.id
;

SELECT produtos_categorias.nome AS "Categoria", AVG(preco) AS "Media" FROM
(SELECT * FROM categorias
LEFT JOIN produtos_categorias
ON id = categoria_id) AS produtos_categorias

LEFT JOIN produtos
ON produtos_categorias.produto_id = produtos.id

WHERE preco NOTNULL

GROUP BY produtos_categorias.nome
ORDER BY produtos_categorias.nome
;
