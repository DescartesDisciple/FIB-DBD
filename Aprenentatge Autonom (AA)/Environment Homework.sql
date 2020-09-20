-- -------------------------------------------------
-- PREGUNTA 1

select distinct e.nom_empl, d.edifici
from empleats e, departaments d
where e.num_dpt = d.num_dpt and e.num_dpt = 5
order by e.nom_empl asc

-- -------------------------------------------------
-- PREGUNTA 2

select distinct e.nom_empl, e.sou
from empleats e
where e.num_dpt = 1 or e.num_dpt = 2
order by e.nom_empl, e.sou

-- -------------------------------------------------
-- PREGUNTA 3

select distinct d.num_dpt, d.nom_dpt
fromempleats e, departaments d
where d.num_dpt = e.num_dpt
group by e.ciutat_empl, d.num_dpt, d.nom_dpt
having count(*) >= 2 

-- -------------------------------------------------
-- PREGUNTA 4

select d.num_dpt, d.nom_dpt
from departaments d
where not exists (select * drom empleats e where e.num_dpt = d.num_dpt and e.ciutat_empl = 'MADRID')
order by d.nom_dpt
