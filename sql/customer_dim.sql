DROP TABLE IF EXISTS public.customer_dim CASCADE;

CREATE SEQUENCE IF NOT EXISTS customer_key_seq;

CREATE TABLE public.customer_dim (
	customer_key int8 NOT NULL DEFAULT NEXTVAL('customer_key_seq'),
	customer_id varchar NULL,
	company_name varchar NULL,
	contact_name varchar NULL,
	contact_title varchar NULL,
	address varchar NULL,
	city varchar NULL,
	region varchar NULL,
	postal_code varchar NULL,
	country varchar NULL,
	phone varchar NULL,
	fax varchar NULL,
	CONSTRAINT customer_dim_pk PRIMARY KEY (customer_key)
);
