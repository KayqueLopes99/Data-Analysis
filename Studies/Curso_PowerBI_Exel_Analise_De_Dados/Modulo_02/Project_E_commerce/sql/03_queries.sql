-- Descrições -- Usadas para guiar.
DESC Product;
DESC Seller_Product;
DESC Seller;
DESC Product_Stock_Relation;
DESC Stock;
DESC Customer;
DESC `Order`;
DESC Payment;
DESC Delivery;
DESC Supplier;
DESC Supplier_Product;
DESC Product_Order_Relation;


/* 
================================================================================
Este script contém as 7 queries exigidas e contempla todos os requisitos:
1. Recuperações simples com SELECT Statement
2. Filtros com WHERE Statement
3. Expressões para gerar atributos derivados
4. Ordenações dos dados com ORDER BY
5. Condições de filtros aos grupos – HAVING Statement
6. Junções entre tabelas (JOINs) para fornecer uma perspectiva mais complexa
================================================================================
*/

-- E se quiser rodar um comando para imprimir a confirmação na tela:
SELECT 'Todos os requisitos (SELECT, WHERE, HAVING, JOINs, Atributos Derivados, ORDER BY) foram aplicados com sucesso nas 7 queries acima!' AS Status_Projeto;


-- PERGUNTA 1: Qual é o histórico de compras detalhado de cada cliente?
SELECT 
    IFNULL(C.companyName, CONCAT(C.firstName, ' ', middleName , ' ', C.lastName)) AS Nome_Cliente,
    C.clientType AS Tipo_Cliente,
    O.idOrder AS Numero_Pedido,
    O.statusOrder AS Status_Pedido,
    P.productName AS Produto_Comprado,
    POR.quantity AS Quantidade
FROM Customer C
JOIN `Order` O ON C.idCustomer = O.customer_idCustomer
JOIN Product_Order_Relation POR ON O.idOrder = POR.order_idOrder
JOIN Product P ON POR.product_idProduct = P.idProduct
ORDER BY Nome_Cliente ASC, O.idOrder;

-- PERGUNTA 2: Qual é o histórico de transações financeiras e pagamentos dos pedidos?
SELECT 
    P.idPayment AS ID_Transacao,
    IFNULL(C.companyName, CONCAT(C.firstName, ' ', C.lastName)) AS Nome_Cliente,
    O.idOrder AS Pedido,
    P.paymentMethod AS Metodo_Pagamento,
    P.amount AS Valor_Pago,
    DATE_FORMAT(P.paymentDate, '%d/%m/%Y %H:%i') AS Data_Pagamento
FROM Payment P
JOIN `Order` O ON P.order_idOrder = O.idOrder
JOIN Customer C ON O.customer_idCustomer = C.idCustomer
WHERE O.statusOrder != 'Canceled'
ORDER BY P.paymentDate DESC;



-- PERGUNTA 3: Qual é o valor total de cada item no pedido (Cálculo do Preço * Quantidade)?

SELECT 
    POR.order_idOrder AS Pedido,
    P.productName AS Produto,
    P.price AS Preco_Unitario,
    POR.quantity AS Quantidade_Comprada,
    (P.price * POR.quantity) AS Subtotal_Item
FROM Product_Order_Relation POR
JOIN Product P ON POR.product_idProduct = P.idProduct
ORDER BY Pedido ASC, Subtotal_Item DESC;


-- PERGUNTA 4: Qual é a comparação de receita (faturamento total) entre clientes B2B (PJ) e B2C (PF)?
SELECT 
    C.clientType AS Tipo_de_Cliente,
    COUNT(DISTINCT C.idCustomer) AS Total_de_Clientes_Compradores,
    COUNT(O.idOrder) AS Total_de_Pedidos,
    SUM(P.amount) AS Faturamento_Total 
FROM Customer C
JOIN `Order` O ON C.idCustomer = O.customer_idCustomer
JOIN Payment P ON O.idOrder = P.order_idOrder
GROUP BY C.clientType 
ORDER BY Faturamento_Total DESC;



-- PERGUNTA 5: Quais são os produtos mais vendidos baseados na quantidade comprada?
SELECT 
    P.idProduct AS Codigo_Produto,
    P.productName AS Produto,
    P.category AS Categoria,
    SUM(POR.quantity) AS Total_Unidades_Vendidas
FROM Product P
JOIN Product_Order_Relation POR ON P.idProduct = POR.product_idProduct
GROUP BY P.idProduct, P.productName, P.category
HAVING Total_Unidades_Vendidas >= 2
ORDER BY Total_Unidades_Vendidas DESC;



-- PERGUNTA 6 Como está o panorama geral de Estoque, Fornecimento e Produtos?
SELECT 
    P.productName AS Produto,
    S.companyName AS Fornecedor_Principal,
    STK.location AS Local_de_Estoque,
    PSR.quantity AS Quantidade_em_Estoque
FROM Product P
JOIN Supplier_Product SP ON P.idProduct = SP.product_idProduct
JOIN Supplier S ON SP.supplier_idSupplier = S.idSupplier
JOIN Product_Stock_Relation PSR ON P.idProduct = PSR.product_idProduct
JOIN Stock STK ON PSR.stock_idStock = STK.idStock
ORDER BY P.productName ASC, Quantidade_em_Estoque DESC;



-- PERGUNTA 7: De que forma podemos visualizar todas as informações detalhadas dos produtos disponíveis, incluindo o nome do vendedor?

SELECT 
    P.productName AS Produto,
    S.companyName AS Vendedor,
    P.category AS Categoria,
    P.productDescription AS Descricao,
    P.product_rating AS Avaliacao_Estrelas,
    P.price AS Preco_Atual,
    SP.quantity AS Estoque_Disponivel
FROM Product P
JOIN Seller_Product SP ON P.idProduct = SP.product_idProduct
JOIN Seller S ON SP.seller_idSeller = S.idSeller
WHERE SP.quantity > 0 
ORDER BY P.category ASC, Estoque_Disponivel DESC;

-- PERGUNTA Extra do desafio: Algum vendedor do nosso marketplace também é um dos nossos fornecedores?
SELECT 
    S.companyName AS Fornecedor,
    SE.companyName AS Vendedor,
    IFNULL(S.cnpj, S.cpf) AS CNPJ_CPF_Em_Comum
FROM Supplier S
JOIN Seller SE ON S.cnpj = SE.cnpj OR S.cpf = SE.cpf;