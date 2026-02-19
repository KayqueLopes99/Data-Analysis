-- Scripts de Inserção de Dados
-- -----------------------------------------------------
-- 1. Inserções na Tabela Customer
-- Misturando clientes Pessoa Física (PF) e Jurídica (PJ)
-- -----------------------------------------------------
INSERT INTO Customer (clientType, email, phone, address, firstName, middleName, lastName, cpf, birthDate, companyName, cnpj) VALUES
('PF', 'joao.silva@email.com', '11999999999', 'Rua das Flores, 123', 'João', 'M', 'Silva', '11111111111', '1990-05-15', NULL, NULL),
('PF', 'maria.souza@email.com', '11888888888', 'Av Paulista, 1000', 'Maria', 'S', 'Souza', '22222222222', '1985-08-22', NULL, NULL),
('PF', 'pedro.santos@email.com', '11777777777', 'Rua Augusta, 456', 'Pedro', 'H', 'Santos', '33333333333', '1992-11-10', NULL, NULL),
('PF', 'ana.costa@email.com', '11666666666', 'Rua B, 78', 'Ana', 'C', 'Costa', '44444444444', '1998-02-01', NULL, NULL),
('PJ', 'contato@techsolutions.com', '11555555555', 'Av Faria Lima, 3000', NULL, NULL, NULL, NULL, NULL, 'Tech Solutions LTDA', '11111111000111'),
('PJ', 'vendas@livrariacentral.com', '11444444444', 'Rua do Centro, 10', NULL, NULL, NULL, NULL, NULL, 'Livraria Central ME', '22222222000122'),
('PJ', 'suporte@supermercadoz.com', '11333333333', 'Av Brasil, 500', NULL, NULL, NULL, NULL, NULL, 'Supermercado Z S.A.', '33333333000133');


-- -----------------------------------------------------
-- 2. Inserções na Tabela Product
-- -----------------------------------------------------
INSERT INTO Product (productName, category, product_rating, productDescription, price) VALUES
('Smartphone Galaxy Z', 'Electronics', 5, 'Smartphone dobrável de última geração com 256GB.', 4599.99),
('Camiseta Algodão Básica', 'Clothing', 4, 'Camiseta 100% algodão, cor preta.', 49.90),
('Cafeteira Expresso', 'Home and Kitchen', 5, 'Cafeteira elétrica 15 bar de pressão.', 350.00),
('O Senhor dos Anéis', 'Books', 5, 'Volume único, capa dura.', 120.50),
('Bola de Futebol Oficial', 'Sports and Outdoors', 4, 'Bola de campo em couro sintético.', 89.90),
('Shampoo Hidratante 500ml', 'Beauty and Personal Care', 3, 'Shampoo para cabelos secos e danificados.', 25.90),
('Lego Star Wars', 'Toys and Games', 5, 'Nave Millennium Falcon, 1500 peças.', 850.00);


-- -----------------------------------------------------
-- 3. Inserções na Tabela Order
-- -----------------------------------------------------
INSERT INTO `Order` (statusOrder, orderPaid, orderDescription, shippingFee, customer_idCustomer) VALUES
('Approved', TRUE, 'Compra de eletrônico via App', 15.00, 1),
('Pending', FALSE, 'Compra de roupas para presente', 10.00, 2),
('Canceled', FALSE, 'Cliente desistiu antes do envio', 20.00, 3),
('Approved', TRUE, 'Livro para estudos', 0.00, 4), 
('Approved', TRUE, 'Equipamentos para o escritório', 50.00, 5),
('Pending', FALSE, 'Itens de perfumaria', 12.50, 6),
('Approved', TRUE, 'Brinquedo de aniversário', 35.00, 7);


-- -----------------------------------------------------
-- 4. Inserções na Tabela Payment
-- -----------------------------------------------------
INSERT INTO Payment (order_idOrder, amount, paymentMethod, paymentDate) VALUES
(1, 4614.99, 'Credit Card', '2023-10-01 10:15:00'),
(2, 59.90, 'Bank Slip', '2023-10-02 14:30:00'),
(3, 370.00, 'Pix', '2023-10-03 09:45:00'),
(4, 120.50, 'Credit Card', '2023-10-04 11:20:00'),
(5, 139.80, 'Bank Slip', '2023-10-05 16:10:00'),
(6, 38.40, 'Pix', '2023-10-06 08:05:00'),
(7, 885.00, 'Debit Card', '2023-10-07 19:55:00');


