# Retail Sales Analysis — SQL & Power BI

## 📌 Project Overview

This project analyzes retail sales data using **SQL Server** and **Microsoft Power BI** to uncover meaningful business insights related to sales performance, customers, product categories, profitability, and purchasing behavior.

The project follows an end-to-end data analytics workflow:

**Data → SQL Data Cleaning → SQL Analysis → Data Modeling → DAX Measures → Power BI Dashboard → Business Insights**

The objective is to transform raw retail transaction data into an interactive dashboard that helps understand:

- Overall sales and revenue performance
- Monthly and yearly sales trends
- Category performance
- Customer purchasing behavior
- Top customers
- Quantity sold
- Profitability and COGS
- Category revenue contribution
- Sales growth and performance trends

---

## 🎯 Project Objectives

The main objectives of this project are:

1. Clean and validate the retail sales dataset.
2. Perform exploratory data analysis using SQL.
3. Analyze revenue, orders, quantity, and profitability.
4. Identify high-value customers.
5. Analyze customer purchasing behavior.
6. Compare product/category performance.
7. Calculate COGS and profit.
8. Analyze monthly and yearly sales trends.
9. Calculate Month-over-Month (MoM) and Year-over-Year (YoY) growth.
10. Build an interactive Power BI dashboard for business decision-making.

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| SQL Server | Data cleaning, exploration and analysis |
| SQL | Business queries and aggregations |
| Power BI | Dashboard and visualization |
| DAX | Measures and calculated metrics |
| Excel/CSV | Source data |
| GitHub | Project documentation and version control |

---

## 📂 Project Structure

```text
Retail-Sales-Analysis/
│
├── dataset/
│   └── retail_sales.csv
│
├── SQL/
│   └── retail_sales_analysis.sql
│
├── PowerBI/
│   └── retail_sales_dashboard.pbix
│
├── Dashboard_images/
│   ├── overview.png
│   ├── sales.png
│   ├── customer.png
│   ├── category.png
│   └── profitability.png
│
└── README.md
```

---

## 📂 Dataset

### Dataset Overview

The project uses a **Retail Sales Transaction Dataset** containing individual sales transactions. Each row represents a retail sales transaction and includes information about the customer, product category, quantity sold, selling price, cost of goods sold, date, and time of the transaction.

The dataset is used for:

- Sales and revenue analysis
- Customer analysis
- Category performance analysis
- Quantity analysis
- Profitability analysis
- Time-based sales analysis
- Customer segmentation
- Business performance monitoring

### 📊 Dataset Columns

| Column Name | Data Type | Description |
|---|---|---|
| `transactions_id` | Integer | Unique identifier for each sales transaction |
| `sale_date` | Date | Date on which the transaction occurred |
| `sale_time` | Time | Time at which the transaction occurred |
| `customer_id` | Integer | Unique identifier assigned to each customer |
| `gender` | Text | Gender of the customer |
| `age` | Integer | Age of the customer |
| `category` | Text | Product category associated with the transaction |
| `quantity` | Integer | Number of units sold in the transaction |
| `price_per_unit` | Decimal | Selling price of one unit |
| `cogs` | Decimal | Cost of Goods Sold associated with the transaction |
| `total_sale` | Decimal | Total revenue generated from the transaction |

### 🔍 Dataset Structure

The dataset can be broadly divided into four types of information:

**👤 Customer Information:** `customer_id`, `gender`, `age`
Used for analyzing customer demographics, customer distribution, customer revenue, top customers, age group performance, and gender-based purchasing behavior.

**🛍️ Product & Sales Information:** `category`, `quantity`, `price_per_unit`, `total_sale`
Used to analyze category revenue, quantity sold, average selling price, revenue contribution, category performance, and high-value transactions.

**💰 Financial Information:** `total_sale`, `cogs`
Used to calculate profit and profitability metrics.

**📅 Transaction Information:** `transactions_id`, `sale_date`, `sale_time`
Used for daily sales analysis, monthly and yearly revenue trends, MoM/YoY growth, shift analysis, and peak sales periods.

