SELECT A.ship, B.Displacement, B.NumGuns
FROM
(
SELECT Ship
FROM OutComes
WHERE Battle = 'Guadalcanal'
) A
LEFT JOIN Ships C
ON C.name = A.ship
LEFT JOIN Classes B
ON B.Class = C.Class