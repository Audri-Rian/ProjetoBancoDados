use ifood3;
CREATE TABLE Categoria (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Categoria VARCHAR(100) NOT NULL
);


CREATE TABLE Produto (
    ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Produto VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    ID_Categoria INT,
    Estoque INT NOT NULL,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria)
);

CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Cliente VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefone VARCHAR(15) NOT NULL
);

CREATE TABLE Endereco (
    ID_Endereco INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Logradouro VARCHAR(255) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(50),
    Bairro VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado VARCHAR(2) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE Pedidos (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Data_Pedido DATE NOT NULL,
    Mes_Venda VARCHAR(20) NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    ID_Endereco INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Endereco) REFERENCES Endereco(ID_Endereco)
);

CREATE TABLE Itens_Pedidos (
    ID_Item_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    ID_Produto INT,
    Quantidade INT NOT NULL,
    Preco_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

CREATE TABLE Forma_Pagamento (
    ID_Forma_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(50) NOT NULL
);

CREATE TABLE Historico_Pagamento (
    ID_Historico_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    ID_Forma_Pagamento INT,
    Data_Pagamento DATETIME NOT NULL,
    Valor_Pago DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Forma_Pagamento) REFERENCES Forma_Pagamento(ID_Forma_Pagamento)
);

CREATE TABLE Acompanhamento (
    ID_Acompanhamento INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE PedidoProdutoAcompanhamentos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Item_Pedido INT,
    ID_Acompanhamento INT,
    FOREIGN KEY (ID_Item_Pedido) REFERENCES Itens_Pedidos(ID_Item_Pedido),
    FOREIGN KEY (ID_Acompanhamento) REFERENCES Acompanhamento(ID_Acompanhamento)
);


INSERT INTO Categoria (Nome_Categoria) VALUES 
('Eletrônicos'),
('Roupas'),
('Alimentos'),
('Livros'),
('Brinquedos'),
('Móveis'),
('Beleza'),
('Esportes'),
('Higiene'),
('Automotivo'),
('Acessórios'),
('Tecnologia'),
('Saúde'),
('Casa'),
('Pet');


INSERT INTO Produto (Nome_Produto, Preco, ID_Categoria, Estoque) VALUES
('Smartphone', 1200.00, 1, 50),
('Camiseta', 50.00, 2, 200),
('Arroz', 25.00, 3, 100),
('Livro de Python', 80.00, 4, 150),
('Bola de Futebol', 70.00, 8, 120),
('Cadeira Gamer', 700.00, 6, 30),
('Shampoo', 15.00, 7, 300),
('Tênis', 120.00, 2, 100),
('Cerveja', 20.00, 3, 80),
('Cadeira de Escritório', 400.00, 6, 40),
('Playstation 5', 4500.00, 1, 20),
('Caixa de Som', 150.00, 1, 60),
('Cama', 800.00, 15, 25),
('Ração de Cão', 50.00, 15, 180),
('Mochila', 60.00, 2, 200);

-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (Nome_Cliente, Email, Telefone) VALUES
('João Silva', 'joao@email.com', '11987654321'),
('Maria Souza', 'maria@email.com', '11912345678'),
('Pedro Costa', 'pedro@email.com', '11876543210'),
('Ana Lima', 'ana@email.com', '11911223344'),
('Carlos Oliveira', 'carlos@email.com', '11999887766'),
('Julia Pereira', 'julia@email.com', '11887766554'),
('Lucas Santos', 'lucas@email.com', '11922334455'),
('Fernanda Gomes', 'fernanda@email.com', '11933445566'),
('Ricardo Silva', 'ricardo@email.com', '11899887766'),
('Rafaela Costa', 'rafaela@email.com', '11955667788'),
('Gabriel Almeida', 'gabriel@email.com', '11888899999'),
('Larissa Rocha', 'larissa@email.com', '11966778899'),
('Sofia Fernandes', 'sofia@email.com', '11912345679'),
('Felipe Martins', 'felipe@email.com', '11893456789'),
('Larissa Lima', 'larissa.lima@email.com', '11977665544');


