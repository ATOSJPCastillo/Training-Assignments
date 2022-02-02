
---- INSERT INTO ADMIN 
insert into 
admin(admin_id, email, password)  values('ad1234', 'jpcon45@gmail.com', '987654321');

select * from admin;

----- INSERT INTO Category
insert into 
category(category_id, category_name) values ('c1234', 'Electronics');

select * from category;

---- INSERT INTO PRODUCT
insert into product
(
    prod_id,
    prod_name,
    category_id,
    prod_price,
    prod_img,
    prod_avail_qty
) 
values 
(
    'p12345',
    'Monitor',
    'c1234',
    14200.00,
    'monitor.jpg',
    51
);
select * from product;

