/*
Short database description "Recycling firm":

The firm has a few outlets that receive items for recycling. Each of the outlets receives funds to be paid to deliverers. Information on received funds is registered in a table:
Income_o(point, date, inc)
The primary key is (point, date), thus receiption of money (inc) takes place not more than once a day (date column does not include time component of the date). Information on payments to deliverers is registered in the table:
Outcome_o(point, date, out)
In this table the primary key (point, date) also ensures bookkeeping of the funds distribution at each point not more than once a day.
In case incomes and expenses may occur more than once a day, another database schema is used. Corresponding tables include code column as primary key:
Income(code, point, date, inc)
Outcome(code, point, date, out)
In this schema date column does not also include the day time.

Question: Calculate the combined remaining balance of all outlets based only on the income_o and outcome_o tables.
*/

WITH CTE_1
AS
(
SELECT SUM(inc) mon
FROM Income_o
) 
, CTE_2
AS
(
SELECT SUM(out) mon
FROM Outcome_o
)
SELECT A.mon - B.mon
FROM CTE_1 A, CTE_2 B
