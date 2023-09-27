select * from Customers

select top 0*
into datamart2.dbo.dcustomers
from  Customers

select*from datamart2.dbo.dcustomers

select * 
into datamart2.dbo.DShippers
from NORTHWND.dbo.Shippers
where 1 = 0;

select * from datamart2.dbo.DShippers

select * 
into datamart2.dbo.DOrders
from NORTHWND.dbo.Orders
where 1 = 0;
select * from datamart2.dbo.DOrders

--
alter table datamart2.dbo.Dcustomers
add constraint pk_dcustomers
primary key(CustomerId)

--agregar la
alter table datamart2.dbo.DShippers
add constraint pk_dshippers
primary key(shipperId)

--
alter table datamart2.dbo.DOrders
add constraint pk_dorders
primary key(orderId)

--
alter table datamart2.dbo.DOrders
add constraint fk_dorders
foreign key(ShipVia)
references datamart2.dbo.Dshippers(shipperId)

alter table datamart2.dbo.DOrders
add constraint fk_dorders2
foreign key(CustomerID)
references datamart2.dbo.Dcustomers(CustomerID)


select o.OrderID,o.OrderDate, o.EmployeeID, e.fullname,
c.CompanyName,c.City,c.Country,od.UnitPrice,od.Discount,od.mount,od.Quantity
, p.ProductName
from Orders as o
inner join(
select employeeid, CONCAT(FirstName,' ',LastName) 
as fullname from Employees
) as e on o.EmployeeID = e.EmployeeID
inner join(
select CompanyName,City,Country,CustomerID
from Customers
) as c
on o.CustomerID=c.CustomerID
inner join(
select UnitPrice,Quantity,Discount,
(UnitPrice*Quantity) as mount
,OrderID,ProductID
from [Order Details]
) as od
on o.OrderID=od.OrderID
inner join(
select ProductID, ProductName from Products
) as p
on od.ProductID=p.ProductID
--vista
 create view ReporteVentas
 as 
 select o.OrderID,o.OrderDate, o.EmployeeID, e.fullname,
c.CompanyName,c.City,c.Country,od.UnitPrice,od.Discount,od.mount,od.Quantity
, p.ProductName
from Orders as o
inner join(
select employeeid, CONCAT(FirstName,' ',LastName) 
as fullname from Employees
) as e on o.EmployeeID = e.EmployeeID
inner join(
select CompanyName,City,Country,CustomerID
from Customers
) as c
on o.CustomerID=c.CustomerID
inner join(
select UnitPrice,Quantity,Discount,
(UnitPrice*Quantity) as mount
,OrderID,ProductID
from [Order Details]
) as od
on o.OrderID=od.OrderID
inner join(
select ProductID, ProductName from Products
) as p
on od.ProductID=p.ProductID

select * from ReporteVentas
where ProductName='Queso Cabrales'

select * from DOrders

truncate dOrders
delete from table dcustomers
delete from table dshippers