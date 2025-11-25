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
- [Rscripts and Procedures](#Rscripts-and-Procedures)






  

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

  <img width="282" height="423" alt="image" src="https://github.com/user-attachments/assets/d919ccf1-1236-4305-861e-72fde7fad3ce" />

Customers aged 30–39 have the highest churn rate (62.2%), followed by 51+ (60.6%), and then 40–50 (56.9%). 
This means that: 
Younger adults (30–39) are the most likely to cancel, suspend, or let their policies expire. 
Older customers (51+) also show unexpectedly high churn, challenging the assumption that they’re more loyal. 
Middle-aged customers (40–50) are slightly more stable, but churn is still significant. 

- Does premium amount influence churn rate?
  
<img width="282" height="423" alt="image" src="https://github.com/user-attachments/assets/50f034ff-9b09-4506-95ff-02d016715b5c" />


The boxplot comparing annual premium amounts between churned and active customers reveals no significant difference in pricing. Both groups show similar median premiums and spread, suggesting that premium amount does not strongly influence churn behavior. Customers who cancel, suspend, or expire their policies pay roughly the same as those who remain active. This indicates that price alone is not the primary driver of churn, and insurers may need to focus on other factors such as customer experience, perceived value, or communication strategies to improve retention


## Churn Rate by Channel

<img width="282" height="423" alt="image" src="https://github.com/user-attachments/assets/f3d3206e-b2a2-4110-b193-73e88d725d8a" />

- Agency has the highest churn rate, meaning customers acquired through agents are most likely to cancel, suspend, or expire on their policies. 
- All channels show high churn, above 59%, which suggests a system-wide retention challenge.


  ### Churn Rate by  Gender
  
<img width="282" height="423" alt="image" src="https://github.com/user-attachments/assets/03f52a85-2c8b-4943-8628-ff321196e07b" />

The chart compares churn rates between Female and Male customers. The churn rates are nearly identical, with Female customers showing a slightly higher rate than Male. This suggests that gender does not significantly influence churn behavior — both groups are equally likely to cancel, suspend, or expire on their policies. 

## risk zone

<img width="282" height="423" alt="image" src="https://github.com/user-attachments/assets/05ab546d-a33c-4a8a-9976-961aa8c35ae0" />

The chart shows churn rates across three risk categories: High, Medium, and Low. Surprisingly, Medium risk customers have the highest churn rate, followed by Low risk, with High risk customers showing the lowest churn. This pattern suggests that churn is not directly correlated with risk level — customers in the Medium and Low risk zones are more likely to cancel, suspend, or expire their policies than those in the High risk zone. 

## Top 10 Cities by Churn Rate

<img width="282" height="423" alt="image" src="https://github.com/user-attachments/assets/0b98b9de-3e36-4e7b-97e8-2853dce16e96" />


- Nantes, Toulouse, and Marseille have the highest churn rates — all at 61.1%
- Paris and Lyon have the lowest churn rates in this group — around 57.4%



### Limitations

This churn analysis is constrained by a few key data limitations. First, the churn definition is not precise statuses such as expired, suspended, or cancelled may represent normal contract expiry rather than true customer attrition. Second, several important behavioral variables (e.g., customer tenure, payment history, claim history, and renewal activity) are not available, reducing the ability to identify drivers of churn. Third, the dataset has a narrow age distribution, which limits the strength of insights across customer segments. Finally, only annual premium values are provided, preventing analysis of monthly payment behavior or missed-payment patterns that often contribute to churn. 


### Conclusions And Recommendations
Many customers are leaving their policies, with churn rates around 57–61% across all groups. The Agency channel and cities like Nantes, Toulouse, and Marseille show the highest churn. Gender differences are very small, while Medium risk customers leave more often than High risk customers. Policy duration was checked but showed no clear impact within the one‑year data, limiting long‑term insights.

To reduce churn, insurers should improve retention in Agency and Broker channels, target high‑churn cities, and investigate Medium risk customers more closely. Future studies should use longer data periods and customer behavior details to understand churn better. Since churn is high everywhere, broad programs like loyalty rewards, renewal reminders, and better service are needed to keep more customers.

### Rscripts and Procedures

library(tidyverse)
library(lubridate)
library(readr)
library(scales)

### Extract LIFE product records

life_data <- contracts %>%
  filter(tolower(product) == "life") %>%
  select(product, status, client_age, annual_premium,
         channel, gender, risk_zone, city_postal)

### Clean strings and convert blanks to NA
life_product <- life_data %>%
  mutate(across(everything(), ~ if (is.character(.x)) trimws(.x) else .x)) %>%
  mutate(across(where(is.character), ~ na_if(.x, "")))

### Standardize gender values

life_product_1 <- life_product
life_product_1$gender <- tolower(life_product_1$gender)

life_product_1$gender[life_product_1$gender %in%
                        c("female", "fem", "fema", "femal", "f")] <- "Female"

life_product_1$gender[life_product_1$gender %in%
                        c("man", "m", "male")] <- "Male"

life_product_1$gender[life_product_1$gender %in%
                        c("unknown", " ", "")] <- NA

### Convert age & premium to numeric
life_product_1$annual_premium <- parse_number(as.character(life_product_1$annual_premium))
life_product_1$client_age     <- parse_number(as.character(life_product_1$client_age))

###  Remove missing values
life_data_1 <- life_product_1 %>% drop_na()

###  Create churn flag (Active vs Churn)
life_data_1 <- life_data_1 %>%
  mutate(
    churn = ifelse(tolower(status) %in% 
                     c("suspended", "cancelled", "cancel", "expired"),
                   "Churn", 
                   "Active")
  )


###  Create Age Groups
life_data_1 <- life_data_1 %>%
  mutate(
    age_group = cut(
      client_age,
      breaks = c(30, 40, 50, Inf),
      labels = c("30–39", "40–50", "51+"),
      right = FALSE
    )
  ) %>%
  filter(!is.na(age_group))


### Churn Rate by Age Group 

age_churn <- life_data_1 %>%
  group_by(age_group) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total
  )

