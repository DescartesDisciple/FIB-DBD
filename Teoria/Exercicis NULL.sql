-- -------------------------------------------------
-- PREGUNTA 1

SELECT p.NUM_PROJ, SUM(e.SOU)
FROM PROJECTES p LEFT OUTER JOIN empleats e ON p.NUM_PROJ = e.NUM_PROJ
WHERE p.PRESSUPOST IS NULL
GROUP BY p.NUM_PROJ
ORDER BY p.NUM_PROJ

-- -------------------------------------------------
-- PREGUNTA 2

SELECT DISTINCT b.numLlicencia
FROM boletaires b, troballes t
WHERE b.nom = t.nom AND NOT EXISTS (SELECT * 
			  	FROM troballes t1 
					WHERE t.nom <> t1.nom AND (t.lloc = t1.lloc OR (t1.lloc IS NULL AND t.lloc IS NULL)))
ORDER BY b.numLlicencia
