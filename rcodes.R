# Load libraries
library(tidyverse)
library(lubridate)
library(readr)
library(scales)
view(contracts)

### 1. Extract LIFE product records
life_data <- contracts %>%
  filter(tolower(product) == "life") %>%
  select(product, status, client_age, annual_premium,
         channel, gender, risk_zone, city_postal)

### 2. Clean strings and convert blanks to NA
life_product <- life_data %>%
  mutate(across(everything(), ~ if (is.character(.x)) trimws(.x) else .x)) %>%
  mutate(across(where(is.character), ~ na_if(.x, "")))

### 3. Standardize gender values
life_product_1 <- life_product
life_product_1$gender <- tolower(life_product_1$gender)

life_product_1$gender[life_product_1$gender %in%
                        c("female", "fem", "fema", "femal", "f")] <- "Female"
life_product_1$gender[life_product_1$gender %in%
                        c("man", "m", "male")] <- "Male"
life_product_1$gender[life_product_1$gender %in%
                        c("unknown", " ", "")] <- NA

### 4. Convert age & premium to numeric
life_product_1$annual_premium <- parse_number(as.character(life_product_1$annual_premium))
life_product_1$client_age     <- parse_number(as.character(life_product_1$client_age))

### 5. Remove missing values
life_data_1 <- life_product_1 %>% drop_na()

### 6. Create churn flag (Active vs Churn)
life_data_1 <- life_data_1 %>%
  mutate(
    churn = ifelse(tolower(status) %in% 
                     c("suspended", "cancelled", "cancel", "expired"),
                   "Churn", 
                   "Active")
  )

### 7. Create Age Groups
life_data_1 <- life_data_1 %>%
  mutate(
    age_group = cut(
      client_age,
      breaks = c(30, 40, 50, Inf),
      labels = c("30-39", "40-50", "51+"),
      right = FALSE
    )
  ) %>%
  filter(!is.na(age_group))

### 8. Churn Rate by Age Group
age_churn <- life_data_1 %>%
  group_by(age_group) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total,
    .groups = "drop"
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

### 9. Premium Amount vs Churn
ggplot(life_data_1, aes(x = churn, y = annual_premium, fill = churn)) +
  geom_boxplot() +
  labs(title = "Premium Amount vs Churn",
       x = "Churn Status", 
       y = "Annual Premium") +
  theme_minimal()

### 10. Churn Rate by Channel
channel_churn <- life_data_1 %>%
  group_by(channel) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total,
    .groups = "drop"
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

### 11. Churn Rate by Gender
gender_churn <- life_data_1 %>%
  group_by(gender) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total,
    .groups = "drop"
  )

ggplot(gender_churn, aes(x = gender, y = churn_rate)) +
  geom_col(fill = "#00BFC4") +
  scale_y_continuous(labels = percent) +
  labs(title = "Churn Rate by Gender",
       x = "Gender",
       y = "Churn Rate") +
  theme_minimal()

### 12. Churn Rate by Risk Zone
risk_churn <- life_data_1 %>%
  group_by(risk_zone) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total,
    .groups = "drop"
  )

ggplot(risk_churn, aes(x = risk_zone, y = churn_rate)) +
  geom_col(fill = "#F8766D") +
  scale_y_continuous(labels = percent) +
  labs(title = "Churn Rate by Risk Zone",
       x = "Risk Zone",
       y = "Churn Rate") +
  theme_minimal()

### 13. Top 10 Cities by Churn Rate
city_churn <- life_data_1 %>%
  group_by(city_postal) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total,
    .groups = "drop"
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
