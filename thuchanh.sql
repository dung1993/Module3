SELECT * FROM classicmodels.customers;

select * from customers where customerName = 'Land of Toys Inc.';

alter table customers add index idx_customerName(customerName);

alter table customers add index idx_full_name(contactfirstName,contactlastName);

explain select * from customers where contactFirstName = 'Jean' or contactLastName = 'King';

alter table customers drop index idx_full_name;