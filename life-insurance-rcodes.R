library(tidyverse)
library(lubridate)
library(readr)
library(scales)
view(contracts)
# 1. Filter LIFE products & clean
life <- contracts %>%
  mutate(across(where(is.character), ~ tolower(trimws(.x)))) %>%
  filter(product == "life") %>%
  mutate(across(where(is.character), ~ na_if(.x, "")))
view(life)
# 2. Clean gender
life <- life %>%
  mutate(
    gender = case_when(
      gender %in% c("female","fem","fema","femal","f") ~ "Female",
      gender %in% c("male","man","m") ~ "Male",
      TRUE ~ NA
    )
  )

# 3. Convert numeric fields
life <- life %>%
  mutate(
    annual_premium = parse_number(as.character(annual_premium)),
    client_age = as.numeric(client_age)   # does nothing if it's already numeric
  )


# 4. Drop missing only for needed variables
life <- life %>%
  drop_na(client_age, annual_premium, gender, status)

# 5. Churn definition
life <- life %>%
  mutate(
    churn = if_else(status %in% c("suspended", "cancelled", "cancel", "expired"), 
                    "Churn", "Active")
  )

# 6. Age groups
life <- life %>%
  mutate(
    age_group = case_when(
      client_age >= 30 & client_age <= 39 ~ "30-39",
      client_age >= 40 & client_age <= 49 ~ "40-49",
      client_age >= 50 ~ "50+"
    )
  ) %>%
  drop_na(age_group)

# 7. Churn by age group
age_churn <- life %>%
  group_by(age_group) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total,
    .groups = "drop"
  )

# 8. Churn by gender
gender_churn <- life %>%
  group_by(gender) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total,
    .groups = "drop"
  )
ggplot(gender_churn, aes(x = gender, y = churn_rate)) +
  geom_col(fill = "#00BFC4") +
  geom_text(aes(label = scales::percent(churn_rate, accuracy = 0.1)),
            vjust = -0.3, size = 5) +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Churn Rate by Gender",
    x = "Gender",
    y = "Churn Rate"
  ) +
  theme_minimal()

#channel

channel_churn <- life %>%
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
  geom_text(aes(label = scales::percent(churn_rate, accuracy = 0.1)),
            vjust = -0.3, size = 4) +
  scale_y_continuous(labels = scales::percent,
                     expand = expansion(mult = c(0, 0.1))) +
  labs(
    title = "Churn Rate by Channel",
    x = "Channel",
    y = "Churn Rate"
  ) +
  theme_minimal(base_size = 13)

#10. Churn Rate by Risk Zone

risk_churn <- life %>%
  group_by(risk_zone) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total,
    .groups = "drop"
  ) %>%
  arrange(desc(churn_rate))

ggplot(risk_churn, aes(x = reorder(risk_zone, churn_rate), y = churn_rate)) +
  geom_col(fill = "#F8766D") +
  geom_text(aes(label = scales::percent(churn_rate, accuracy = 0.1)),
            vjust = -0.3, size = 5) +
  scale_y_continuous(labels = scales::percent,
                     expand = expansion(mult = c(0, 0.1))) +
  labs(
    title = "Churn Rate by Risk Zone",
    x = "Risk Zone",
    y = "Churn Rate"
  ) +
  theme_minimal()

#churn by city/postal
city_churn <- life %>%
  group_by(city_postal) %>%
  summarise(
    total = n(),
    churn_n = sum(churn == "Churn"),
    churn_rate = churn_n / total,
    .groups = "drop"
  ) %>%
  arrange(desc(churn_rate))
city_churn_top10 <- city_churn %>%
  slice_max(churn_rate, n = 10)


ggplot(city_churn_top10,
       aes(x = reorder(city_postal, churn_rate), y = churn_rate)) +
  geom_col(fill = "#5A9E3F") +
  geom_text(aes(label = scales::percent(churn_rate, accuracy = 0.1)),
            hjust = -0.1, size = 4) +
  scale_y_continuous(labels = scales::percent,
                     expand = expansion(mult = c(0, 0.15))) +
  coord_flip() +
  labs(
    title = "Top 10 Cities by Churn Rate",
    x = "City / Postal Code",
    y = "Churn Rate"
  ) +
  theme_minimal(base_size = 13)

#Premium Amount vs Churn (Boxplot)

ggplot(life, aes(x = churn, y = annual_premium, fill = churn)) +
  geom_boxplot() +
  labs(
    title = "Premium Amount vs Churn",
    x = "Churn Status",
    y = "Annual Premium"
  ) +
  theme_minimal() +
  scale_fill_manual(values = c("#00BFC4", "#F8766D"))

