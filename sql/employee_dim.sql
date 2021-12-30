DROP TABLE IF EXISTS public.employee_dim CASCADE;

CREATE SEQUENCE IF NOT EXISTS employee_key_seq;

CREATE TABLE public.employee_dim (
	employee_key int8 NOT NULL DEFAULT nextval('employee_key_seq'),
	employee_id int8 NOT NULL,
	last_name varchar NULL,
	first_name varchar NULL,
	title varchar NULL,
	title_of_courtesy varchar NULL,
	birth_date timestamp NULL,
	hire_date timestamp NULL,
	address varchar NULL,
	city varchar NULL,
	region varchar NULL,
	postal_code varchar NULL,
	country varchar NULL,
	home_phone varchar NULL,
	"extension" varchar NULL,
	photo varchar NULL,
	notes varchar NULL,
	reports_to varchar NULL,
	photo_path varchar NULL,
	CONSTRAINT employee_dim_pk PRIMARY KEY (employee_key)
);
