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

-- ADD TRIGGER TO AUTOMATICALLY GENERATE THE USER ID
create sequence auto_increment_user_id;

create trigger trg_auto_user_id 
before insert on customer
for each row

begin
select 'U'||trim(to_char(auto_increment_user_id.nextval, '00099'))
into :new.user_id
from dual;
end;

-----------------------------------------------------------------------------------
---- CREATING ADMIN TABLE
create table admin
(
admin_id varchar2(10) constraint pk_admin_id primary key,
email varchar2(50) unique,
password varchar2(50) unique
);

-- ADD TRIGGER TO AUTOMATICALLY GENERATE THE ADMIN ID
create sequence auto_increment_admin_id;

create trigger trg_auto_admin_id 
       before insert on admin
       for each row
begin
   select 'U'||trim(to_char(auto_increment_adminn_id.nextval, '00099'))
         into :new.admin_id
         from dual;
end;

-----------------------------------------------------------------------------------
---- CREATING CATEGORY TABLE
create table category
(
category_id varchar2(40) constraint pk_cat_id primary key,
category_name varchar2(50)
);

-- ADD TRIGGER TO AUTOMATICALLY GENERATE THE CATEGORY ID
create sequence auto_increment_cat_id;

create trigger trg_auto_cat_id 
       before insert on category
       for each row
begin
   select 'U'||trim(to_char(auto_increment_cat_id.nextval, '00099'))
         into :new.CATEGORY_ID
         from dual;
end;

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

-- ADD TRIGGER TO AUTOMATICALLY GENERATE THE PRODUCT_ID
create sequence auto_increment_prod_id;

create trigger trg_auto_prod_id 
       before insert on product
       for each row
begin
   select 'U'||trim(to_char(auto_increment_prod_id.nextval, '00099'))
         into :new.prod_id
         from dual;
end;

-----------------------------------------------------------------------------------
---- CREATING CART TABLE
create table cart
(
cart_id varchar2(50) constraint pk_cart_id primary key,
user_id varchar2(10) references customer(user_id)
);

-- ADD TRIGGER TO AUTOMATICALLY GENERATE THE CART_ID
create sequence auto_increment_cart_id;

create trigger trg_auto_cart_id 
       before insert on cart
       for each row
begin
   select 'U'||trim(to_char(auto_increment_cart_id.nextval, '00099'))
         into :new.cart_id
         from dual;
end;

-----------------------------------------------------------------------------------
---- CREATING COUPON TABLE
create table coupon
(
coupon_id varchar2(50) constraint pk_coup_id primary key,
coupon_name varchar2(50),
discount_val number(20,2),
expiry_date date
);

-- ADD TRIGGER TO AUTOMATICALLY GENERATE THE COUPON_ID
create sequence auto_increment_coupon_id;

create trigger trg_auto_coupon_id 
       before insert on coupon
       for each row
begin
   select 'U'||trim(to_char(auto_increment_coupon_id.nextval, '00099'))
         into :new.coupon_id
         from dual;
end;

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


-- ADD TRIGGER TO AUTOMATICALLY GENERATE THE CART_ID
create sequence cart_items_id_seq;

create or replace trigger cart_items_tgr
    before insert
    on cart_items
    referencing new as new old as old
    for each row
begin
    if :new.cart_item_id is null then
        select 'CI'||to_char(cart_items_id_seq.nextval,'0000000') into :new.cart_item_id from DUAL;
    end if;
end;

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
payment_method varchar2(2),
constraint fk_cart_to_order foreign key (cart_id) references cart(cart_id), 
constraint fk_cust_to_order foreign key (user_id) references customer(user_id), 
constraint fk_coupon_order foreign key (coupon_id) references coupon(coupon_id), 
constraint ck_pay_meth check(payment_method in ('COD', 'CREDIT', 'DEBIT', 'E-WALLET'))
);

-- ADD TRIGGER TO AUTOMATICALLY GENERATE THE ORDER_ID
create sequence orders_id_seq;

create or replace trigger order_tgr
    before insert
    on orders
    referencing new as new old as old
    for each row
begin
    if :new.order_id is null then
        select 'O'||to_char(orders_id_seq.nextval,'0000000') into :new.order_id from DUAL;
    end if;
end;