-- -------------------------------------------------
-- PREGUNTA 1

SELECT p.NUM_PROJ, p.NOM_PROJ, COUNT (DISTINCT d.CIUTAT_DPT)
FROM PROJECTES p LEFT OUTER JOIN EMPLEATS e ON p.NUM_PROJ = e.NUM_PROJ
				 LEFT OUTER JOIN DEPARTAMENTS d ON e.NUM_DPT = d.NUM_DPT
GROUP BY p.NUM_PROJ, p.NOM_PROJ

-- -------------------------------------------------
-- PREGUNTA 2

SELECT d.NUM_DPT, COUNT (e.NUM_EMPL)
FROM DEPARTAMENTS d LEFT OUTER JOIN EMPLEATS e ON e.CIUTAT_EMPL = d.CIUTAT_DPT
GROUP BY d.NUM_DPT
ORDER BY d.NUM_DPT ASC

-- -------------------------------------------------
-- PREGUNTA 3

SELECT d.ciutat_dpt, count(e.NUM_EMPL)
FROM DEPARTAMENTS d LEFT OUTER JOIN EMPLEATS e ON d.NUM_DPT = e.NUM_DPT
WHERE d.CIUTAT_DPT IS NOT NULL
GROUP BY d.CIUTAT_DPT
UNION
SELECT CIUTAT_EMPL, 0
FROM EMPLEATS 
WHERE CIUTAT_EMPL IS NOT NULL AND CIUTAT_EMPL NOT IN (SELECT CIUTAT_DPT 
                                          FROM DEPARTAMENTS 
                                          WHERE CIUTAT_DPT IS NOT NULL)

-- -------------------------------------------------
-- PREGUNTA 4



-- -------------------------------------------------
-- PREGUNTA 5



-- -------------------------------------------------
-- PREGUNTA 6
