
# Blinkit Sales Analysis Project

## Project Overview
This project demonstrates end-to-end data analysis on Blinkit sales data using **SQL** for data processing and **Power BI** for visual analytics. The goal is to derive meaningful insights into product sales, customer preferences, and performance trends across various dimensions.

## Tools Used
- SQL (PostgreSQL) – For data cleaning, transformation, and exploration.
- Power BI – For creating interactive dashboards and visual storytelling.

## Project Structure
Blinkit_Sales_Analysis/
├── SQL/
│   └── Blinkit_Analysis.sql
├── PowerBI/
│   └── Blinkit Sales Analysis.pbix
└── README.md

## Workflow Summary
1. Data Cleaning with SQL:
   - Handled inconsistent values in `Item_Fat_Content`
   - Aggregated total and average sales, ratings, and item counts
   - Used `GROUP BY`, `CASE`, `PIVOT`, and window functions

2. Insights Extracted in SQL:
   - Total and average sales across fat content, item types, and outlet types
   - Sales percentage by outlet size
   - Year-wise sales and ratings analysis

3. Visualization with Power BI:
   - Created dashboards using KPIs, bar charts, pie charts, and slicers
   - Comparison across outlet types, item types, and fat categories

## Key Insights
- Regular items contributed more to overall sales than Low Fat.
- Specific item types drive higher revenue.
- Older outlets tend to perform better in sales.
- Outlet size and location significantly affect sales contribution.
