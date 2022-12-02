SELECT * FROM demo.products;

Create View Composite_Index as
select productsName,productsPrice
from products;

EXPLAIN select productsName,productsPrice from Composite_Index;

create view ProductInfo as
select productsCode, productsName, productsPrice, productStatus
from products;

EXPLAIN select productsCode, productsName, productsPrice, productStatus from ProductInfo;

Drop view ProductInfo;