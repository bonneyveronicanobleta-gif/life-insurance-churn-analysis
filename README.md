# life Insurance Churn Analysis


## Table Of Contents

- [Project Overview](#Project-Overview)
- [Business Context](#Business-Context )

### Project Overview

This project uses R to explore the key drivers of customer churn in life insurance. Since all policies in the dataset had a fixed one-year term, the analysis focuses on variables that provide meaningful insights age, annual premium, sales channel, gender, risk zone, and city. Using data cleaning, exploratory analysis, and churn-rate calculations, the project identifies which customer groups and channels have the highest likelihood of churn. The results highlight how demographic factors, premium levels, and distribution channels influence churn behavior. These insights can help insurers strengthen retention strategies, target at-risk customers, and improve long-term customer value.

### Business Context 

Life insurance churn is more than just a customer decision ,it directly impacts both families and insurers. When customers churn: 
- Families lost the financial protection they were counting on. 
- Insurers lose revenue, long‑term relationships, and trust. 
Understanding churn behavior is critical for designing retention strategies that keep customers engaged and policies active. This project explores the customer and policy characteristics most associated with churn providing insights that insurers can use to strengthen retention and build long‑term loyalty. 

### Business Objectives 

This project aims to: 
- Identify which age groups are most prone to churn. 
- Analyze how premium levels influence churn. 
- Evaluate which channels (Agency, Broker, Web, Phone) have the highest churn. 
- Assess demographic factors (gender, risk zone, city) associated with churn. 
- Recommend actionable strategies insurers can use to reduce churn and improve customer loyalty.

  ### Data sources

  Kaggle: https://www.kaggle.com/datasets/kpoviesistphane/insurance-dataset-for-data-engineering-practice


### Tools/Packages Used 
- R – main programming language for data cleaning, analysis, and visualization 
- tidyverse – for data manipulation (dplyr) and piping (%>%) 
- lubridate – for handling date-related operations (if used in other parts) 
- readr – for parsing numbers and reading data 
- scales – for formatting axes and percentages in plots
- ggplot2 – for creating all visualizations

 

### Key drivers:
Age,Annual Premium,Channel,Gender,Risk Zone,City

### Data Cleaning and Preparation 

- Filtered the dataset to include only Life insurance products and selected the relevant fields. 
- Trimmed and cleaned character fields by removing extra whitespace and converting empty strings to NA. 
- Standardized gender values by fixing inconsistent labels and replacing unknown entries with NA. 
- Converted numeric fields (client_age, annual_premium) into proper numeric format. 
- Removed incomplete records by dropping all rows containing missing values.


### Explanatory Data Analysis 
- Age Groups: Compared churn rates across age groups to identify which ages churn more. 
- Premium Levels: Checked whether lower or higher premiums are linked to higher churn. 
- Channels: Measured churn across Agency, Broker, Web, and Phone to find the highest-churn channels. 
- Demographics: Analyzed churn by gender, risk zone, and city to spot high-risk segments. 
- Actions: Used these insights to suggest targeted retention strategies. 
  


### Findings & Interpretation
  


### Limitations




### Recommmendation
