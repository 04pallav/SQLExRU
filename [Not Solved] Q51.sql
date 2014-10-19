/*
Short database description "Computer firm":

The database scheme consists of four tables:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, screen, price)
Printer(code, model, color, type, price)
The table "Product" includes information about the maker, model number, and type ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all the makers and product types. Each PC uniquely specifying by a code in the table "PC" is characterized by model (foreign key referencing to Product table), speed (of the processor in MHz), total amount of RAM - ram (in Mb), hard disk drive capacity - hd (in Gb), CD ROM speed - cd (for example, '4x'), and the price. The table "Laptop" is similar to that one of PCs except for the CD ROM speed, which is replaced by the screen size - screen (in inches). For each printer in the table "Printer" it is told whether the printer is color or not (color attribute is 'y' for color printers; otherwise it is 'n'), printer type (laser, jet, or matrix), and the price.

Question: Find the names of the ships having the largest amount of guns among all the ships with the same displacement (taking into account Outcomes table).
*/

SELECT DISTINCT Name
FROM Classes A
INNER JOIN 
(
SELECT displacement, MAX(numGuns) AS numGuns
FROM Classes
GROUP BY displacement
) B
ON A.displacement = B.displacement
AND A.numGuns = B.numGuns
INNER JOIN Ships C
ON A.Class = C.Class

UNION 

SELECT DISTINCT ship
FROM Classes A
INNER JOIN 
(
SELECT displacement, MAX(numGuns) AS numGuns
FROM Classes
GROUP BY displacement
) B
ON A.displacement = B.displacement
AND A.numGuns = B.numGuns
INNER JOIN Outcomes D
ON A.Class = D.ship
