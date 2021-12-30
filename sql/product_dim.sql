DROP TABLE IF EXISTS public.product_dim CASCADE;

CREATE SEQUENCE IF NOT EXISTS product_key_seq;

CREATE TABLE public.product_dim (
	product_key int8 NOT NULL DEFAULT NEXTVAL('product_key_seq'),
	product_id int8 NOT NULL,
	product_name varchar NULL,
	quantity_per_unit varchar NULL,
	unit_price varchar NULL,
	units_in_stock int8 NULL,
	units_on_order int8 NULL,
	reorder_level varchar NULL,
	discontinued varchar NULL,
	category_id int8 NOT NULL,
	category_name varchar NULL,
	category_description varchar NULL,
	category_picture varchar NULL,
	supplier_id int8 NOT NULL,
	supplier_company_name varchar NULL,
	supplier_contact_name varchar NULL,
	supplier_contact_title varchar NULL,
	supplier_address varchar NULL,
	supplier_city varchar NULL,
	supplier_region varchar NULL,
	supplier_postal_code varchar NULL,
	supplier_country varchar NULL,
	supplier_phone varchar NULL,
	supplier_fax varchar NULL,
	supplier_homepage varchar NULL,
	CONSTRAINT product_dim_pk PRIMARY KEY (product_key)
);
