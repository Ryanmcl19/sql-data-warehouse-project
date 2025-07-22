# Data Warehousing Project
Welcome to my very first Data Warehousing Project!<br>
In this project, I've built a ready-to-use data warehouse with tools such as **Notion** (project planning) , **Draw.io** (designing data architecture, models, and flows), and **SQL Server** (ETL processing and data modeling). <br>
## Project Overview
This project involves: <br>
1. **Data Architecture**: Designing a data warehouse using Medallion Architecture (Bronze, Silver, and Gold Layers) <br>
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.<br>
3. **Data Modeling**: Creating fact and dimension tables with optimized performance for queries <br>

## Data Architecture <br>
Below is the visual representation of the **Bronze**, **Silver**, and **Gold** layers embedded in the data warehouse:
![documents/data_warehouse_architecture](https://github.com/Ryanmcl19/sql-data-warehouse-project/blob/6ce85b540bd54c94534f66059f2f58e377e65b20/documents/data_warehouse_architecture.png)
Layer Descriptions:<br>
1. **Bronze Layer**: Synthetic data is imported from CSV Files into the SQL Server where the raw data is stored. <br>
2. **Silver Layer**: The raw data goes through cleansing, standardization, and normalization processes in preperation for analytical queries
