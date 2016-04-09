INSERT INTO ava.data
    ("giorno","mese","anno")
SELECT
    date_part('day', day),
    date_part('month', day),
    date_part('year', day)
FROM
    generate_series('2001-01-01'::date, '2010-12-31'::date, '1 day') day;