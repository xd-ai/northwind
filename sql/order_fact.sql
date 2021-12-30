DROP TABLE IF EXISTS public.order_fact CASCADE;

CREATE TABLE public.order_fact (
	product_key int8 NOT NULL,
	customer_key int8 NOT NULL,
	employee_key int8 NOT NULL,
	order_date_key int8 NOT NULL,
	required_date_key int8 NOT NULL,
	shipped_date_key int8 NOT NULL,
	order_id int8 NULL,
	unit_price varchar NULL,
	quantity varchar NULL,
	discount varchar NULL,
	ship_via varchar NULL,
	freight varchar NULL,
	ship_name varchar NULL,
	ship_address varchar NULL,
	ship_city varchar NULL,
	ship_region varchar NULL,
	ship_postal_code varchar NULL,
	ship_country varchar NULL,
	CONSTRAINT order_fact_pk PRIMARY KEY (product_key, customer_key, employee_key, order_date_key, required_date_key, shipped_date_key),
	CONSTRAINT order_fact_fk FOREIGN KEY (customer_key) REFERENCES public.customer_dim(customer_key),
	CONSTRAINT order_fact_fk_1 FOREIGN KEY (product_key) REFERENCES public.product_dim(product_key),
	CONSTRAINT order_fact_fk_2 FOREIGN KEY (employee_key) REFERENCES public.employee_dim(employee_key),
	CONSTRAINT order_fact_fk_3 FOREIGN KEY (order_date_key) REFERENCES public.date_dim(date_key),
	CONSTRAINT order_fact_fk_4 FOREIGN KEY (required_date_key) REFERENCES public.date_dim(date_key),
	CONSTRAINT order_fact_fk_5 FOREIGN KEY (shipped_date_key) REFERENCES public.date_dim(date_key)
);
