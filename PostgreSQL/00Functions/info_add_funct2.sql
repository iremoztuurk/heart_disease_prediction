-- DROP FUNCTION public.info_add_funct2();

CREATE OR REPLACE FUNCTION public.info_add_funct2()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    total_row INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_row FROM kalp;
    NEW.bilgi_id := total_row + 1;   
    return NEW;
END;
$function$
;