create trigger info_add before
insert
    on
    public.kalp for each row execute function info_add_funct2();