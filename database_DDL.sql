CREATE OR REPLACE function info_add_funct2()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    total_row INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_row FROM kalp;
    NEW.bilgi_id := total_row + 1;   
    return NEW;
END;
$$;


CREATE OR REPLACE TRIGGER info_add
BEFORE INSERT ON kalp
FOR EACH ROW
execute function info_add_funct2();

ALTER TABLE public.kalp ADD CONSTRAINT hasta_id_fk FOREIGN KEY (hasta_id) REFERENCES hasta_bilgi(hasta_id);

ALTER TABLE public.kalp ADD CONSTRAINT bilgi_id_pk PRIMARY KEY (bilgi_id);

ALTER TABLE public.hasta_bilgi ADD CONSTRAINT hasta_bil_pk PRIMARY KEY (hasta_id);

