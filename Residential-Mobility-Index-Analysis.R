
# Date: 2023-11-15
# Data Source: Consumer Data Research Center


# TASK 1: Data Exploration

# Load necessary libraries for data importation and visualization
library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)

# Import the dataset and name it 'RMI_LSOA'
RMI_LSOA <- read_csv("C:/Users/USER/Downloads/hh_churn_lsoa11_2023.csv")

# Display the structure, summary, and first few rows of the dataset
View(RMI_LSOA)
str(RMI_LSOA)
summary(RMI_LSOA)
head(RMI_LSOA)



# TASK 2: Analyzing Menai (Bangor) Index

# Locate the index for Menai (Bangor) with the Area code "W01000092"
Menai_bangor <- which(RMI_LSOA$area == "W01000092")
if (length(Menai_bangor) > 0) {
  cat("Menai (Bangor) area found at row:", Menai_bangor, "\n")
} else {
  cat("Menai (Bangor) area not found in the data.\n")
}

# Save the position where "W01000092" Menai (Bangor) was found on the data-set(RMI_LSOA)

W01000092 <- data.frame(Menai_Bangor_position = Menai_bangor)

# Identify the years during which the Index for Menai (Bangor) was between 0.5 and 0.8
bangor_years <- colnames(RMI_LSOA)[grep("^chn\\d{4}$", colnames(RMI_LSOA))]
top_years_values <- RMI_LSOA[Menai_bangor, bangor_years]
top_years_in_range <- bangor_years[which(top_years_values > 0.5 & top_years_values < 0.8)]

# Print the results
cat("Years with Index between 0.5 and 0.8 for Menai (Bangor):", 
    paste(top_years_in_range, collapse = ", "), "\n")


# Creating a table for the Menai area 

Menai_RMI_data <- RMI_LSOA[RMI_LSOA$area == "W01000092", ]

# Transpose the data
Menai_RMI <- Menai_RMI_data %>%
  gather(key = "Year", value = "Index", starts_with("chn")) %>%
  arrange(Year)

# Removing the chu prefix before the year
Menai_RMI <- Menai_RMI %>% mutate(Year =gsub("chn", "", Year)) %>% 
  select(-area)

# View the Menai_RMI
View(Menai_RMI)



# TASK 3: Calculate Average Index and Categorize Regions

# Average Residential Mobility Index from 1997 to 2022
RMI_LSOA$Average_Index <- round(
  rowMeans(RMI_LSOA[, grep("^chn\\d{4}$", colnames(RMI_LSOA)), drop = FALSE], na.rm = TRUE), 3
  ) # A new column was created namely Average_Index

# Inspect the data-set (RMI_LSOA)

View(RMI_LSOA)

# Categorize each region into "Low", "Medium", or "High" using the Average_Index
RMI_LSOA$Category <- cut(
  RMI_LSOA$Average_Index, breaks = c(-Inf, 0.2, 0.5, Inf), 
  labels = c("Low", "Medium", "High")
  ) #Another new column was created namely Category

# Display the updated data frame
View(RMI_LSOA) # The two new column is visible in the data-set


# TASK 4: Visualization

# Visualize Menai (Bangor) RMI to gain more insight using a line chart
# Also spot-lighting the years with the RMI between 0.5 and 0.8

line_chart <- ggplot(Menai_RMI, aes(x = Year, y = Index, group = 1)) +
  geom_line(color = "#0077cc", size = 2, linetype = "solid") +
  geom_ribbon(aes(ymax = 0.8, ymin = 0.5), fill = "#b3d9ff", alpha = 0.4) +
  labs(title = "Menai (Bangor) Residential Mobility Index Trends",
       x = "Year",
       y = "Index",
       caption = "Shaded area represents Index between 0.5 and 0.8") +
  theme_minimal() +
  theme(plot.title = element_text(size = 20, face = "bold", color = "#0077cc"), #setting the title font, bold and colour
        axis.title = element_text(size = 12, color = "#333333"),
        axis.text = element_text(size = 12, color = "#555555"), #  giving the chart axis text size and colour
        panel.grid.major = element_line(color = "#e0e0e0"), # major grid line
        panel.grid.minor = element_blank(), # minor grid line
        panel.background = element_rect(fill = "#f5f5f5"), # Chart backgroud
        legend.position = "none") # No need for legend

# Print the line chart
print(line_chart)



# bar chart for the categorization that was generated using average index
bar_chart <- ggplot(RMI_LSOA, aes(x = Category, fill = Category)) +
  geom_bar(alpha = 0.8, color = "white", size = 0.5) +  # Adjust transparency, add border, and reduce border size
  labs(title = "Distribution of Categories Based on Average Index",
       x = "Category",
       y = "Count",
       fill = "Category") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1, color = "black", size = 10),  # Adjust axis text
        axis.text.y = element_text(color = "black", size = 10),  # Adjust y-axis text
        axis.title = element_text(size = 12, face = "bold"),  # Adjust axis title
        plot.title = element_text(size = 16, face = "bold"),  # Adjust plot title
        legend.title = element_blank(),  # Remove legend title
        legend.text = element_text(size = 10),  # Adjust legend text
        panel.grid.major = element_line(color = "gray", size = 0.2),  # Add major grid lines
        panel.grid.minor = element_blank(),  # Remove minor grid lines
        panel.border = element_blank(),  # Remove panel border
        panel.background = element_blank())  # Remove panel background

# Print the impressive bar chart
print(bar_chart)