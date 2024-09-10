|Project Title |DataSpark: Illuminating Insights for Global Electronics|
| :--- | :--- |
|**Skills take away From This Project**|Data Cleaning and Preprocessing, EDA,Python, Data Management using SQL, Power Bi/Tableau|
|**Domain**|Retail Analytics in the Electronics Industry|

-   <ins>**Project Description:**</ins>
This project mainly focuses on getting insights for Global Electronics to enhance their overall business potential which involves 
    - Data Loading from csv to RDBMS 
    - Data cleansing which involves null value handling.
    - Data analysis of different data sets to understand the dimensions and facts of sales data of Global Electronics 
        -  Customer table -get a fair understanding of customer spread across different locations, gender and age wise and average order volume and customer sales online vs offline orders.
        -  Product -Understand top preferred products based on order volume in different levels like Category and subcategory ,profit margin for each product and low performing products in terms of sales revenue.
        -  Sale - improve overall sales based on understanding product popularity based on order volume and seasonal purchase pattern for each Product ,profit margin at product level.
        -  Store level order volume and location wise ,size wise  revenue contribution based on order count and visualizing the same on Power BI Dashboard.

-   <ins>**Data cleansing and pre-processing steps:**</ins>
    -  Extracting the data set from the csv files to pandas dataframe.
    -  Data cleansing the available dataframe -Check for null values in each dataset and data type conversions
        -  Customer data-
            -  Data  type conversions as date for Birthday column, Zip code and State as string.
            -  Removing space in column names for State code, Zip code columns for standardization before loading to SQL database.
        -  Sales data-
            -  Data  type conversions as date for Delivery Date, Order Date and Currency Code as string 
            -  Removing space in column names for Order Number, Line item, Order Date, Delivery Date, Currency Code columns for standardization before loading to SQL database.
            -  Observed 49719 null records for Delivery date

        -  Exchange rates-
            -  Data  type conversions as date for Date column, Currency as string.

        -  Product data-
            -  Data  type conversions as float for Unit Cost USD, Unit Price USD columns with regular expressions to remove $ .
            -  Removing space in names for Product Name, Unit Cost USD, Unit Price USD columns for standardization before loading to SQL database
              
        -  Store data-
            -  Data  type conversions as Date for Open Date,
            -  Remove the space in column names for Open Date and Square Meters for standardization before loading to SQL database