INSERT INTO Endereco (ID_Cliente, Logradouro, Numero, Complemento, Bairro, Cidade, Estado, CEP) VALUES
(1, 'Rua A', '123', 'Apto 101', 'Centro', 'São Paulo', 'SP', '01001000'),
(2, 'Rua B', '456', 'Casa 2', 'Jardim Paulista', 'São Paulo', 'SP', '02002000'),
(3, 'Rua C', '789', 'Apto 202', 'Vila Mariana', 'São Paulo', 'SP', '03003000'),
(4, 'Rua D', '101', 'Casa 4', 'Itaim Bibi', 'São Paulo', 'SP', '04004000'),
(5, 'Rua E', '202', 'Casa 5', 'Bela Vista', 'São Paulo', 'SP', '05005000'),
(6, 'Rua F', '303', 'Apto 303', 'Morumbi', 'São Paulo', 'SP', '06006000'),
(7, 'Rua G', '404', 'Casa 7', 'Vila Progredior', 'São Paulo', 'SP', '07007000'),
(8, 'Rua H', '505', 'Casa 8', 'Vila Bertioga', 'São Paulo', 'SP', '08008000'),
(9, 'Rua I', '606', 'Apto 909', 'Vila Cordeiro', 'São Paulo', 'SP', '09009000'),
(10, 'Rua J', '707', 'Casa 10', 'Campo Belo', 'São Paulo', 'SP', '10010000'),
(11, 'Rua K', '808', 'Apto 11', 'Parque Industrial', 'São Paulo', 'SP', '11011000'),
(12, 'Rua L', '909', 'Casa 12', 'Vila Leopoldina', 'São Paulo', 'SP', '12012000'),
(13, 'Rua M', '1001', 'Apto 15', 'Vila Madalena', 'São Paulo', 'SP', '13013000'),
(14, 'Rua N', '1111', 'Casa 16', 'Pinheiros', 'São Paulo', 'SP', '14014000'),
(15, 'Rua O', '1212', 'Apto 17', 'Santo Amaro', 'São Paulo', 'SP', '15015000');


INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Mes_Venda, Total, ID_Endereco) VALUES
(1, '2024-01-05', 'Janeiro', 1500.00, 1),
(2, '2024-01-12', 'Janeiro', 800.00, 2),
(3, '2024-02-15', 'Fevereiro', 450.00, 3),
(4, '2024-03-22', 'Março', 2000.00, 4),
(5, '2024-03-25', 'Março', 1200.00, 5),
(6, '2024-04-10', 'Abril', 350.00, 6),
(7, '2024-05-02', 'Maio', 1400.00, 7),
(8, '2024-06-20', 'Junho', 2300.00, 8),
(9, '2024-07-05', 'Julho', 900.00, 9),
(10, '2024-08-11', 'Agosto', 1800.00, 10),
(11, '2024-09-01', 'Setembro', 500.00, 11),
(12, '2024-10-15', 'Outubro', 1200.00, 12),
(13, '2024-11-20', 'Novembro', 1500.00, 13),
(14, '2024-12-25', 'Dezembro', 3000.00, 14),
(15, '2024-12-29', 'Dezembro', 4500.00, 15);


INSERT INTO Itens_Pedidos (ID_Pedido, ID_Produto, Quantidade, Preco_Unitario) VALUES
(1, 1, 2, 1200.00),
(1, 3, 10, 25.00),
(2, 2, 4, 50.00),
(2, 7, 5, 15.00),
(3, 8, 3, 70.00),
(3, 9, 1, 20.00),
(4, 5, 2, 70.00),
(4, 10, 5, 400.00),
(5, 12, 1, 4500.00),
(6, 1, 1, 1200.00),
(6, 13, 2, 150.00),
(7, 4, 3, 80.00),
(8, 6, 3, 700.00),
(9, 11, 1, 1800.00),
(10, 14, 1, 800.00);


INSERT INTO Forma_Pagamento (Descricao) VALUES
('Cartão de Crédito'),
('Boleto'),
('Pix'),
('Débito'),
('Transferência');