### 📈 Derived Metrics

| Metric | Calculation |
|---|---|
| Total Revenue | `SUM(total_sale)` |
| Total Orders | `COUNT(transactions_id)` |
| Total Customers | `DISTINCTCOUNT(customer_id)` |
| Total Quantity Sold | `SUM(quantity)` |
| Total COGS | `SUM(cogs)` |
| Total Profit | `Revenue - COGS` |
| Average Order Value | `Revenue / Orders` |
| Average Selling Price | `AVERAGE(price_per_unit)` |
| Revenue per Customer | `Revenue / Customers` |
| Profit Margin % | `Profit / Revenue × 100` |

---

## 💡 Business Insights Discovered

The analysis of the retail sales dataset revealed several important business insights across **sales performance, customer behavior, category performance, and profitability**.

### 📈 1. Sales & Revenue Insights

**Monthly Revenue Performance**
- Revenue varies across different months, indicating changes in customer purchasing activity over time.
- The monthly revenue trend helps identify high-performing and low-performing periods.
- Peak revenue months can be used to understand seasonal demand and plan future sales strategies.

**Year-over-Year Growth**
- YoY analysis compares revenue performance with the corresponding period of the previous year.
- Positive YoY growth indicates improvement in sales performance, while negative growth highlights periods requiring further investigation.

**Month-over-Month Growth**
- MoM analysis identifies short-term changes in revenue.
- Significant increases or decreases can help management identify changes in customer demand and sales performance.

**Revenue Contribution**
- Different product categories contribute differently to overall revenue.
- The category with the highest contribution represents the strongest revenue-generating segment.
- Revenue contribution analysis helps prioritize high-performing categories.

### 👥 2. Customer Insights

**Top Customers**
- A small group of high-value customers contributes significantly to total revenue.
- The Top 10 Customers analysis identifies customers who generate the highest revenue.
- These customers can be targeted through loyalty programs and personalized offers.

**Revenue per Customer**
- Measures the average revenue generated by each customer.
- A higher value indicates stronger customer spending behavior.
- Can be monitored over time to evaluate changes in customer value.

**Customer Demographics**
- Revenue and customer distribution were analyzed across different age groups and genders.
- Helps identify demographic segments with higher purchasing activity.
- Supports targeted marketing campaigns.

### 🛍️ 3. Product & Category Insights

**Highest Revenue Category**
- `Electronics` generated the highest revenue with approximately **311K**.
- This category represents the strongest contributor to overall sales.
- The business can focus on maintaining inventory availability and promotional activities for this category.

**Highest Quantity Sold Category**
- `Clothing` recorded the highest quantity sold with approximately **1,780 units**.
- High quantity does not necessarily mean the category generates the highest revenue.
- Comparing quantity with revenue helps distinguish between **high-volume** and **high-value** categories.

**Lowest Revenue Category**
- `Beauty` generated the lowest revenue.
- This category may require further investigation regarding demand, pricing, product availability, or customer preferences.

**Average Selling Price**
- Average selling price varies across categories.
- Categories with higher selling prices may generate significant revenue even with lower sales volume.
- Price and quantity should therefore be analyzed together rather than independently.

**Revenue vs Quantity**
- Comparing revenue and quantity helps identify the relationship between sales volume and monetary value.
- A category with high quantity but relatively low revenue may indicate a high-volume, low-price product segment.
- A category with low quantity but high revenue may represent a premium or high-value segment.

### 💰 4. Profitability Insights

**Total Profit**

```
Profit = Total Revenue - COGS
```

This provides a better understanding of business performance than revenue alone.

**Profit by Category**
- Profitability varies across categories.
- `Clothing` generated the highest profit of approximately **246K**.
- High-revenue categories should not automatically be considered the most profitable because COGS can significantly affect profit.

**Profit Margin**

```
Profit Margin % = Profit / Revenue × 100
```

