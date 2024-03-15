-- public.hasta_bilgi definition

-- Drop table

-- DROP TABLE public.hasta_bilgi;

CREATE TABLE public.hasta_bilgi (
	hasta_id int4 NOT NULL,
	age int4 NOT NULL,
	sex int4 NOT NULL,
	CONSTRAINT check_value_range_age CHECK (((age >= 0) AND (age <= 120))),
	CONSTRAINT check_value_range_sex CHECK (((sex >= 0) AND (sex <= 1))),
	CONSTRAINT hasta_bil_pk PRIMARY KEY (hasta_id)
);