-- -----------------------------------------------------
-- 5. Inserções na Tabela Delivery
-- -----------------------------------------------------
INSERT INTO Delivery (trackingCode, statusDelivery, order_idOrder) VALUES
('BR123456789BR', 'Delivered', 1),
('BR987654321BR', 'Preparing', 2),
('BR555555555BR', 'Preparing', 3),
('BR111111111BR', 'In Transit', 4),
('BR222222222BR', 'Dispatched', 5),
('BR333333333BR', 'Preparing', 6),
('BR444444444BR', 'Delivered', 7);


-- -----------------------------------------------------
-- 6. Inserções na Tabela Supplier
-- -----------------------------------------------------
INSERT INTO Supplier (companyName, email, phone, cnpj, cpf) VALUES
('Distribuidora Eletro', 'contato@disteletro.com', '11110000', '10000000000101', NULL),
('Malhas e Fios S.A', 'vendas@malhasfios.com', '22220000', '20000000000102', NULL),
('Editora Leitura', 'comercial@leitura.com', '33330000', '30000000000103', NULL),
('Esportes Total', 'atacado@esportestotal.com', '44440000', '40000000000104', NULL),
('Cosméticos Bella', 'sac@bellacosmeticos.com', '55550000', '50000000000105', NULL),
('Artesanato do João', 'joao.artes@email.com', '66660000', NULL, '10101010101'),
('Brinquedos Criativos', 'contato@brincriativo.com', '77770000', '70000000000107', NULL);


-- -----------------------------------------------------
-- 7. Inserções na Tabela Seller
-- -----------------------------------------------------
INSERT INTO Seller (companyName, location, email, phone, cnpj, cpf) VALUES
('Mega Store SP', 'São Paulo - SP', 'vendas@megastore.com', '1188887777', '60000000000106', NULL),
('Boutique RJ', 'Rio de Janeiro - RJ', 'loja@boutiquerj.com', '2199998888', '80000000000108', NULL),
('Livraria do Estudante', 'Curitiba - PR', 'contato@livrariaest.com', '4133332222', '90000000000109', NULL),
('Esporte & Cia', 'Belo Horizonte - MG', 'vendas@esportecia.com', '3122221111', '11000000000110', NULL),
('Beleza Web Shop', 'Salvador - BA', 'sac@belezaweb.com', '7144445555', '12000000000112', NULL),
('Carlos Imports', 'Florianópolis - SC', 'carlos.imports@email.com', '4855556666', NULL, '20202020202'),
('Toy Box Center', 'Porto Alegre - RS', 'vendas@toybox.com', '5166667777', '13000000000113', NULL);


-- -----------------------------------------------------
-- 8. Inserções na Tabela Stock
-- -----------------------------------------------------
INSERT INTO Stock (location) VALUES
('Galpão Principal - SP'),
('Centro de Distribuição - RJ'),
('Armazém Secundário - MG'),
('CD Nordeste - BA'),
('CD Sul - PR'),
('Loja Física Matriz - SP'),
('Loja Física Filial - RJ');


-- -----------------------------------------------------
-- 9. Inserções na Tabela Product_Order_Relation
-- -----------------------------------------------------
INSERT INTO Product_Order_Relation (order_idOrder, product_idProduct, quantity, quantityStatus) VALUES
(1, 1, 1, 'Available'),
(2, 2, 2, 'Available'),
(3, 3, 1, 'Unavailable'),
(4, 4, 3, 'Available'),
(5, 5, 10, 'Available'),
(6, 6, 5, 'Available'),
(7, 7, 1, 'Available');


-- -----------------------------------------------------
-- 10. Inserções na Tabela Seller_Product
-- -----------------------------------------------------
INSERT INTO Seller_Product (seller_idSeller, product_idProduct, quantity) VALUES
(1, 1, 15),
(2, 2, 100),
(3, 4, 50),
(4, 5, 30),
(5, 6, 200),
(6, 3, 10),
(7, 7, 25);


-- -----------------------------------------------------
-- 11. Inserções na Tabela Supplier_Product
-- -----------------------------------------------------
INSERT INTO Supplier_Product (product_idProduct, supplier_idSupplier) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 4),
(6, 5),
(7, 7);


-- -----------------------------------------------------
-- 12. Inserções na Tabela Product_Stock_Relation
-- -----------------------------------------------------
INSERT INTO Product_Stock_Relation (product_idProduct, stock_idStock, quantity) VALUES
(1, 1, 50),
(2, 2, 300),
(3, 3, 40),
(4, 1, 150),
(5, 4, 80),
(6, 5, 400),
(7, 1, 60);