
---- INSERT INTO ADMIN 
insert into admin(admin_id, email, password)  
values('ad1234', 'jpcon45@gmail.com', '987654321');

select * from admin;

-----------------------------------------------------------------------------------

----- INSERT INTO Category
insert into category(category_id, category_name) 
values ('c1234', 'Electronics');
insert into category(category_id, category_name)
values ('c1230', 'Sports');

select * from category;

-----------------------------------------------------------------------------------

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
    'p12340',
    'Tennis Racket',
    'c1230',
    4200.00,
    'tennis.jpg',
    50
);
select * from product;

-----------------------------------------------------------------------------------

--INSERT INTO CUSTOMER TABLE
insert into customer
(
    user_id,
    user_name,
    email,
    password,
    address,
    contact_no,
    date_reg
)
values
(
    'u0001',
    'jpcastillo',
    'jeypismurf2019@gmail.com',
    'angel1234',
    'Sampaloc Manila',
    '09568571029',
    '03/Feb/2022'
);

insert into customer
(
    user_id,
    user_name,
    email,
    password,
    address,
    contact_no,
    date_reg
)
values
(
    'u0002',
    'jpcastillo2',
    'jeypismurf2020@gmail.com',
    'angel12345',
    'Tondo Manila',
    '09568571029',
    '04/Feb/2022'
);

insert into customer
(
    user_id,
    user_name,
    email,
    password,
    address,
    contact_no,
    date_reg
)
values
(
    'u0003',
    'jpcastillo3',
    'jeypismurf2021@gmail.com',
    'angel123456',
    'malvar Batangas',
    '09568571029',
    '05/Feb/2022'
);

insert into customer
(
    user_id,
    user_name,
    email,
    password,
    address,
    contact_no,
    date_reg
)
values
(
    'u0004',
    'jpcastillo4',
    'jeypismurf2022@gmail.com',
    'angel1234567',
    'Sampaloc Manila',
    '09568571029',
    '06/Feb/2022'
);

select * from customer;

-----------------------------------------------------------------------------------

--INSERT INTO CART TABLE
insert into cart(cart_id, user_id)
values ('cart001', 'u0001');

insert into cart(cart_id, user_id)
values ('cart002', 'u0002');

insert into cart(cart_id, user_id)
values ('cart003', 'u0003');

insert into cart(cart_id, user_id)
values ('cart004', 'u0004');

select * from cart;

-----------------------------------------------------------------------------------

--INSERT INTO COUPON TABLE
insert into coupon(coupon_id, coupon_name, discount_val, expiry_date)
values ('coupon001', 'discount10', '0.1', '03/Feb/2022');

insert into coupon(coupon_id, coupon_name, discount_val, expiry_date)
values ('coupon002', 'discount20', '0.2', '04/Feb/2022');

insert into coupon(coupon_id, coupon_name, discount_val, expiry_date)
values ('coupon003', 'discount30', '0.3', '05/Feb/2022');

insert into coupon(coupon_id, coupon_name, discount_val, expiry_date)
values ('coupon004', 'discount95', '95', '10/Feb/2022');

select * from coupon;

-----------------------------------------------------------------------------------

--INSERT INTO CART_ITEMS TABLE
insert into cart_items
(
    cart_item_id,
    cart_id,
    user_id,
    prod_id,
    product_qty
)
values
(
    'cid00001',
    'cart001',
    'u0001',
    'p12345',
    2
);

insert into cart_items
(
    cart_item_id,
    cart_id,
    user_id,
    prod_id,
    product_qty
)
values
(
    'cid00002',
    'cart002',
    'u0001',
    'p12340',
    2
);

insert into cart_items
(
    cart_item_id,
    cart_id,
    user_id,
    prod_id,
    product_qty
)
values
(
    'cid00003',
    'cart003',
    'u0002',
    'p12345',
    1
);

insert into cart_items
(
    cart_item_id,
    cart_id,
    user_id,
    prod_id,
    product_qty
)
values
(
    'cid00004',
    'cart004',
    'u0002',
    'p12340',
    1
);

insert into cart_items
(
    cart_item_id,
    cart_id,
    user_id,
    prod_id,
    product_qty
)
values
(
    'cid00005',
    'cart004',
    'u0003',
    'p12340',
    1
);

select * from cart_items;

-----------------------------------------------------------------------------------

--INSERT INTO ORDERS TABLE
insert into orders
(
    order_id,
    cart_id,
    user_id,
    order_date,
    delivery_date,
    coupon_id,
    bill_amount,
    payment_method
)
values
(
    'o0001',
    'cart001',
    'u0001',
    sysdate,
    sysdate +7,
    'coupon001',
    1000,
    'COD'
);

insert into orders
(
    order_id,
    cart_id,
    user_id,
    order_date,
    delivery_date,
    coupon_id,
    bill_amount,
    payment_method
)
values
(
    'o0002',
    'cart002',
    'u0003',
    sysdate,
    sysdate +7,
    'coupon002',
    1200,
    'COD'
);

insert into orders
(
    order_id,
    cart_id,
    user_id,
    order_date,
    delivery_date,
    coupon_id,
    bill_amount,
    payment_method
)
values
(
    'o0003',
    'cart003',
    'u0004',
    sysdate,
    sysdate +7,
    'coupon004',
    1500,
    'COD'
);


select* from orders;
