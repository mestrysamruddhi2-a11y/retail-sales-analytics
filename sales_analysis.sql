use Samruddhi;
create table Product(
ProductID int primary key,
ProductName varchar(50),
Category varchar (50)
);

create table Region (
RegionID int primary key, 
RegionName varchar (50), 
City varchar(50)
);

create table Sales (
SaleID int primary key,
ProductID int,
RegionId int,
SaleDate date,
Quantity int,
SalesAmount decimal(10,2),
foreign key (ProductID) references Product (ProductID),
foreign key (RegionID) references Region (RegionID)
);

insert into Product
values
(1, 'Monitor', 'Electronics'),
(2, 'Mouse', 'Accessories'),
(3, 'Shirt', 'Clothing'),
(4, 'Jeans', 'Clothing'),
(5, 'Sofa', 'Furniture');

select * from Product;

insert into Region
values
(1, 'North', 'Delhi'),
(2, 'South', 'Bangalore'),
(3, 'West', 'Mumbai'),
(4, 'East', 'Kolkata');

select * from Region;

INSERT INTO Sales VALUES
(1,1,1,'2026-01-10',5,250000),
(2,2,2,'2026-01-15',10,300000),
(3,3,3,'2026-02-10',20,80000),
(4,4,1,'2026-02-15',15,75000),
(5,5,4,'2026-03-10',4,160000),
(6,1,4,'2026-03-15',4,200000),
(7,2,3,'2026-04-10',8,240000),
(8,3,4,'2026-04-15',25,100000);

select * from Sales;

-- Total sales by product
select
p.ProductName,
sum(s.SalesAmount) as TotalSales
from Sales s
join Product p
on s.ProductID=p.ProductID
group by p.ProductName
order by TotalSales desc;

--total sales by region
select r.RegionName,
sum(s.SalesAmount) as TotalSales
from sales s
join Region r
on s.RegionId = r.RegionID
group by r.RegionName
Order by TotalSales desc;

--monthly sales
select
month(SaleDate) as SaleMonth,
sum(s.SalesAmount) as monthlySales
from Sales s
group by month(SaleDate)
order by monthlySales desc;

--top3 product by sales
select
p.ProductName,
sum(s.SalesAmount) as top_3
from Sales s
join Product p
on s.ProductID=p.ProductID
group by p.ProductName
order by top_3 desc
Limit 3;
