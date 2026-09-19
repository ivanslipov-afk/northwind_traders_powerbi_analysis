# **Northwind Traders Sales Analysis**



### 

1. ### **Project Overview**



###### This project analyzes sales, product performance, customer behavior, and delivery performance for Northwind Traders using PostgreSQL.

###### 

###### The goal was not only to calculate business metrics, but also to investigate patterns in the data and translate the SQL results into meaningful business findings.





### **2. Business Question**



###### How are sales performing, which products and customers drive revenue, and are there any delivery-related issues?



### 

### **3. Dataset**



###### Dataset: [Northwind Traders](https://mavenanalytics.io/data-playground/northwind-traders)

###### 

###### The analysis focuses primarily on the orders, order\_details, products, customers, and shippers tables.



### **4. Tools Used**



###### PostgreSQL

###### pgAdmin 



### 

### **5. Analytical Approach**



#### 

#### **1) Data Quality**



###### Before analyzing the business performance, I checked the dataset for potential data-quality issues.

###### 

###### Checks included:

###### 

* ###### Total number of orders
* ###### Missing shippeddate values
* ###### Invalid quantities
* ###### Invalid unit prices
* ###### Invalid discounts

###### 

###### No invalid quantities or discounts were identified in the checks performed.

###### 

###### There were 21 orders with a missing shippeddate.



#### 

#### **2) Sales Overview**



###### I calculated the main sales KPIs:

###### 

###### Metric	Result

###### Total Orders	830

###### Total Revenue	$1,265,793.04

###### Total Products Sold	51,317

###### Average Order Value	$1,525.05

###### 

###### Revenue was calculated using the following logic:

###### 

###### quantity × unit price × (1 − discount)



#### 

#### **3) Sales Trend**



###### Sales revenue was analyzed at two levels:

###### 

###### Revenue by year

###### Revenue by month

###### 

###### DATE\_TRUNC() was used to group order dates by month and identify changes in sales performance over time.





#### **4) Product Analysis**



###### Product performance was analyzed using two metrics:

###### 

###### Total units sold

###### Total revenue generated

###### Top Revenue Product

###### 

###### Côte de Blaye generated approximately $141,396.74 in revenue and sold 623 units.

###### 

###### The comparison between the Top 10 products by revenue and Top 10 products by quantity also showed that high sales volume does not necessarily mean high revenue.

###### 

###### Products that appeared in the Top 10 by quantity but not in the Top 10 by revenue included:

###### 

###### Gorgonzola Telino

###### Pavlova

###### Rhönbräu Klosterbier

###### Guaraná Fantastica

###### Boston Crab Meat

###### Flotemysost

###### 

###### This demonstrates why both sales volume and revenue should be considered when evaluating product performance.





#### **5) Customer Analysis**



###### For each customer, I calculated:

###### 

###### Total revenue

###### Number of orders

###### Average Order Value (AOV)

###### 

###### The analysis also compared customers with the highest order frequency against customers with the lowest AOV.

###### 

###### No customer appeared in both the Top 10 by order frequency and the Bottom 10 by AOV based on this comparison.





#### **6) Delivery Analysis**





###### Delivery performance was analyzed by calculating the number of days between:

###### 

###### orderdate → shippeddate

###### 

###### Orders without a shippeddate were excluded from delivery-time calculations.

###### 

###### Overall Delivery Performance

###### 

###### Average delivery time: 8.49 days

###### 

###### Delivery Performance by Shipper

###### Shipper	Average Delivery Time	Orders

###### United Package	9.23 days	315

###### Speedy Express	8.57 days	245

###### Federal Shipping	7.47 days	249

###### 

###### The results show a difference of 1.76 days between the highest and lowest average delivery times.

###### 

###### I also identified orders where the delivery time was longer than the overall average of 8.49 days.



### 

### **6. Key Findings**



###### 1\. Revenue and sales volume measure different aspects of product performance

###### 

###### Products with high unit sales are not necessarily the products generating the highest revenue.

###### 

###### For example, Côte de Blaye generated the highest revenue while selling significantly fewer units than some of the high-volume products.

###### 

###### 2\. Customer behavior varies

###### 

###### Customers differ in both purchasing frequency and average order value.

###### 

###### The comparison of the Top 10 customers by order frequency with the Bottom 10 by AOV did not produce any overlapping customers.

###### 

###### 3\. Shipping performance varies between providers

###### 

###### Average delivery time ranged from 7.47 days to 9.23 days across the three shipping providers analyzed.

###### 

###### United Package had the highest average delivery time, while Federal Shipping had the lowest.

###### 

###### 4\. Some orders take longer than the overall average

###### 

###### Orders exceeding the overall average delivery time of 8.49 days were identified for further investigation.







### **7. Business Conclusion**





###### The analysis shows that Northwind's sales performance should be evaluated using multiple metrics rather than a single measure.

###### 

###### Product quantity and revenue provide different perspectives on product performance, while customer analysis highlights differences in purchasing behavior.

###### 

###### Delivery analysis also revealed variation between shipping providers, with average delivery times differing by almost two days.

###### 

###### These findings provide several opportunities for further investigation, particularly around product pricing, customer purchasing patterns, and shipping performance.





### **8. SQL Skills Demonstrated**



###### This project demonstrates practical use of:

###### 

###### SELECT

###### WHERE

###### GROUP BY

###### HAVING

###### ORDER BY

###### LIMIT

###### COUNT

###### COUNT(DISTINCT)

###### SUM

###### AVG

###### ROUND

###### EXTRACT

###### DATE\_TRUNC

###### Date arithmetic

###### INNER JOIN

###### Common Table Expressions (WITH)

###### Aggregations

###### Business KPI calculation

###### Comparative analysis





### **9. How to Reproduce**



Install PostgreSQL and pgAdmin 4.

Create a PostgreSQL database.

Load the Northwind Traders dataset.

Run the database setup SQL script.

Execute the analytical queries from the project.

Review the results and business findings.

Possible Next Steps





### **10. Further analysis could investigate**



###### Revenue trends by product category

###### Customer lifetime value

###### Revenue contribution by customer segment

###### Monthly shipping performance

###### Shipping performance by individual product or customer

###### Relationship between product price and sales volume

###### Identification of potential delivery bottlenecks



