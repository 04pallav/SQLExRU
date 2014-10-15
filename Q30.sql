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

Question: Under the assumption that the income (inc) and expenses (out) of the money at each outlet (point) are registered any number of times a day, get a result set with fields: outlet, date, expense, income.
Note that a single record must correspond to each outlet at each date. 
Use Income and Outcome tables.

*/

SELECT COALESCE(A.Point, B.Point) AS Outlet ,
       COALESCE(A.Date, B.Date) AS Date,
       SUM(B.Out) AS Expense,
       SUM(A.Inc) AS Income
FROM Income A
FULL OUTER JOIN Outcome B ON A.Point = B.Point
AND A.Code = B.Code
AND A.Date = B.Date
GROUP BY COALESCE(A.Point, B.Point) ,
         COALESCE(A.Date, B.Date)
