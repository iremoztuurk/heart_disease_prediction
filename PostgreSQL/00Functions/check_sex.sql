-- DROP FUNCTION public.check_sex(int4);

CREATE OR REPLACE FUNCTION public.check_sex(input integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    s INTEGER;
BEGIN
    select sex into s FROM hasta_bilgi
    WHERE hasta_id = input;
    RETURN s;
END;
$function$
;