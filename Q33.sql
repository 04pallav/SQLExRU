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

Question: Define the ships sunk in battles in the North Atlantic. 
Result set: ship.

*/

SELECT DISTINCT ship
FROM Outcomes
WHERE result = 'sunk' AND battle = 'North Atlantic'