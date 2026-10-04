# Sales Data Analyzer

sales = [
    {"SaleID": 1, "Product": "Monitor", "Region": "North", "Month": "January", "Quantity": 5, "SalesAmount": 250000},
    {"SaleID": 2, "Product": "Mouse", "Region": "South", "Month": "January", "Quantity": 10, "SalesAmount": 300000},
    {"SaleID": 3, "Product": "Shirt", "Region": "West", "Month": "February", "Quantity": 20, "SalesAmount": 80000},
    {"SaleID": 4, "Product": "Jeans", "Region": "North", "Month": "February", "Quantity": 15, "SalesAmount": 75000},
    {"SaleID": 5, "Product": "Sofa", "Region": "East", "Month": "March", "Quantity": 4, "SalesAmount": 160000},
    {"SaleID": 6, "Product": "Monitor", "Region": "East", "Month": "March", "Quantity": 4, "SalesAmount": 200000},
    {"SaleID": 7, "Product": "Mouse", "Region": "West", "Month": "April", "Quantity": 8, "SalesAmount": 240000},
    {"SaleID": 8, "Product": "Shirt", "Region": "East", "Month": "April", "Quantity": 25, "SalesAmount": 100000}
]


# Total sales
total_sales = sum(sale["SalesAmount"] for sale in sales)

print("Total Sales:", total_sales)


# Total quantity sold
total_quantity = sum(sale["Quantity"] for sale in sales)

print("Total Quantity Sold:", total_quantity)


# Sales by product
product_sales = {}

for sale in sales:
    product = sale["Product"]

    if product in product_sales:
        product_sales[product] += sale["SalesAmount"]
    else:
        product_sales[product] = sale["SalesAmount"]

print("\nSales by Product:")

for product, amount in product_sales.items():
    print(product, amount)


# Sales by region
region_sales = {}

for sale in sales:
    region = sale["Region"]

    if region in region_sales:
        region_sales[region] += sale["SalesAmount"]
    else:
        region_sales[region] = sale["SalesAmount"]

print("\nSales by Region:")

for region, amount in region_sales.items():
    print(region, amount)


# Top-selling product
top_product = max(product_sales, key=product_sales.get)

print("\nTop Selling Product:", top_product)
print("Sales:", product_sales[top_product])
