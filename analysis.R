##This is a test for branching

# Load required libraries
library(dplyr)
library(ggplot2)

# Load the dataset
gtd_data <- read.csv("globalterrorismdb_0718dist.csv", stringsAsFactors = FALSE)

# Basic data overview
print("Dataset Loaded")
glimpse(gtd_data)

##number of terrorist attacks per year
# Analysis: Number of attacks per year
attacks_per_year <- gtd_data %>%
  count(iyear)

# Plot the results
ggplot(attacks_per_year, aes(x = iyear, y = n)) +
  geom_bar(stat = "identity") +
  labs(title = "Number of Terrorist Attacks Per Year",
       x = "Year", y = "Number of Attacks") +
  theme_minimal()

#### Fatalities by attack type

fatalities_by_attack <- gtd_data %>%
  group_by(attacktype1_txt) %>%
  summarize(total_fatalities = sum(nkill, na.rm = TRUE))

# Plot the results
ggplot(fatalities_by_attack, aes(x = attacktype1_txt, y = total_fatalities)) +
  geom_bar(stat = "identity") +
  labs(title = "Fatalities by Attack Type",
       x = "Attack Type", y = "Total Fatalities") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()