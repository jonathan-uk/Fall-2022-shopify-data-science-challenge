/* 
Question 2: For this question you’ll need to use SQL. Follow this link to access the data set required for the challenge. 
Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.

a. How many orders were shipped by Speedy Express in total?
b. What is the last name of the employee with the most orders?
c. What product was ordered the most by customers in Germany?


-- a. How many orders were shipped by Speedy Express in total?

SELECT DISTINCT COUNT(OrderID) 
FROM Orders
WHERE ShipperID = (SELECT ShipperID FROM Shippers WHERE ShipperName = 'Speedy Express');

-- ANSWER: COUNT(OrderID)=54

-- b. What is the last name of the employee with the most orders?

SELECT emp.LastName, COUNT(emp.LastName) AS Occurrences 
FROM Orders AS ord
JOIN Employees emp ON emp.EmployeeID = ord.EmployeeID
GROUP BY emp.LastName
ORDER BY Occurrences DESC
Limit 1

-- ANSWER: Peacock |  40 orders

--c. What product was ordered the most by customers in Germany?


SELECT prod.ProductName
FROM Products AS prod
    JOIN OrderDetails AS details ON details.ProductID = prod.ProductID
    JOIN Orders AS ord ON ord.OrderID = details.OrderID
    JOIN Customers AS cust ON cust.CustomerID = ord.CustomerID
WHERE cust.Country = "Germany"
GROUP BY prod.ProductName
ORDER BY SUM(details.Quantity) DESC
LIMIT 1;

-- Answer: Boston Crab Meat
