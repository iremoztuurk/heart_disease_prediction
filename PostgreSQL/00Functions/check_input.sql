-- DROP FUNCTION public.check_input(int4);

CREATE OR REPLACE FUNCTION public.check_input(input integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    c INTEGER;
BEGIN
    SELECT CASE
        WHEN EXISTS (
            SELECT 1
            FROM hasta_bilgi
            WHERE hasta_id = input
        ) THEN 1
        ELSE 0
    END
    INTO c;

    RETURN c;
END;
$function$
;