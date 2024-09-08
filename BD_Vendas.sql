-- 1. Criação do Banco de Dados.
CREATE DATABASE BD_Vendas;

-- 2. Seleção do Banco de Dados.
USE BD_Vendas;

-- 3. Criação de tabelas no Banco de Dados selecionado.
CREATE TABLE TBL_Cliente
(
	cod_cliente int PRIMARY KEY,
	nome_cliente varchar(255),
	cod_est_civ int,
	salario money,
	FOREIGN KEY(cod_est_civ) REFERENCES TBL_Estado_Civil(cod_est_civ)
);

CREATE TABLE TBL_Conjuge
(
	cod_conjuge int PRIMARY KEY, 
	nome_conjuge varchar(255),
	cod_cliente int,
	FOREIGN KEY(cod_cliente) REFERENCES TBL_Cliente(cod_cliente)
);

CREATE TABLE TBL_Dependente
(
	cod_dep int PRIMARY KEY,
	nome_dep varchar(255),
	data_nasc date,
	cod_func int,
	FOREIGN KEY(cod_func) REFERENCES TBL_Func(cod_func)
);

CREATE TABLE TBL_Estado_Civil
(
	cod_est_civ int PRIMARY KEY,
	desc_est_civ varchar(255)
);

CREATE TABLE TBL_Func
(
	cod_func int PRIMARY KEY,
	nome_func varchar(255)
);

CREATE TABLE TBL_Item_Pedido
(
	cod_pedido int,
	cod_produto int,
	qtde_produto int,
	FOREIGN KEY(cod_pedido) REFERENCES TBL_Pedido(cod_pedido),
	FOREIGN KEY(cod_produto) REFERENCES TBL_Produto(cod_produto)
);

CREATE TABLE TBL_Pedido
(
	cod_pedido int PRIMARY KEY,
	cod_cliente int,
	cod_func int,
	data_pedido date
	FOREIGN KEY(cod_cliente) REFERENCES TBL_Cliente(cod_cliente),
	FOREIGN KEY(cod_func) REFERENCES TBL_Func(cod_func)
);

CREATE TABLE TBL_Premio
(
	cod_func int,
	valor_premio money,
	FOREIGN KEY(cod_func) REFERENCES TBL_Func(cod_func)
);

CREATE TABLE TBL_Produto
(
	cod_produto int PRIMARY KEY,
	nome_produto varchar(255),
	tipo_produto varchar(255)
);

CREATE TABLE TBL_Telefone
(
	cod_cliente int,
	cod_fone int,
	numero_fone int,
	FOREIGN KEY(cod_cliente) REFERENCES TBL_Cliente(cod_cliente),
	FOREIGN KEY(cod_fone) REFERENCES TBL_Tipo_Fone(cod_fone)
);

CREATE TABLE TBL_Tipo_Fone
(
	cod_fone int PRIMARY KEY,
	desc_fone varchar(255),
);

-- 4. Incluir dados nas tabelas.
INSERT INTO TBL_CLiente (cod_cliente, nome_cliente, cod_est_civ, salario)
VALUES
	(1, 'Rener Silva', 1, 3000.00),
	(2, 'Maria Oliveira', 2, 4500.00),
	(3, 'Daniel Santos', 3, 5000.00),
	(4, 'Ana Souza', 4, 2500.00),
	(5, 'Carlos Lima', 5, 4000.00),
	(6, 'Paula Mendes', 6, 5500.00),
	(7, 'Rafael Costa', 7, 3500.00),
	(8, 'Clara Araújo', 8, 4800.00),
	(9, 'Bruno Rocha', 9, 3900.00),
	(10, 'Juliana Freitas', 10, 6000.00);

INSERT INTO TBL_Conjuge (cod_conjuge, nome_conjuge, cod_cliente)
VALUES
	(1, 'Fernanda Silva', 2),
	(2, 'Ricardo Oliveira', 3),
	(3, 'Luciana Santos', 5),
	(4, 'Marcos Souza', 8),
	(5, 'Tatiana Lima', 6),
	(6, 'Renato Mendes', 10),
	(7, 'Priscila Costa', 9),
	(8, 'Vinicius Araújo', 4),
	(9, 'Beatriz Rocha', 7),
	(10, 'André Freitas', 1);

