DROP TABLE IF EXISTS public.date_dim CASCADE;

CREATE SEQUENCE IF NOT EXISTS date_key_seq;

CREATE TABLE public.date_dim (
	date_key int8 NOT NULL DEFAULT nextval('date_key_seq'),
	"date" timestamp NULL,
	CONSTRAINT date_dim_pk PRIMARY KEY (date_key)
);
