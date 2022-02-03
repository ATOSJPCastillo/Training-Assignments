---- CREATING CUSTOMER TABLE
create table customer
(
user_id varchar2(10) constraint pk_user_id primary key,
user_name varchar2(50),
email varchar(50) unique,
password varchar2(50) unique,
address varchar2(100),
contact_no varchar2(20),
date_reg date
);

-----------------------------------------------------------------------------------
---- CREATING ADMIN TABLE
create table admin
(
admin_id varchar2(10) constraint pk_admin_id primary key,
email varchar2(50) unique,
password varchar2(50) unique
);

-----------------------------------------------------------------------------------
---- CREATING CATEGORY TABLE
create table category
(
category_id varchar2(40) constraint pk_cat_id primary key,
category_name varchar2(50)
);

-----------------------------------------------------------------------------------
---- CREATING PRODUCT TABLE
create table product
(
prod_id varchar2(50) constraint pk_prd_id primary key,
prod_name varchar2(50),
category_id varchar2(40) references category(category_id),
prod_price number(20,2),
prod_img varchar2(30),
prod_avail_qty number(5)
);

-----------------------------------------------------------------------------------
---- CREATING CART TABLE
create table cart
(
cart_id varchar2(50) constraint pk_cart_id primary key,
user_id varchar2(10) references customer(user_id)
);

-----------------------------------------------------------------------------------
---- CREATING COUPON TABLE
create table coupon
(
coupon_id varchar2(50) constraint pk_coup_id primary key,
coupon_name varchar2(50),
discount_val number(20,2),
expiry_date date
);

-----------------------------------------------------------------------------------
---- CREATING CART_ITEMS TABLE
create table cart_items
(
cart_item_id varchar2(20) constraint pk_cart_item_id primary key ,
cart_id varchar2(20) not null, 
user_id varchar2(20) not null, 
prod_id varchar2(20) not null, 
product_qty number(20),
constraint fk_cart_to_cart_items foreign key (cart_id) references cart(cart_id), 
constraint fk_cust_to_cart_items foreign key (user_id) references customer(user_id), 
constraint fk_prod_to_cart_items foreign key (prod_id) references product(prod_id)
);

-----------------------------------------------------------------------------------
---- CREATING ORDERS TABLE
create table orders
(
order_id varchar2(20) constraint pk_order_id primary key,
cart_id varchar2(20) not null, 
user_id varchar2(20) not null, 
order_date date DEFAULT sysdate, 
delivery_date date default sysdate + 7, 
coupon_id varchar2(20) not null, 
bill_amount number(12,2), 
payment_method varchar2(20),
constraint fk_cart_to_order foreign key (cart_id) references cart(cart_id), 
constraint fk_cust_to_order foreign key (user_id) references customer(user_id), 
constraint fk_coupon_order foreign key (coupon_id) references coupon(coupon_id), 
constraint ck_pay_meth check(payment_method in ('COD', 'CREDIT', 'DEBIT', 'E-WALLET'))
);