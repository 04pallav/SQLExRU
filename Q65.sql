/*
Short database description "Computer firm":

The database scheme consists of four tables:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, screen, price)
Printer(code, model, color, type, price)
The table "Product" includes information about the maker, model number, and type ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all the makers and product types. Each PC uniquely specifying by a code in the table "PC" is characterized by model (foreign key referencing to Product table), speed (of the processor in MHz), total amount of RAM - ram (in Mb), hard disk drive capacity - hd (in Gb), CD ROM speed - cd (for example, '4x'), and the price. The table "Laptop" is similar to that one of PCs except for the CD ROM speed, which is replaced by the screen size - screen (in inches). For each printer in the table "Printer" it is told whether the printer is color or not (color attribute is 'y' for color printers; otherwise it is 'n'), printer type (laser, jet, or matrix), and the price.

Question: Renumber the unique pairs {maker, type} from Product table, having ordered them as follows:
- A name of the manufacturer (maker) in ascending;
- Type of a product (type) in the order: PC, Laptop, Printer.
If a manufacturer produces more than one type of product, deduce its name only in the first row;
other rows for THIS manufacturer should contain an empty string ('').
*/

SELECT num ,
       CASE
           WHEN num2 = 1 THEN Maker
           ELSE ''
       END AS Maker ,
       TYPE
FROM
  (SELECT ROW_NUMBER() OVER(
                            ORDER BY Maker, H) AS num ,
          ROW_NUMBER() OVER(PARTITION BY Maker
                            ORDER BY Maker, H) AS num2 ,
          Maker ,
          TYPE
   FROM
     (SELECT DISTINCT Maker ,
                      TYPE ,
                      CASE WHEN TYPE = 'PC' THEN 1 WHEN TYPE = 'Laptop' THEN 2 WHEN TYPE = 'Printer' THEN 3 END H
      FROM Product) A)B