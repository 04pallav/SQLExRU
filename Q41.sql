/*
Short database description "Computer firm":

The database scheme consists of four tables:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, screen, price)
Printer(code, model, color, type, price)
The table "Product" includes information about the maker, model number, and type ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all the makers and product types. Each PC uniquely specifying by a code in the table "PC" is characterized by model (foreign key referencing to Product table), speed (of the processor in MHz), total amount of RAM - ram (in Mb), hard disk drive capacity - hd (in Gb), CD ROM speed - cd (for example, '4x'), and the price. The table "Laptop" is similar to that one of PCs except for the CD ROM speed, which is replaced by the screen size - screen (in inches). For each printer in the table "Printer" it is told whether the printer is color or not (color attribute is 'y' for color printers; otherwise it is 'n'), printer type (laser, jet, or matrix), and the price.

Question: For the PC with the maximal code value from PC table, obtain all its characteristics (except for a code) in two columns:
- The name of the characteristic (a name of a corresponding column in the PC table);
- Value of the characteristic.
*/

WITH CTE_MAX
AS
(
SELECT MAX(Code) AS Code
FROM PC
)

SELECT
'cd' AS chr
, CONVERT(VARCHAR(500), B.cd) AS value
FROM CTE_MAX A
INNER JOIN PC B
ON A.Code = B.Code

UNION ALL

SELECT
'model' AS chr
, CONVERT(VARCHAR(500), B.Model) AS value
FROM CTE_MAX A
INNER JOIN PC B
ON A.Code = B.Code

UNION ALL

SELECT
'speed' AS chr
, CONVERT(VARCHAR(500), B.Speed) AS value
FROM CTE_MAX A
INNER JOIN PC B
ON A.Code = B.Code

UNION ALL

SELECT
'ram' AS chr
, CONVERT(VARCHAR(500), B.ram) AS value
FROM CTE_MAX A
INNER JOIN PC B
ON A.Code = B.Code

UNION ALL

SELECT
'hd' AS chr
, CONVERT(VARCHAR(500), B.hd) AS value
FROM CTE_MAX A
INNER JOIN PC B
ON A.Code = B.Code

UNION ALL

SELECT
'price' AS chr
, CONVERT(VARCHAR(500), B.price) AS value
FROM CTE_MAX A
INNER JOIN PC B
ON A.Code = B.Code
