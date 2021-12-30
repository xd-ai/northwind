DROP TABLE IF EXISTS public.tmp CASCADE;

CREATE SEQUENCE IF NOT EXISTS tmp_key_seq;

CREATE TABLE public.tmp (
	tmp_key int8 NOT NULL DEFAULT nextval('tmp_key_seq'),
	order_id int8 NOT NULL,
	customer_id varchar NOT NULL,
	employee_id int8 NOT NULL,
	order_date timestamp NULL,
	required_date timestamp NULL,
	shipped_date timestamp NULL,
	ship_via varchar NULL,
	freight varchar NULL,
	ship_name varchar NULL,
	ship_address varchar NULL,
	ship_city varchar NULL,
	ship_region varchar NULL,
	ship_postal_code varchar NULL,
	ship_country varchar NULL,
	product_id int8 NOT NULL,
	unit_price varchar NULL,
	quantity varchar NULL,
	discount varchar NULL,
	CONSTRAINT tmp_pk PRIMARY KEY (tmp_key)
);
