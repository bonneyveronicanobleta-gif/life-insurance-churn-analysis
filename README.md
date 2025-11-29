# life Insurance Churn Analysis


## Table Of Contents

- [Project Overview](#Project-Overview)
- [Business Context](#Business-Context)
- [Business Objectives](#Business-Objectives)
- [Data sources](#Data-sources)
- [Tools/Packages Used](#Tools/Packages-Used)
- [Key drivers](#Key-drivers)
- [Explanatory Data Analysis](#Explanatory-Data-Analysis)
- [Findings & Interpretation](#Findings-&-Interpretation)
- [Limitations](#Limitations)
- [Conclusions And Recommendations](#Conclusions-And-Recommendations)






  

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
  


## Findings & Interpretation

### churn by Age group


  <img width="282" height="423" alt="image" src="https://github.com/user-attachments/assets/d919ccf1-1236-4305-861e-72fde7fad3ce" />

policyholders aged 30–39 have the highest churn rate (62.2%), followed by 51+ (60.6%), and then 40–50 (56.9%). 
This means that: 
Younger adults (30–39) are the most likely to cancel, suspend, or let their policies expire. 
Older customers (51+) also show unexpectedly high churn, challenging the assumption that they are more loyal. 
Middle-aged customers (40–50) are slightly more stable, but churn is still significant. 


### churn rate by Premium Amount

  
<img width="414" height="420" alt="image" src="https://github.com/user-attachments/assets/c8148b56-b1dc-4661-8180-f2e4195c04db" />


The median annual premium is very similar for both Active and Churn policyholders.Churn customers show a slightly wider spread in premiums, especially in the upper range. Both groups contain a few high-premium outliers, indicating some policyholders pay significantly above the typical premium level.There is no strong difference in annual premium between policyholders  who churn and those who stay active.Premium amount is not a major driver of churn for this life insurance product.
 


###  Churn Rate by Channel


<img width="282" height="423" alt="image" src="https://github.com/user-attachments/assets/f3d3206e-b2a2-4110-b193-73e88d725d8a" />

Although the differences are relatively small, the Agency channel shows the highest churn, suggesting that customers who purchased through physical agencies are slightly more likely to discontinue their policies.
The Phone channel has the lowest churn, indicating potentially better customer engagement or clearer communication during the sales process.


### Churn Rate by  Gender

  
<img width="343" height="420" alt="image" src="https://github.com/user-attachments/assets/9e3c3e21-7e81-4c6c-b6f7-c08d8bb46651" />


The chart compares churn rates between Female and Male policyholders.Female policyholders churn slightly more than male policyholders.The difference is small, but it shows that gender has a minor impact on churn behavior


### risk zone


<img width="343" height="420" alt="image" src="https://github.com/user-attachments/assets/59a646fa-2340-46e6-8845-7a9695b8e48c" />


Medium-risk customers churn the most, while high-risk customers churn the least.
This pattern highlights where retention efforts should be focused. 


### Top 10 Cities by Churn Rate


<img width="414" height="420" alt="image" src="https://github.com/user-attachments/assets/08069f4f-bcca-4598-95e7-2141f83aeab1" />

- Churn is highest in Nantes and Toulouse (61.8%), while Paris and Lyon have lower churn within the top group (57.4%).Regional churn differences help the business focus retention resources where they are most needed.


## Limitations

The dataset has several limitations that restrict deeper churn analysis. Payment frequency shows no variation, as all Life policies are paid annually. Demographic information is limited to age, gender, city, and risk zone, with no socio-economic or behavioral data such as income, employment, claims, or customer interactions.



## Conclusions And Recommendations

The analysis shows that churn is highest among younger Policyholders(30–39) and decreases with age. Gender differences are small, with females churning slightly more. Channel performance varies: the agency channel has the highest churn, while the phone channel performs best. Certain cities especially Nantes, Toulouse, and Marseille shows higher churn, and medium-risk policyholders churn more than both low- and high-risk groups. The premium amount does not significantly influence churn.

Retention efforts should focus on younger and medium-risk customers, improve agency-channel onboarding and follow-up, and target high-churn cities with localized engagement. High-premium customers should receive personalized retention attention due to their financial value.