INSERT INTO Historico_Pagamento (ID_Pedido, ID_Forma_Pagamento, Data_Pagamento, Valor_Pago) VALUES
(1, 1, '2024-01-05 12:30:00', 1500.00),
(2, 2, '2024-01-12 10:20:00', 800.00),
(3, 3, '2024-02-15 16:00:00', 450.00),
(4, 4, '2024-03-22 18:00:00', 2000.00),
(5, 5, '2024-03-25 14:10:00', 1200.00),
(6, 1, '2024-04-10 09:00:00', 350.00),
(7, 2, '2024-05-02 13:45:00', 1400.00),
(8, 3, '2024-06-20 11:00:00', 2300.00),
(9, 4, '2024-07-05 08:30:00', 900.00),
(10, 5, '2024-08-11 19:00:00', 1800.00),
(11, 1, '2024-09-01 15:00:00', 500.00),
(12, 2, '2024-10-15 11:30:00', 1200.00),
(13, 3, '2024-11-20 14:00:00', 1500.00),
(14, 4, '2024-12-25 17:30:00', 3000.00),
(15, 5, '2024-12-29 20:00:00', 4500.00);


INSERT INTO Acompanhamento (Descricao) VALUES
('Pedido enviado'),
('Pedido em preparação'),
('Pedido entregue'),
('Aguardando pagamento'),
('Pagamento confirmado'),
('Em processo de envio'),
('Pedido cancelado'),
('Pedido a caminho'),
('Pedido recebido'),
('Produto substituído'),
('Produto danificado'),
('Entrega em andamento'),
('Pedido finalizado'),
('Pedido reembolsado'),
('Pedido aguardando aprovação');


INSERT INTO PedidoProdutoAcompanhamentos (ID_Item_Pedido, ID_Acompanhamento) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10),
(9, 11),
(10, 12),
(11, 13),
(12, 14),
(13, 15);

INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Mes_Venda, Total, ID_Endereco)
VALUES
(1, '2024-11-05', 'Novembro', 150.00, 1),
(2, '2024-11-10', 'Novembro', 200.00, 2),
(3, '2024-11-15', 'Novembro', 350.00, 3);

INSERT INTO Itens_Pedidos (ID_Pedido, ID_Produto, Quantidade, Preco_Unitario)
VALUES
(1, 1, 2, 50.00),
(1, 2, 1, 50.00),
(2, 1, 3, 60.00),
(3, 3, 1, 150.00);

INSERT INTO Forma_Pagamento (Descricao)
VALUES ('Cartão de Crédito'), ('Boleto Bancário'), ('Pix');

INSERT INTO Historico_Pagamento (ID_Pedido, ID_Forma_Pagamento, Data_Pagamento, Valor_Pago)
VALUES
(1, 1, '2024-11-05 14:00:00', 150.00),
(2, 2, '2024-11-10 16:30:00', 200.00),
(3, 3, '2024-11-15 18:45:00', 350.00);

INSERT INTO Clientes (Nome_Cliente, Email, Telefone)
VALUES ('João Silva', 'joao@example.com', '123456789'),
       ('Maria Souza', 'maria@example.com', '987654321');

INSERT INTO Endereco (ID_Cliente, Logradouro, Numero, Bairro, Cidade, Estado, CEP)
VALUES
(1, 'Rua A', '123', 'Centro', 'São Paulo', 'SP', '12345-678'),
(2, 'Rua B', '456', 'Jardim', 'Rio de Janeiro', 'RJ', '98765-432');

INSERT INTO Categoria (Nome_Categoria)
VALUES ('Eletrônicos'), ('Roupas'), ('Alimentos');

INSERT INTO Produto (Nome_Produto, Preco, ID_Categoria, Estoque)
VALUES
('Smartphone', 1200.00, 1, 50),
('Camiseta', 30.00, 2, 100),
('Arroz', 10.00, 3, 200);

INSERT INTO Acompanhamento (Descricao)
VALUES ('Em trânsito'), ('Entregue'), ('Cancelado');

INSERT INTO PedidoProdutoAcompanhamentos (ID_Item_Pedido, ID_Acompanhamento)
VALUES (1, 1), (2, 2), (3, 3);

/*os carai do inner join*/


