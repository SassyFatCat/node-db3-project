-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select ProductName, CategoryName
from Product
left join Category on Product.CategoryId = Category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select Id, ShipName
from [Order]
where OrderDate < "2012-08-09"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select Quantity, ProductId, OrderId, Product.ProductName
from [OrderDetail]
join Product on Product.Id = OrderDetail.ProductId
where OrderId = 10251
order by Product.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select Id as OrderId, Customer.CompanyName, Employee.LastName as EmployeeLastName
from [Order]
join Customer on CustomerId = Customer.Id
join Employee on EmployeeId = Employee.Id