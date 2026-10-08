# Netflix Originals Data Analysis — SQL Project

## 📌 Project Overview

**Netflix Originals Data Analysis** is a SQL-based data analytics project developed using **PostgreSQL** to explore Netflix Originals data and identify patterns across content, genres, and IMDb ratings.

The project focuses on database design, SQL querying, relational data analysis, and business-oriented insights.

**Database:** `netflix_originals_db`  
**Database Management System:** PostgreSQL  
**Primary Table:** `Netflix_Originals`  
**Related Table:** `Genre_Details`

---

## 🎯 Project Objectives

The main objectives of this project are to:

1. Create a structured PostgreSQL database for Netflix Originals data.
2. Design relational tables to organize content and genre information.
3. Explore and analyze **584 Netflix Originals records**.
4. Develop SQL queries to investigate content and rating trends.
5. Analyze relationships between titles and genres.
6. Rank Netflix titles based on IMDb scores.
7. Identify genre-level patterns using SQL aggregation and analysis.

---

## 📊 Dataset Overview

The dataset contains **584 Netflix Originals records** across **6 data attributes**.

The analysis covers content information and IMDb rating-related data.

### Dataset Scale

| Metric | Value |
|---|---:|
| Netflix Originals Records | **584** |
| Data Attributes | **6** |
| Genres Analyzed | **19** |
| Relational Tables | **2** |
| SQL Analysis Queries | **11** |

---

# 🗄️ Database Design

The project uses a relational database structure with two tables:

### 1. `Netflix_Originals`

Stores information related to Netflix Original titles.

### 2. `Genre_Details`

Stores genre-related information used for relational analysis.

The two-table structure helps organize content and genre information separately and supports relational SQL analysis.

---

## 🏗️ Database Setup

### Create Database

```sql
CREATE DATABASE netflix_originals_db;
```

Connect to the database before creating and analyzing the project tables.

---

# 🔍 Data Exploration & Analysis

The project contains **11 SQL analysis queries** covering different aspects of Netflix Originals data.

The analysis uses:

- Filtering
- Aggregation
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `LIMIT`
- `JOIN`
- Subqueries
- Window Functions
- `RANK()`

---

# 📈 Key Analysis Areas

## 🎬 Content Analysis

Analyze Netflix Original titles and their associated attributes to understand content distribution.

---

## 🎭 Genre Analysis

Analyze Netflix Originals across **19 genres** to identify genre-level patterns and compare content performance.

---

## ⭐ IMDb Rating Analysis

Analyze IMDb scores to identify titles with higher ratings and compare ratings across content and genres.

---

## 🏆 Title Ranking

The project uses the `RANK()` window function to rank Netflix titles based on IMDb scores.

Example SQL approach:

```sql
RANK() OVER (
    ORDER BY imdb_score DESC
)
```

This allows titles to be ranked without losing the underlying dataset structure.

---

# 🧠 SQL Concepts Demonstrated

This project demonstrates practical PostgreSQL and SQL skills including:

### Basic SQL

- `SELECT`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `DISTINCT`

### Aggregation

- `COUNT()`
- `AVG()`
- `SUM()`
- `GROUP BY`
- `HAVING`

### Advanced SQL

- `JOIN`
- Subqueries
- Window Functions
- `RANK()`

### Data Analysis

- Content analysis
- Genre analysis
- Rating analysis
- Ranking
- Trend identification

---

# 💼 Business Questions

The project uses SQL to answer practical analytical questions such as:

1. How many Netflix Originals are included in the dataset?
2. What genres are represented in the dataset?
3. How is Netflix content distributed across genres?
4. Which genres contain more titles?
5. Which titles have higher IMDb ratings?
6. How can titles be ranked according to IMDb score?
7. What relationships exist between titles and genres?
8. How do IMDb ratings vary across genres?
9. Which titles stand out based on their ratings?
10. What patterns can be identified from the content data?
11. Which genres and titles are most relevant based on the analysis?

---

# 📋 Project Highlights

- Analyzed **584 Netflix Originals records**.
- Worked with **6 data attributes**.
- Designed a **2-table relational database**.
- Developed **11 SQL analysis queries**.
- Analyzed content across **19 genres**.
- Used `GROUP BY`, `HAVING`, `ORDER BY`, and `LIMIT`.
- Implemented `JOINs` and subqueries for relational analysis.
- Applied the `RANK()` window function to rank titles by IMDb score.
- Used PostgreSQL for database creation and analysis.

---

# 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| **PostgreSQL** | Database management |
| **SQL** | Data analysis |
| **GROUP BY / HAVING** | Aggregation and filtering |
| **JOINs** | Relational analysis |
| **Subqueries** | Advanced analysis |
| **Window Functions** | Ranking and analytical calculations |
| **RANK()** | IMDb title ranking |

---

# 📌 Project Outcome

This project demonstrates how PostgreSQL and SQL can be used to transform structured Netflix content data into meaningful analytical insights.

The project provides practical experience in **relational database design, SQL querying, data aggregation, genre analysis, rating analysis, and business-oriented data analysis**.

---