-   <ins>**Data Transformation and loading:**</ins>

    Import the MySQL configuration from common jupyter notebook which has all the common modules used for dataframe creation.
      - Created Database schema named DataSpark and loaded the customer, sales, product, Exchange rates, Store pandas dataframe to SQL by creating respective tables.
      - Created a view named Sales_data in MySQL by considering sales table as the fact table and customer, product, store, Exchange rates table as dimensions table of the star schema.
      - Analysed and taken required columns for deriving metrics, applied custom transformations wherever required. 
      - Created sqls for each metrics which is used in PowerBi for reporting layer

     ![image](https://github.com/user-attachments/assets/f467bbf6-44d3-4541-9f78-b24048cef14e)


-   <ins>**Data insights:**</ins>

Formulated SQL queries to derive the following insights from the data as part of EDA process.

  -   <ins>**Customer Insights:**</ins>

      - #### Customer counts by country:
        The United States has the highest number of customers offline, followed by online customers. This suggests a strong customer base in the US and significant online sales.

      - #### Customer orders by State
        Among states, online orders dominate, indicating a substantial portion of customers preferring offline shopping. Northwest Territories, Nebraska, Nevada have the highest number of customers in terms of order counts.

      - #### Customer counts by Age, Gender, Offline vs online
        Based on different age category, we found highest order count was placed age category between 41 and 60 years.
        Majority customer base is Male by 1.5%.
        Offline sales are high compared to online sales

        ![image](https://github.com/user-attachments/assets/88646856-7140-4e11-b290-ca7a8c69caa1)


      - #### Customer average order value analysis
        The average order value for each customer in-store sales and online sale varies. Comparing both the sales medium, I found that in-store sales have higher Average order value compared to online sales and highest order value is 22K USD from a customer in United Kingdom.

![image](https://github.com/user-attachments/assets/ff202fbc-732a-414b-ab83-81ea32b8b0d1)


-   <ins>**Sales insights:**</ins>

    - #### Seasonal patterns or trends for Order Volume or Revenue:
      Order volume tends to peak in December, likely due to holiday shopping, understanding these seasonal trends can help optimize inventory management and marketing strategies.

    - #### Order Volume by Year
      Total Sales revenue has increased steadily from 2016 to 2019, with a peak in 2019. However, there was a significant drop in order volume in 2020, which has led to decrease in sales revenue.

![image](https://github.com/user-attachments/assets/c98068a2-84a7-40dc-a77f-cf21d20d13f5)

 - #### Overall Sales Performance last 6 years
      Total Order count found to be around 26,000 and Total Revenue in USD around 55.67 Million in past 6 years
    
 -  #### Sales by Product 
      The company’s best-selling product has been from Computers Category with WWI Desktop PC2.33 X2330 Black around 550 Units sold in total over the last 6 years followed by TV and video category.

    - #### Sales at store level 
      Online stores have made around 11 million USD in last 6 years and Nebraska store being the top revenue generating based on total revenue followed by stores in Kansas, Nevada in United states.

   - #### Delivery Time Analysis
The average delivery time is approximately 4.53 days, with a minimum of 1 day and a maximum of 17 days. However, it’s crucial to note that the average delivery time calculated is exclusive of null values of around 49,000 records indicating potential data anomalies that need further investigation.

<img src="https://github.com/user-attachments/assets/27ef1a52-50cf-41d4-b83b-70d070d29a01" width="500">

- #### Sales revenue by currency at Product category level
Tried to find difference in total revenue when compared revenues in USD with other country currencies.However,found marginal difference in revenues wrt USD and other currencies.This proves the pricing of the product matches across the globe.

  ![image](https://github.com/user-attachments/assets/f31cd1e3-5bbe-4deb-aff7-237542a7b73d)

-   <ins>**Product insights**</ins>

    - #### Product Category wise revenue:
      Global Electronics produces variety of products out of which Computers category are the best-selling products in terms of Total Revenue based on value of orders volume and revenue and the least being from Games and Toys category.

        ![image](https://github.com/user-attachments/assets/844a180a-b69d-4116-b012-12816dbbb3b7)



    - #### Sub Category wise product revenue
      The top selling products are from Desktop Subcategory followed by Televisions and Projectors & Screens based on total sales revenue in USD and the least performing products being in the Boxed games subcategory.

        ![image](https://github.com/user-attachments/assets/dd10dc51-e9d6-4f0e-b860-77a91ab521af)
    
- #### Overall Profit margin product wise
   Based on sale price and cost involved to produce the product, profit margin is found to be high for Adventure Works Desktop from Computer category around 97K USD for Total Units sold and lowest profit margin for SV USB Data cable. This provides better insights to enhance profit margins for low performing products

  ![image](https://github.com/user-attachments/assets/0041dc2e-b018-486f-9e42-0adbab80a5f9)

- #### Less performing products
    The Company’s 10 least selling products are from home appliances Category based on units sold and total revenue and the top least being Lit ware Oscillating Stand Fan with total revenue of 29 USD.
  
  ![image](https://github.com/user-attachments/assets/a6fa6b9b-abb0-44be-b2df-9ad99f44f784)


-   <ins>**Store insights**</ins>

    - #### Store performance by revenue
      The in-store sales is more compared to online stores and overall the stores in United states are performing better in terms of order volume and total revenue of 23.76 Million USD and profit margin of 4 Million USD.

        ![image](https://github.com/user-attachments/assets/ae88bcf0-cc1b-4be1-a242-e001495ac31d)


 - #### Store Size and Age wise impact on sales 
      Stores of size between 1000 to 2000 Square meters based on revenue and order count and stores of age between 11 to 15 years based on order count are performing better in terms of order count and sales revenue.

     ![image](https://github.com/user-attachments/assets/46454e5e-d074-4c5b-9fb1-c566097f334c)   ![image](https://github.com/user-attachments/assets/0457964b-247f-4133-a1b6-01e365764dc1) 