- Categories with high revenue but low profit margins may require cost optimization.
- Categories with strong margins can be considered for additional promotional or inventory investment.

**Revenue vs COGS**
- Comparing revenue with COGS shows how much of the generated revenue is consumed by product costs.
- A widening gap between revenue and COGS indicates stronger profitability.
- A narrow gap may indicate pressure on margins.

### 🕒 5. Operational Insights

**Orders by Shift**

Transactions were divided into **Morning**, **Afternoon**, and **Evening** shifts to identify the time period with the highest order activity.

**Peak Shopping Period**
- `Evening` recorded the highest number of orders.
- This information can help businesses optimize staffing, inventory availability, and promotional campaigns during high-demand periods.

**Revenue by Shift**
- Revenue was also compared across different shifts.
- The shift with the highest number of orders may not necessarily generate the highest revenue.
- Comparing order volume and revenue helps identify differences in customer spending behavior throughout the day.

---

## 📊 Key Performance Indicators

The Power BI dashboard provides the following major KPIs:

| KPI | Business Purpose |
|---|---|
| **Total Revenue** | Measures overall sales generated |
| **Total Profit** | Measures earnings after COGS |
| **Total Orders** | Measures transaction volume |
| **Total Customers** | Measures customer base |
| **Total Quantity Sold** | Measures sales volume |
| **Average Order Value** | Measures average spending per transaction |
| **Average Selling Price** | Measures average product selling price |
| **Revenue per Customer** | Measures average customer value |
| **Profit Margin %** | Measures profitability |
| **YoY Growth %** | Measures annual performance change |
| **MoM Growth %** | Measures monthly performance change |
| **Revenue Contribution %** | Measures category contribution to total revenue |

---

## 🎯 Key Business Takeaways

Based on the analysis, the dashboard can help management:

1. Focus on the categories generating the highest revenue.
2. Identify high-value customers and develop retention strategies.
3. Increase repeat customer activity through loyalty programs.
4. Investigate low-performing categories.
5. Optimize pricing based on price-volume relationships.
6. Focus on categories with strong profit margins.
7. Monitor COGS to protect profitability.
8. Prepare inventory based on high-volume categories.
9. Allocate resources during peak shopping shifts.
10. Monitor YoY and MoM growth to identify changes in business performance.
11. Develop targeted marketing strategies for valuable customer segments.
12. Use customer and category performance together for better business decisions.

---

## 🔎 Summary

The analysis demonstrates that **revenue alone is not sufficient to evaluate retail performance**.

Combining **Revenue + Quantity + Customers + Orders + AOV + COGS + Profit + Margin + Growth** provides a more comprehensive view of business performance.

The Power BI dashboard converts these metrics into an interactive analytical solution that enables users to drill down from **overall business performance → sales → customers → categories → profitability → operations**.

---

## 📈 Project Outcome

The project transforms raw retail transaction data into an interactive business intelligence solution.

The final dashboard provides a consolidated view of:

**Sales + Customers + Categories + Products + Profitability + Operations**

and enables users to interactively analyze performance using filters and slicers.

---

## 👨‍💻 Author

**Kartikeya Bhatnagar**

**Technologies:** SQL Server · SQL · Power BI · DAX · Data Analytics

---

## ⭐ If you found this project useful

If you find this project useful or interesting, consider giving the repository a ⭐ on GitHub.

### A few things I would add to your actual GitHub repository

Your README will look much stronger if the repository has this structure:

```text
Retail-Sales-Analysis/
│
├── dataset/
│   └── retail_sales.csv
│
├── SQL/
│   └── retail_sales_analysis.sql
│
├── PowerBI/
│   └── retail_sales_dashboard.pbix
│
├── Dashboard_images/
│   ├── overview.png
│   ├── sales.png
│   ├── customer.png
│   ├── category.png
│   └── profitability.png
│
└── README.md
Most important: once you've taken screenshots of your actual five Power BI pages, replace the placeholder screenshot names in the README with those images. That will make the project immediately understandable to recruiters visiting your GitHub.
