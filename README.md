# Data Warehousing Project
Welcome to my very first Data Warehousing Project! I gained invaluable skills and knowledge, applicable to my future career in data analytics/engineering, from following along in an online course created by [Data With Baraa](https://github.com/DataWithBaraa). In this project, I built a ready-to-use data warehouse with tools such as **Notion** (project planning) , **Draw.io** (designing data architecture, models, and flows), and **SQL Server Management Studio** (ETL processing and data modeling). <br>
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
2. **Silver Layer**: The raw data goes through cleansing, standardization, and normalization processes in preperation for analytical queries. <br>
3. **Gold Layer**: Implements star schema modeling to organize high quality data that is ready to be used for business reporting & analytics.<br>
### Flow Diagram
![documents/data_warehouse_flow_diagram](https://github.com/Ryanmcl19/sql-data-warehouse-project/blob/2bf4295b33450cb4569f95ed3ece08c887e7e904/documents/data_warehouse_flow_diagram.png)
<br>
## Other Visuals
[Data Mart](https://github.com/Ryanmcl19/sql-data-warehouse-project/blob/521d142576456cb88c1ca75a5b7466abcea1b3c8/documents/data_mart.png) <br>
[Data Integration Model](https://github.com/Ryanmcl19/sql-data-warehouse-project/blob/521d142576456cb88c1ca75a5b7466abcea1b3c8/documents/data_integration_model.png) <br>
## License
https://github.com/Ryanmcl19/sql-data-warehouse-project/blob/521d142576456cb88c1ca75a5b7466abcea1b3c8/LICENSE
## About Me
Hi! My name is Ryan McLaughlin and I graduated with a Physics degree from Virginia Tech in 2024. Since graduating, I have spent much of my free time developing my coding skills in Python, R, and SQL with a focus on data analytics/engineering.
#### What's next for me?
I will be starting on the data analysis project that is coming up next in my current online course.
<br>
### Link to Data With Baraa's MIT License 
https://github.com/DataWithBaraa/sql-data-warehouse-project/blob/92406686380cde6eca208c8b43e6fa40ecd26344/LICENSE 
