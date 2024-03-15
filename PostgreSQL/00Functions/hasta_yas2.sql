-- DROP FUNCTION public.hasta_yas2(int4, int4);

CREATE OR REPLACE FUNCTION public.hasta_yas2(id integer, agenum integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    yas INTEGER;
BEGIN
    SELECT age INTO yas FROM public.hasta_bilgi
    WHERE hasta_id = id;

    IF agenum > yas THEN
        UPDATE public.hasta_bilgi
        SET age = agenum
        WHERE hasta_id = id;
        yas := agenum;
    END IF;

    RETURN yas;
END;
$function$
;