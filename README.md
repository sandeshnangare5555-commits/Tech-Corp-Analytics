Markdown
# 📊 Tech-Corp Analytics | Executive BI Suite & Web Dashboard

![Tech Stack](https://img.shields.io/badge/Tech%20Stack-SQL%20%7C%20Power%20BI%20%7C%20Python%20%7C%20HTML5%20%7C%20Chart.js-indigo)
![Project Status](https://img.shields.io/badge/Status-Completed-success)
![UI Theme](https://img.shields.io/badge/UI-Auro%20Dark%20Theme-purple)

An end-to-end Business Intelligence and Data Analytics project analyzing multi-relational enterprise datasets across **5,000+ employees, 1,000+ projects, and ₹260+ Cr in capital allocations**. 

This repository showcases the full analytics lifecycle—from database schema setup in **MySQL** and ETL data cleaning in **Excel** to complex **Power BI DAX modeling** and an interactive, AI-collaborated **web dashboard application**.

---

## 🌐 Live Interactive Dashboard Preview

[![Live Interactive Dashboard](https://img.shields.io/badge/🚀%20Launch-Live%20Interactive%20Dashboard-indigo?style=for-the-badge&logo=githubpages)](https://sandeshnangare5555-commits.github.io/Tech-Corp-Analytics/)

## 🌐 Live Interactive Dashboard Preview

👉 **[Click Here to Open Live Interactive Dashboard](https://sandeshnangare5555-commits.github.io/Tech-Corp-Analytics/)**

---
---

## 📱 3 Executive Analytics Views

1. **Executive C-Suite Overview:** High-level strategic metrics comparing total project capital budgets against organizational salary outlays.
2. **Workforce & Payroll Analytics:** Headcount distribution, department cost centers, and average pay efficiency per employee.
3. **Project Portfolio & Capital Allocation:** Tracking project delivery health (Ongoing, Completed, In Planning, On Hold) and client industry distribution.

---

## 🏗️ System Architecture & Tech Stack

```
┌────────────────────────┐      ┌────────────────────────┐      ┌────────────────────────┐
│  Data Modeling (SQL)   │ ───► │  ETL & Power BI DAX    │ ───► │ Interactive Web UI     │
│ (MySQL Relational Schema)│      │  (Data Transformations) │      │ (HTML / Tailwind / JS) │
└────────────────────────┘      └────────────────────────┘      └────────────────────────┘
Databases: MySQL (DDL, DML, Complex Joins, Aggregations)

Data Processing & Cleaning: Microsoft Excel (Pivot Tables, Data Validation)

Business Intelligence: Power BI Desktop (Star Schema Data Modeling, DAX Measures)

Web Frontend / UI: HTML5, Tailwind CSS, Chart.js, FontAwesome Icons

📈 Key Business Questions Solved
Capital vs. Payroll Efficiency: Evaluates whether high-budget departments (like IT and Engineering) maintain proportional revenue and output relative to their ₹69.00 Cr annual payroll expenditure.

Workforce Headcount Optimization: Identifies workforce ratios across 10 organizational departments to balance staffing demands and prevent over-allocation.

Project Portfolio Health: Tracks project risk by identifying stalled projects ("On Hold") versus active and completed deliverables.

🧮 Sample DAX Measures (Power BI)
Code snippet
// 1. Total Project Capital Allocated
Total Project Budget = SUM(Fact_Projects[AllocatedBudget])

// 2. Year-over-Year Budget Growth %
YoY Budget Growth = 
VAR CurrentYearBudget = [Total Project Budget]
VAR PreviousYearBudget = CALCULATE([Total Project Budget], SAMEPERIODLASTYEAR(Dim_Calendar[Date]))
RETURN
DIVIDE(CurrentYearBudget - PreviousYearBudget, PreviousYearBudget, 0)

// 3. Salary-to-Budget Expense Ratio
Salary Expense Ratio = DIVIDE(SUM(Fact_Payroll[SalaryAmount]), [Total Project Budget], 0)
📁 Repository Structure
Plaintext
Tech-Corp-Analytics/
│
├── Datasets/                 # Raw and processed CSV/Excel files
│   ├── Employees.csv
│   ├── Departments.csv
│   └── Projects.csv
│
├── SQL/                      # MySQL scripts for table creation and analytics
│   ├── schema_setup.sql
│   └── analytics_queries.sql
│
├── Excel/                    # Excel workbooks with pivot analysis
│   └── Data_Cleaning_Pipeline.xlsx
│
├── Power BI/                 # Power BI project file with DAX measures
│   └── Tech_Corp_Analytics.pbix
│
├── index.html                # Main Interactive Web Dashboard (HTML/Chart.js)
└── README.md                 # Project Documentation
🚀 How to Run the Project Locally
Clone the Repository:

Bash
git clone [https://github.com/sandeshnangare5555-commits/Tech-Corp-Analytics.git](https://github.com/sandeshnangare5555-commits/Tech-Corp-Analytics.git)
Launch the Web Dashboard:

Double-click index.html in your file explorer to open the interactive dashboard in any modern web browser (Chrome, Edge, Firefox, Safari).

Explore Power BI File:

Open Power BI/Tech_Corp_Analytics.pbix in Power BI Desktop to review the underlying star-schema data model and DAX formulas.

👤 Author & Contact
Sandesh Navnath Nangare

Aspiring AI Engineer & Data Analyst 
```
💼 LinkedIn: www.linkedin.com/in/sandesh-nangare-054434321


🐙 GitHub: https://github.com/sandeshnangare5555-commits/Tech-Corp-Analytics


If you find this project insightful, feel free to give it a ⭐️ on GitHub!