ggplot(age_churn, aes(x = age_group, y = churn_rate)) +
  geom_col(fill = "#00BFC4") +
  geom_text(aes(label = percent(churn_rate, 0.1)),
            vjust = -0.3, size = 5) +
  scale_y_continuous(labels = percent) +
  labs(title = "Churn Rate by Age Group",
       x = "Age Group",
       y = "Churn Rate") +
  theme_minimal()

### 6. Premium Amount vs Churn

ggplot(life_data_1, aes(x = churn, y = annual_premium, fill = churn)) +
  geom_boxplot() +
  labs(title = "Premium Amount vs Churn",
       x = "Churn Status", 
       y = "Annual Premium") +
  theme_minimal()

### Churn Rate by Channel

channel_churn <- life_data_1 %>%
  group_by(channel) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total
  ) %>%
  arrange(desc(churn_rate))

ggplot(channel_churn, aes(x = reorder(channel, churn_rate), y = churn_rate)) +
  geom_col(fill = "#00BFC4") +
  geom_text(aes(label = percent(churn_rate, accuracy = 0.1)),
            vjust = -0.3, size = 4) +
  scale_y_continuous(labels = percent_format(),
                     expand = expansion(mult = c(0, 0.1))) +
  labs(title = "Churn Rate by Channel",
       x = "Channel",
       y = "Churn Rate") +
  theme_minimal(base_size = 13)

### Churn Rate by Gender
gender_churn <- life_data_1 %>%
  group_by(gender) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total
  )

ggplot(gender_churn, aes(x = gender, y = churn_rate)) +
  geom_col(fill = "#00BFC4") +
  scale_y_continuous(labels = percent) +
  labs(title = "Churn Rate by Gender",
       x = "Gender",
       y = "Churn Rate") +
  theme_minimal()

###  Churn Rate by Risk Zone
risk_churn <- life_data_1 %>%
  group_by(risk_zone) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total
  )

ggplot(risk_churn, aes(x = risk_zone, y = churn_rate)) +
  geom_col(fill = "#F8766D") +
  scale_y_continuous(labels = percent) +
  labs(title = "Churn Rate by Risk Zone",
       x = "Risk Zone",
       y = "Churn Rate") +
  theme_minimal()

###  Top 10 Cities by Churn Rate
city_churn <- life_data_1 %>%
  group_by(city_postal) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total
  ) %>%
  arrange(desc(churn_rate)) %>%
  slice_head(n = 10)

ggplot(city_churn, aes(x = reorder(city_postal, churn_rate), y = churn_rate)) +
  geom_col(fill = "#5A9E3F") +
  geom_text(aes(label = percent(churn_rate, accuracy = 0.1)),
            hjust = -0.1, size = 4) +
  scale_y_continuous(labels = percent_format(),
                     expand = expansion(mult = c(0, 0.15))) +
  coord_flip() +
  labs(title = "Top 10 Cities by Churn Rate",
       x = "City / Postal Code",
       y = "Churn Rate") +
  theme_minimal(base_size = 13)



