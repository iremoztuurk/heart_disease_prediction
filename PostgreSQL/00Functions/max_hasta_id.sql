-- DROP FUNCTION public.max_hasta_id();

CREATE OR REPLACE FUNCTION public.max_hasta_id()
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    max_id INTEGER;
BEGIN
    SELECT MAX(hasta_id) INTO max_id FROM public.hasta_bilgi;
    RETURN max_id;
END;
$function$
;