INSERT INTO TBL_Dependente (cod_dep, nome_dep, data_nasc, cod_func)
VALUES
	(1, 'Pedro Ferreira', '2015-05-12', 1),
	(2, 'Luiza Almeida', '2013-07-25', 2),
	(3, 'Lucas Pereira', '2018-03-14', 3),
	(4, 'Lara Santos', '2016-10-02', 4),
	(5, 'Mateus Oliveira', '2014-12-22', 5),
	(6, 'Sofia Lopes', '2017-08-19', 6),
	(7, 'Guilherme Ricardo', '2019-09-30', 7),
	(8, 'Rafaela Andrade', '2020-11-21', 8),
	(9, 'Thiago Costa', '2015-06-15', 9),
	(10, 'Bianca Nunes', '2021-02-28', 10);

INSERT INTO TBL_Estado_Civil (cod_est_civ, desc_est_civ)
VALUES
	(1, 'Solteiro'),
	(2, 'Casado'),
	(3, 'Divorciado'),
	(4, 'Viúvo'),
	(5, 'Separado'),
	(6, 'União Estável'),
	(7, 'Solteiro(a)'),
	(8, 'Casado(a)'),
	(9, 'Divorciado(a)'),
	(10, 'Viúvo(a)');

INSERT INTO TBL_Func (cod_func, nome_func)
VALUES
	(1, 'Carlos Ferreira'),
	(2, 'Roseane Almeida'),
	(3, 'Paulo Pereira'),
	(4, 'Fernanda Santos'),
	(5, 'Francisco Oliveira'),
	(6, 'Mariana Lopes'),
	(7, 'José Ricardo'),
	(8, 'Camila Andrade'),
	(9, 'Roberto Costa'),
	(10, 'Aline Nunes');

INSERT INTO TBL_Item_Pedido (cod_pedido, cod_produto, qtde_produto)
VALUES
	(1, 1, 10),
	(2, 2, 5),
	(3, 3, 8),
	(4, 4, 15),
	(5, 5, 20),
	(6, 6, 12),
	(7, 7, 7),
	(8, 8, 25),
	(9, 9, 9),
	(10, 10, 18);

INSERT INTO TBL_Pedido (cod_pedido, cod_cliente, cod_func, data_pedido)
VALUES
	(1, 1, 1, '2024-01-15'),
	(2, 2, 2, '2024-02-10'),
	(3, 3, 3, '2024-03-20'),
	(4, 4, 4, '2024-04-05'),
	(5, 5, 5, '2024-05-12'),
	(6, 6, 6, '2024-06-18'),
	(7, 7, 7, '2024-07-22'),
	(8, 8, 8, '2024-08-01'),
	(9, 9, 9, '2024-08-15'),
	(10, 10, 10, '2024-08-23');

INSERT INTO TBL_Premio (cod_func, valor_premio)
VALUES
	(1, 1500.00),
	(2, 1200.00),
	(3, 1300.00),
	(4, 1400.00),
	(5, 1600.00),
	(6, 1100.00),
	(7, 1700.00),
	(8, 1150.00),
	(9, 1250.00),
	(10, 1350.00);

INSERT INTO TBL_Produto (cod_produto, nome_produto, tipo_produto)
VALUES
	(1, 'Fosforo', 'Tipo 1'),
	(2, 'Produto B', 'Tipo 2'),
	(3, 'Produto C', 'Tipo 3'),
	(4, 'Produto D', 'Tipo 1'),
	(5, 'Produto E', 'Tipo 2'),
	(6, 'Produto F', 'Tipo 3'),
	(7, 'Produto G', 'Tipo 1'),
	(8, 'Produto H', 'Tipo 2'),
	(9, 'Produto I', 'Tipo 3'),
	(10, 'Produto J', 'Tipo 1');