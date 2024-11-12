

# Residential Mobility Index Analysis Project

This project explores the Residential Mobility Index (RMI) data from the Consumer Data Research Center, with a focus on understanding mobility trends in the Menai (Bangor) region, categorized by pay range, gender, and age, to identify insights about mobility trends and factors. The project includes data exploration, region-specific analysis, calculations of average RMI scores, and visualizations to make the findings accessible.

## Table of Contents

- [Project Overview](#project-overview)
- [Data Overview](#data-overview)
- [Analysis Workflow](#analysis-workflow)
  - [Data Exploration](#data-exploration)
  - [Menai (Bangor) Index Analysis](#menai-bangor-index-analysis)
  - [Average Index Calculation and Categorization](#average-index-calculation-and-categorization)
  - [Visualization](#visualization)
- [Results and Findings](#results-and-findings)
- [Requirements](#requirements)
- [How to Run](#how-to-run)
- [File Structure](#file-structure)
- [Contributors](#contributors)

---

## Project Overview

This project aims to analyze RMI data across various regions, specifically examining Menai (Bangor) to understand its mobility trends over time. The Menai region's RMI is studied for years where the index falls between specified thresholds, and the dataset as a whole is categorized based on average index scores.

## Data Overview

The dataset consists of multiple columns, including:
- **area**: Area codes for various regions, including "W01000092" (Menai, Bangor).
- **chn1997, chn1998, ... chn2022**: Yearly RMI values from 1997 to 2022.

The dataset is stored as a CSV file and imported for analysis.

## Analysis Workflow

### Data Exploration
1. **Data Import**:
   - The dataset, `hh_churn_lsoa11_2023.csv`, is loaded and structured in a data frame named `RMI_LSOA`.
2. **Exploratory Data Analysis**:
   - Displayed the structure, summary, and first few rows of `RMI_LSOA` to understand the data.

### Menai (Bangor) Index Analysis
1. **Identifying Menai (Bangor)**:
   - Searched the dataset for the Menai (Bangor) area code ("W01000092") and stored its row index.
2. **Filtering Specific RMI Years**:
   - Extracted years during which Menai (Bangor)’s RMI was between 0.5 and 0.8.
3. **Creating Menai-Specific Data Table**:
   - Transformed Menai-specific RMI data into a tidy format for visualization by uniting all yearly indices in a single column.

### Average Index Calculation and Categorization
1. **Calculating Average Index**:
   - Computed the average RMI from 1997 to 2022 for each region, adding this as a new column, `Average_Index`.
2. **Categorizing Regions**:
   - Based on `Average_Index`, categorized regions as "Low", "Medium", or "High", adding this as a `Category` column.

### Visualization
1. **Line Chart for Menai (Bangor)**:
   - A line chart was created to visualize Menai (Bangor)'s RMI trends over time, highlighting years where RMI values fell between 0.5 and 0.8.
   
2. **Bar Chart for Category Distribution**:
   - A bar chart illustrates the distribution of "Low", "Medium", and "High" categories based on `Average_Index`.

## Results and Findings

- **Menai (Bangor) RMI Trends**: Key years where the RMI for Menai (Bangor) was moderate (0.5–0.8) were identified.
- **Region Categorization**: Most regions fell into one of three distinct categories based on average RMI.
- **Visual Insights**:
   - The line chart for Menai (Bangor) provided a clear trend over the years.
   - The bar chart showed the distribution of RMI categories across regions.

## Requirements

- **R (version 4.0 or higher)**
- **R Libraries**:
  - `readr`
  - `tidyr`
  - `dplyr`
  - `ggplot2`

## How to Run

1. **Install Required Packages** (if not already installed):
   ```R
   install.packages(c("readr", "tidyr", "dplyr", "ggplot2"))
   ```

2. **Run the Analysis Script**:
   - Load and run the `rmi_analysis.R` script in RStudio or an R environment:
   ```R
   source("rmi_analysis.R")
   ```

3. **View Results**:
   - Visualizations are displayed in the R environment.
   - Results include two visual outputs saved in PNG format in the project directory.

## File Structure

```plaintext
Project/
├── README.md            # Project overview and documentation
├── Residential Mobility Index Analysis.R       # R script with analysis code
└── data/                # Folder for raw data files

```

## Contributors

- **Azeez Akintonde** - Data Analysis, Visualization, Documentation

