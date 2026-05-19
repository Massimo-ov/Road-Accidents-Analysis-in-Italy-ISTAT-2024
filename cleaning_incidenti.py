# =====================================
# ROAD ACCIDENTS ANALYSIS — ISTAT 2024
# Data Cleaning & Exploratory Analysis
# =====================================

# =====================================
# IMPORT LIBRARIES
# =====================================

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# =====================================
# LOAD DATASET
# =====================================

df = pd.read_csv(
    "INCSTRAD_Microdati_2024.txt",
    sep="\t",
    header=0,
    encoding="latin1",
    engine="python",
    on_bad_lines="skip"
)

# Preview dataset
print(df.head())


# =====================================
# SELECT RELEVANT COLUMNS
# =====================================

cols = [
    "anno",
    "provincia",
    "comune",
    "tipo_di_strada",
    "condizioni_meteorologiche",
    "natura_incidente",
    "morti_entro_30_giorni",
    "feriti",
    "Ora"
]

df_clean = df[cols]


# =====================================
# DATASET INFO
# =====================================

print(df_clean.info())


# =====================================
# BASIC EXPLORATORY ANALYSIS
# =====================================

# Total deaths
tot_dead = df_clean["morti_entro_30_giorni"].sum()
print("\nTotal deaths:", tot_dead)

# Total injured people
tot_injured = df_clean["feriti"].sum()
print("Total injured:", tot_injured)

# Accidents by road type
print("\nAccidents by road type:")
print(df_clean["tipo_di_strada"].value_counts())

# Deaths by road type
print("\nDeaths by road type:")
print(
    df_clean.groupby("tipo_di_strada")["morti_entro_30_giorni"].sum()
)


# =====================================
# ROAD TYPE RECODING
# =====================================

df_clean["tipo_di_strada_txt"] = df_clean["tipo_di_strada"].map({
    1: "One-way road",
    2: "Two-way road",
    3: "Dual carriageway",
    4: "Multi-lane road"
})


# =====================================
# HOUR CLEANING
# =====================================

# Convert hour column to numeric
df_clean["Ora"] = pd.to_numeric(
    df_clean["Ora"],
    errors="coerce"
)

# Remove invalid/missing hours
df_clean = df_clean[
    (df_clean["Ora"].notna()) &
    (df_clean["Ora"] <= 23)
]

# Create formatted hour column
df_clean["Ora_formattata"] = pd.to_datetime(
    df_clean["Ora"],
    format="%H"
).dt.strftime("%H:%M")


# =====================================
# ACCIDENTS BY HOUR
# =====================================

incidenti_per_ora = (
    df_clean.groupby("Ora_formattata")
    .size()
)

incidenti_per_ora.plot(kind="bar")

plt.title("Road Accidents by Hour")
plt.xlabel("Hour of the Day")
plt.ylabel("Number of Accidents")

plt.show()


# =====================================
# ACCIDENTS BY ROAD TYPE
# =====================================

(
    df_clean["tipo_di_strada_txt"]
    .value_counts()
    .sort_values()
    .plot(kind="barh")
)

plt.title("Road Accidents by Road Type")
plt.xlabel("Number of Accidents")
plt.ylabel("Road Type")

plt.show()


# =====================================
# MORTALITY RATE BY ROAD TYPE
# =====================================

incidenti = (
    df_clean.groupby("tipo_di_strada_txt")
    .size()
)

morti = (
    df_clean.groupby("tipo_di_strada_txt")[
        "morti_entro_30_giorni"
    ].sum()
)

tasso_mortalita = morti / incidenti

tasso_mortalita.sort_values().plot(kind="barh")

plt.title("Mortality Rate by Road Type")
plt.xlabel("Deaths per Accident")
plt.ylabel("Road Type")

plt.show()


# =====================================
# EXPORT CLEAN DATASET
# =====================================

df_clean.to_csv(
    "incidenti_clean.csv",
    index=False
)

print("\nClean dataset exported successfully.")