SELECT p.Nome_Produto, SUM(ip.Quantidade) AS Total_Vendido -- Inner Join que mais vendeu foi o ARROZ
FROM Produto p
INNER JOIN Itens_Pedidos ip ON p.ID_Produto = ip.ID_Produto
GROUP BY p.Nome_Produto
ORDER BY Total_Vendido DESC
LIMIT 1;

SELECT p.Nome_Produto, SUM(ip.Quantidade) AS Total_Vendido --  Inner join que menos vendeu foi a cerveja;
FROM Produto p
INNER JOIN Itens_Pedidos ip ON p.ID_Produto = ip.ID_Produto
GROUP BY p.Nome_Produto
ORDER BY Total_Vendido ASC
LIMIT 1;

SELECT -- O mes que mais vendeu foi o mes 3 (Março) 
    EXTRACT(YEAR FROM p.Data_Pedido) AS Ano,
    EXTRACT(MONTH FROM p.Data_Pedido) AS Mes,
    SUM(ip.Quantidade * ip.Preco_Unitario) AS Total_Vendido
FROM Pedidos p
INNER JOIN Itens_Pedidos ip ON p.ID_Pedido = ip.ID_Pedido
GROUP BY Ano, Mes
ORDER BY Total_Vendido DESC
LIMIT 1;

SELECT f.Descricao AS Forma_Pagamento, COUNT(hp.ID_Historico_Pagamento) AS Quantidade_Usos -- Inner join de pagamento mais usado
FROM Historico_Pagamento hp
INNER JOIN Forma_Pagamento f ON hp.ID_Forma_Pagamento = f.ID_Forma_Pagamento
GROUP BY f.Descricao
ORDER BY Quantidade_Usos DESC
LIMIT 1;

SELECT e.Logradouro, e.Numero, e.Bairro, e.Cidade, e.Estado, e.CEP, COUNT(p.ID_Pedido) AS Quantidade_Entregas -- Inner join de endereço que teve mais entrega .
FROM Pedidos p
INNER JOIN Endereco e ON p.ID_Endereco = e.ID_Endereco
GROUP BY e.ID_Endereco
ORDER BY Quantidade_Entregas DESC
LIMIT 1;

SELECT p.ID_Pedido, COUNT(ip.ID_Item_Pedido) AS Quantidade_Produtos -- Inner joi de qual venda teve mais produtos
FROM Pedidos p
INNER JOIN Itens_Pedidos ip ON p.ID_Pedido = ip.ID_Pedido
GROUP BY p.ID_Pedido
ORDER BY Quantidade_Produtos DESC
LIMIT 1;

SELECT                                       -- Inner join de venda do mes atual por pagamento
    f.Descricao AS Forma_Pagamento,
    COUNT(hp.ID_Historico_Pagamento) AS Quantidade_Pagamentos,
    SUM(p.Total) AS Total_Vendas
FROM Pedidos p
INNER JOIN Historico_Pagamento hp ON p.ID_Pedido = hp.ID_Pedido
INNER JOIN Forma_Pagamento f ON hp.ID_Forma_Pagamento = f.ID_Forma_Pagamento
WHERE EXTRACT(MONTH FROM p.Data_Pedido) = EXTRACT(MONTH FROM CURRENT_DATE)
  AND EXTRACT(YEAR FROM p.Data_Pedido) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY f.Descricao
ORDER BY Total_Vendas DESC;

SELECT                                   -- INner join do mes anterior por pagamento
    f.Descricao AS Forma_Pagamento,
    COUNT(hp.ID_Historico_Pagamento) AS Quantidade_Pagamentos,
    SUM(p.Total) AS Total_Vendas
FROM Pedidos p
INNER JOIN Historico_Pagamento hp ON p.ID_Pedido = hp.ID_Pedido
INNER JOIN Forma_Pagamento f ON hp.ID_Forma_Pagamento = f.ID_Forma_Pagamento
WHERE EXTRACT(MONTH FROM p.Data_Pedido) = EXTRACT(MONTH FROM CURRENT_DATE) - 1
  AND EXTRACT(YEAR FROM p.Data_Pedido) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY f.Descricao
ORDER BY Total_Vendas DESC;




