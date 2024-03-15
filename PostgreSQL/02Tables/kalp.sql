-- public.kalp definition

-- Drop table

-- DROP TABLE public.kalp;

CREATE TABLE public.kalp (
	kalp_id int4 NOT NULL,
	cp int4 NOT NULL,
	trestbps int4 NOT NULL,
	chol int4 NOT NULL,
	fbs int4 NOT NULL,
	restecg int4 NOT NULL,
	thalach int4 NOT NULL,
	exang int4 NOT NULL,
	oldpeak float4 NOT NULL,
	slope int4 NOT NULL,
	ca int4 NOT NULL,
	thal int4 NOT NULL,
	target int4 NULL,
	hasta_id int4 NULL,
	CONSTRAINT check_value_range_ca CHECK (((ca >= 0) AND (ca <= 4))),
	CONSTRAINT check_value_range_chol CHECK (((chol >= 0) AND (chol <= 700))),
	CONSTRAINT check_value_range_cp CHECK (((cp >= 0) AND (cp <= 3))),
	CONSTRAINT check_value_range_exang CHECK (((exang >= 0) AND (exang <= 1))),
	CONSTRAINT check_value_range_fbs CHECK (((fbs >= 0) AND (fbs <= 1))),
	CONSTRAINT check_value_range_oldpeak CHECK (((oldpeak >= (0)::double precision) AND (oldpeak <= (7)::double precision))),
	CONSTRAINT check_value_range_restecg CHECK (((restecg >= 0) AND (restecg <= 2))),
	CONSTRAINT check_value_range_slope CHECK (((slope >= 0) AND (slope <= 2))),
	CONSTRAINT check_value_range_thal CHECK (((thal >= 0) AND (thal <= 3))),
	CONSTRAINT check_value_range_thalach CHECK (((thalach >= 0) AND (thalach <= 350))),
	CONSTRAINT check_value_range_trestbps CHECK (((trestbps >= 0) AND (trestbps <= 220))),
	CONSTRAINT kalp_id_pk PRIMARY KEY (kalp_id)
);
CREATE INDEX hasta_id_index ON public.kalp USING btree (hasta_id);

-- Table Triggers

create trigger info_add before
insert
    on
    public.kalp for each row execute function info_add_funct2();


-- public.kalp foreign keys

ALTER TABLE public.kalp ADD CONSTRAINT hasta_id_fk FOREIGN KEY (hasta_id) REFERENCES public.hasta_bilgi(hasta_id);