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

