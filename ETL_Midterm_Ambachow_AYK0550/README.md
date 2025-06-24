# DSA2040A\_ETL\_Midterm\_Ayk\_123

### Midterm ETL Project – Data Warehousing & Mining

Author: Ayk (ID: 123)
Instructor: Austin Odera
Course: DSA 2040 A (US 2025)

---

## 📁 Project Overview

This repository showcases a full **ETL (Extract → Transform → Load)** pipeline for retail sales data. The project includes:

* Structured data extraction from CSV files
* Comprehensive data cleaning, formatting, and enrichment
* Loading into SQLite databases for efficient querying and storage

---

## 📂 Repository Structure

### 🔗 [ETL\_Midterm\_Ayk\_123](https://github.com/yourusername/ETL_Midterm_Ayk_123/)

| Path                                                                                                                    | Description                                 |
| ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------- |
| 📁 [data](https://github.com/yourusername/ETL_Midterm_Ayk_123/tree/main/data)                                           | Folder with raw input CSVs                  |
| ├── 📄 [raw\_data.csv](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/data/raw_data.csv)                 | Main raw dataset (100 records)              |
| └── 📄 [incremental\_data.csv](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/data/incremental_data.csv) | Additional new batch (10 records)           |
| 📁 [loaded](https://github.com/yourusername/ETL_Midterm_Ayk_123/tree/main/loaded)                                       | Folder with output databases                |
| ├── 📄 [full\_data.db](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/loaded/full_data.db)               | Cleaned complete dataset in SQLite          |
| └── 📄 [incremental\_data.db](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/loaded/incremental_data.db) | Cleaned incremental data in SQLite          |
| 📒 [etl\_extract.ipynb](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/etl_extract.ipynb)                | Load and explore raw data                   |
| 📒 [etl\_transform.ipynb](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/etl_transform.ipynb)            | Clean, impute, and enrich datasets          |
| 📒 [etl\_load.ipynb](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/etl_load.ipynb)                      | Load cleaned data into SQLite DBs           |
| 📟 [wrangle\_and\_load.py](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/wrangle_and_load.py)           | Script with `wrangle_data()` and load logic |
| 📄 [.gitignore](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/.gitignore)                               | Excludes DB/parquet/temp files from Git     |
| 📄 [README.md](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/README.md)                                 | This documentation file                     |

---

## 🔄 ETL Pipeline

### 1️⃣ Extract ([etl\_extract.ipynb](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/etl_extract.ipynb))

* Load raw datasets using `pandas.read_csv()`
* Explore with `.info()`, `.describe()`, `.head()`
* Check missing values, data types, outliers, and duplicates

### 2️⃣ Transform ([etl\_transform.ipynb](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/etl_transform.ipynb), [wrangle\_and\_load.py](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/wrangle_and_load.py))

* **Text Normalization**: Clean `customer_name`, `product`, and `region` using `.str.strip()`, `.title()`, and regex
* **Missing Value Handling**:

  * `customer_name`: Fill NA with "Unknown"
  * `product`: Impute using historical `unit_price` mapping
  * `quantity`: Use median by product → customer → global
  * `unit_price`: Use mode by product+region, fallback to forward fill. which is done by the following descriptive analysis.
  ![image](https://github.com/user-attachments/assets/0cb41cc6-5821-4d05-9ae3-1dacbb9e3dac)
### Key Observations
- **West** region has wide price ranges and several outliers → inconsistent pricing.
- **East** and **North** have more uniform prices.
- **Phones in South** show large price variation → check needed.
  * `order_date`: Convert to datetime, forward-fill
  * `region`: Title-case and fill with mode
* **Derived Features**:

  * `total_price = quantity × unit_price`
  * `price_tier`: Categorical bin (Low, Medium, High, Premium)

### 3️⃣ Load ([etl\_load.ipynb](https://github.com/yourusername/ETL_Midterm_Ayk_123/blob/main/etl_load.ipynb))

* Export cleaned data into SQLite databases
* Preview saved records using `SELECT * LIMIT 5`
* Databases created:

  * `loaded/full_data.db`
  * `loaded/incremental_data.db`

---

## 🛠 Tools & Technologies

* **Python 3.11**
* **pandas** – data manipulation
* **sqlite3** – lightweight relational DB
* **Jupyter Notebooks** (via VS Code)
* **re** (Regular Expressions) – for cleaning text

---

## ▶ How to Run This Project

```bash
# Step 1: Clone the repository
https://github.com/yourusername/ETL_Midterm_Ayk_123.git
cd ETL_Midterm_Ayk_123

# Step 2: Open in JupyterLab or VS Code
jupyter notebook

# Step 3 (optional): Run full transformation pipeline
python wrangle_and_load.py
```

---

## ✅ Deliverables

* 📄 Cleaned CSVs and SQLite DBs
* 💡 Modular, reusable ETL code
* 📈 Exploratory + pipeline notebooks
* 📖 This professional README documentation

---

**Maintained by:** Ayk (Student ID: 123)
This repository fulfills the ETL midterm submission requirements for DSA 2040A.
