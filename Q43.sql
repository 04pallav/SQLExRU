/*

Short database description "Ships":

The database of naval ships that took part in World War II is under consideration. The database has the following relations: 
Classes(class, type, country, numGuns, bore, displacement) 
Ships(name, class, launched) 
Battles(name, date) 
Outcomes(ship, battle, result) 
Ships in classes are arranged to a single project. A class is normally assigned the name of the first ship in the class under consideration (head ship); otherwise, the class name does not coincide with any ship name in the database. 
The Classes relation includes the class name, type (bb for a battle ship, or bc for a battle cruiser), country where the ship was built, number of main guns, gun caliber (diameter of the gun barrel, in inches), and displacement (weight in tons). The Ships relation includes the ship name, its class name, and launch year. The Battles relation covers the name and date of a battle the ships participated; while the result of their participation in the battle (sunk, damaged, or unharmed - OK) is in the Outcomes relation. 
Notes: 1) Outcomes relation may include the ships not included in the Ships relation. 2) Sunk ship can not participate in battles after that.

Question: Specify the battles which have occured in years that are absent from ships launched years.
*/

SELECT name FROM Battles
WHERE DATEPART(yy, date)
IN
(
SELECT DATEPART(yy, date) from Battles
EXCEPT
SELECT Launched FROM Ships
)
