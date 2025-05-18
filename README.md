# Netflix Data Analysis

## Project Overview
This project analyzes Netflix’s content using a dataset sourced from Kaggle. The dataset was cleaned using Python in Google Colab to handle missing values and prepare it for analysis.
A table was created from the cleaned data, highlighting the key columns and attributes of Netflix shows. Using SQL queries, various insightful questions about Netflix content were answered. Dashboard was created using Power BI to visualize the analysis.

## Tools & Technologies Used
### Tools
- **Power BI** – for dashboard visualization  
- **Google Colab** – for executing Python code
- **GitHub** – for project hosting and version tracking  

### Technologies
- **Python (Pandas)** – for data cleaning and preprocessing  
- **SQL** – for querying the dataset  


## Dataset and Cleaning
The dataset was obtained from Kaggle (link: https://www.kaggle.com/datasets/infamouscoder/dataset-netflix-shows).
Data cleaning was performed in Python (pandas) using Google Colab, where missing values were filled or removed as appropriate.
The cleaned dataset was saved for further analysis.

## SQL Analysis
A SQL table named netflix_titles was created to hold the cleaned data.
The key columns in the table include show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in (genres), and description.

Several SQL queries were executed to answer the following questions:
1. What are the types of shows on Netflix and their percentage distribution?
2. What is the range of release years for all Netflix shows?
3. How many shows were released each year?
4. Which are the top 10 countries with the most Netflix content?
5. How is the show rating distributed across different countries?
6. What are the top 10 genres on Netflix, considering multiple genres per title?
7. Who are the top 10 directors with the most shows on Netflix?
8. Who are the top 10 actors with the most shows on Netflix?
9. What are the top 5 TV shows with the highest number of seasons?
10. How many shows were released annually from 2000 to 2021?
11. Which Netflix show has the longest title?
12. How many years does it typically take for shows to be added to Netflix after their original release?

## Dashboard
A Power BI dashboard was created to visually present the key insights from the analysis.
It includes:
- The ratio of Movies to TV Series on Netflix.
- Number of shows released across years from 2000 to 2021.
- Top 5 directors with the highest number of Netflix shows.
- Top 5 countries with the most Netflix content.
- Rating distribution by country along with the count of shows.
- The Netflix show with the longest title.
