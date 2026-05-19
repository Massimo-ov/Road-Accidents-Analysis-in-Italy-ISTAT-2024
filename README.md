# 🚗 Road Accidents Analysis in Italy — ISTAT 2024

## 📌 Overview

This project is an end-to-end educational data analytics project built using official Italian road accidents microdata provided by ISTAT.

The main goal of the project was to practice and consolidate practical skills in:

- data cleaning
- exploratory analysis
- SQL querying
- data modeling
- KPI creation
- Power BI dashboarding
- data visualization and storytelling

The project follows a simplified real-world analytics workflow:

```text
Raw Dataset → Python Cleaning → SQL Modeling → Power BI Dashboard
```

---

# 📊 Dataset

### Source
ISTAT — Italian National Institute of Statistics

### Dataset
Italian Road Accidents Microdata (2024)

The original dataset was provided as a raw text file containing detailed information about road accidents in Italy.

---

# 🐍 Python — Data Cleaning & Preparation

Python was used to:

- load and parse the raw ISTAT dataset
- select relevant variables
- clean and format columns
- perform basic exploratory analysis
- recode categorical variables
- export a cleaned CSV dataset

### Main libraries used

- Pandas
- NumPy
- Matplotlib

### Key transformations

- road type recoding
- hourly accident formatting
- invalid/missing hour handling
- exploratory aggregations and visualizations

The cleaned dataset was then exported and used for SQL analysis and Power BI modeling.

---

# 🗄️ SQL — Data Modeling & Analysis

SQL was used to:

- perform aggregations and KPI calculations
- explore accident patterns
- calculate mortality indicators
- create dimensional tables for provinces and regions
- build a relational model for Power BI

### Main SQL concepts practiced

- GROUP BY
- SUM / COUNT aggregations
- JOIN operations
- dimension tables
- basic star-schema modeling concepts

---

# 📍 Custom Dimension Tables

Using ISTAT metadata, two custom dimension tables were created:

## Provinces Table
Mapping province codes to province names.

## Regions Table
Mapping province codes to Italian regions.

These tables enabled geographic analysis and dashboard filtering inside Power BI.

---

# 📈 Power BI Dashboard

The cleaned and modeled datasets were imported into Power BI to create an interactive dashboard focused on:

- accident distribution across Italy
- regional comparisons
- mortality and severity indicators
- weather conditions
- road types
- hourly accident trends

### Dashboard features

- KPI cards
- interactive maps
- regional rankings
- filtering interactions
- comparative charts
- temporal analysis

---

# 🧠 Key Learning Outcomes

Through this project I practiced:

- real dataset handling
- data cleaning workflows
- relational thinking
- SQL querying
- Power BI relationships and cardinality
- DAX measures
- dashboard design and storytelling

This project was developed primarily for educational purposes as part of my learning journey in Data Analytics and Business Intelligence.

---

# 🛠️ Technologies Used

- Python (Pandas, NumPy, Matplotlib)
- SQL (SQLite)
- Power BI

---

# 📂 Project Structure

```text
/project

│── python/
│   └── cleaning_incidenti.py

│── sql/
│   └── analisi_incidenti.sql

│── powerbi/
│   └── progetto_incidenti.pbix

│── data/
│   └── incidenti_clean.csv
│   └── province.csv
│   └── province_regioni.csv

│── pdf/
│   └── progetto_incidenti.pdf
```

---

# 📌 Project Files

- 📘 README
- 🐍 Python Cleaning Script
- 🗄️ SQL Analysis Script
- 📊 Power BI Dashboard

---

# 📌 Notes

This project was created with a strong educational focus in order to practice real-world data analytics workflows using Python, SQL and Power BI on a real ISTAT dataset.
