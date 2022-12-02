SELECT * FROM classicmodels.customers;

CREATE VIEW customer_views AS

SELECT customerNumber, customerName, phone

FROM  customers;


-- cập nhật:

CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';

-- xóa view:

DROP VIEW customer_views;