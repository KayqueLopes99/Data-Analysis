-- Criação do banco e tabelas (DDL)
-- Projeto - E-commerce - Banco de dados
CREATE DATABASE IF NOT EXISTS e_commerceDataBase;
USE e_commerceDataBase;

-- 1. Criação das Tabelas Principais
CREATE TABLE IF NOT EXISTS Customer (
    idCustomer INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    clientType ENUM('PF', 'PJ') NOT NULL, -- Define se é Física ou Jurídica
    email VARCHAR(100) NOT NULL, 
    phone VARCHAR(20) NOT NULL, 
    address VARCHAR(45) NOT NULL,
    
    -- Pessoa Física
    firstName VARCHAR(25),
    middleName VARCHAR(3),
    lastName VARCHAR(45),
    cpf CHAR(11),
    birthDate DATE,
    
    -- Pessoa Jurídica
    companyName VARCHAR(100),
    cnpj CHAR(18),
    
    
    CONSTRAINT unique_email_customer UNIQUE (email),
    CONSTRAINT unique_cpf_customer UNIQUE (cpf),
    CONSTRAINT unique_cnpj_customer UNIQUE (cnpj),
    
    
    CONSTRAINT chk_customer_type CHECK (
        (clientType = 'PF' AND cpf IS NOT NULL AND firstName IS NOT NULL AND cnpj IS NULL AND companyName IS NULL) 
        OR 
        (clientType = 'PJ' AND cnpj IS NOT NULL AND companyName IS NOT NULL AND cpf IS NULL AND firstName IS NULL)
    )
);


CREATE TABLE IF NOT EXISTS Product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    productName VARCHAR(100) NOT NULL,
    category ENUM(
        'Electronics', 
        'Clothing', 
        'Home and Kitchen', 
        'Books', 
        'Sports and Outdoors', 
        'Beauty and Personal Care', 
        'Toys and Games', 
        'Automotive', 
        'Health and Household', 
        'Grocery'
    ) NOT NULL,
    product_rating TINYINT NOT NULL DEFAULT 0,
    productDescription TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Order` (
    idOrder INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    statusOrder ENUM('Pending', 'Approved', 'Canceled') NOT NULL DEFAULT 'Pending', 
    orderPaid BOOLEAN NOT NULL DEFAULT FALSE,
    orderDescription TEXT NOT NULL,
    shippingFee DECIMAL(10,2) NOT NULL DEFAULT 10.00, -- Ajustado para DECIMAL
    customer_idCustomer INT NOT NULL,
    
    FOREIGN KEY (customer_idCustomer) REFERENCES Customer(idCustomer)
);

CREATE TABLE IF NOT EXISTS Payment (
    idPayment INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    order_idOrder INT NOT NULL, -- FK apontando para o Pedido
    amount DECIMAL(10,2) NOT NULL,
    paymentMethod ENUM('Credit Card', 'Debit Card', 'Pix', 'Bank Slip') NOT NULL,
    paymentDate DATETIME NOT NULL,
    
    FOREIGN KEY (order_idOrder) REFERENCES `Order`(idOrder)
);


CREATE TABLE IF NOT EXISTS Delivery (
    idDelivery INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    trackingCode VARCHAR(50) NOT NULL UNIQUE,
    statusDelivery ENUM('Preparing', 'Dispatched', 'In Transit', 'Delivered') NOT NULL DEFAULT 'Preparing', -- Status exclusivo da entrega
    order_idOrder INT NOT NULL, 
    
    FOREIGN KEY (order_idOrder) REFERENCES `Order`(idOrder)
);




CREATE TABLE IF NOT EXISTS Supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    companyName VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL, 
    phone VARCHAR(20) NOT NULL,
    cnpj CHAR(18),
    cpf CHAR(11),
    CONSTRAINT unique_cpf_supplier UNIQUE (cpf),
    CONSTRAINT unique_cnpj_supplier UNIQUE (cnpj),
    CONSTRAINT unique_companyName_supplier UNIQUE (companyName),
    CONSTRAINT unique_email_supplier UNIQUE (email)
);


CREATE TABLE IF NOT EXISTS Seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    companyName VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL, 
    phone VARCHAR(20) NOT NULL,
    cnpj CHAR(18),
    cpf CHAR(11),  
    
    CONSTRAINT unique_cpf_seller UNIQUE (cpf),
    CONSTRAINT unique_cnpj_seller UNIQUE (cnpj), -- Adicionado o UNIQUE que faltava
    CONSTRAINT unique_companyName_seller UNIQUE (companyName),
    CONSTRAINT unique_email_seller UNIQUE (email) -- E-mail único
);

CREATE TABLE IF NOT EXISTS Stock (
    idStock INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Product_Order_Relation (
    order_idOrder INT NOT NULL,
    product_idProduct INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    quantityStatus ENUM('Available', 'Unavailable') NOT NULL,
        
    PRIMARY KEY (order_idOrder, product_idProduct),
    FOREIGN KEY (order_idOrder) REFERENCES `Order`(idOrder),
    FOREIGN KEY (product_idProduct) REFERENCES Product(idProduct)
);


CREATE TABLE IF NOT EXISTS Seller_Product (
    seller_idSeller INT NOT NULL,
    product_idProduct INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    PRIMARY KEY (seller_idSeller, product_idProduct),
    FOREIGN KEY (seller_idSeller) REFERENCES Seller(idSeller),
    FOREIGN KEY (product_idProduct) REFERENCES Product(idProduct)
);


CREATE TABLE IF NOT EXISTS Supplier_Product (
    product_idProduct INT NOT NULL,
    supplier_idSupplier INT NOT NULL,
    PRIMARY KEY (product_idProduct, supplier_idSupplier),
    FOREIGN KEY (product_idProduct) REFERENCES Product(idProduct),
    FOREIGN KEY (supplier_idSupplier) REFERENCES Supplier(idSupplier)
);


CREATE TABLE IF NOT EXISTS Product_Stock_Relation (
    product_idProduct INT NOT NULL,
    stock_idStock INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    PRIMARY KEY (product_idProduct, stock_idStock),
    FOREIGN KEY (product_idProduct) REFERENCES Product(idProduct),
    FOREIGN KEY (stock_idStock) REFERENCES Stock(idStock)
);
