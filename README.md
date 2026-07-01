# 🔍 Financial Fraud Transaction Analysis

> End-to-end data analytics project detecting fraud patterns across 10,000 financial transactions using SQL, Python, and Power BI.

---

## 📌 Project Overview

This project analyzes **10,000 financial transactions** to uncover fraud patterns, quantify risk factors, and deliver actionable recommendations for fraud prevention. The analysis pipeline covers the full data workflow — from raw CSV to a live interactive Power BI dashboard — using **SQL** for querying, **Python** for exploratory analysis and visualization, and **Power BI** for business reporting.

**Key Result:** Identified a **5% fraud rate** accounting for **46.52% of total transaction value** (₹828.79K in fraud losses), and built a data-driven framework to reduce this by an estimated **60–70%**.

---

## 🎯 Objectives

- Explore and clean a synthetic financial fraud dataset
- Write SQL queries to answer key business questions about fraud risk
- Perform statistical and correlation analysis in Python
- Visualize fraud patterns using Matplotlib
- Build an interactive Power BI dashboard for stakeholders
- Translate findings into concrete, actionable business recommendations

---

## 🗃️ Dataset

| Attribute | Description |
|---|---|
| **Rows** | 10,000 transactions |
| **Columns** | 10 (+2 engineered) |
| **Fraud Rate** | 5.00% |
| **Total Volume** | ₹1,781,427.63 |
| **Fraud Amount** | ₹828,788.99 |

**Columns:**
| Column | Type | Description |
|---|---|---|
| `transaction_id` | int | Unique transaction identifier |
| `user_id` | int | Customer identifier |
| `amount` | float | Transaction value |
| `transaction_type` | object | ATM / Online / POS / QR |
| `merchant_category` | object | Food / Travel / Electronics / Clothing / Grocery |
| `country` | object | US / UK / FR / DE / TR / NG |
| `hour` | int | Hour of transaction (0–23) |
| `device_risk_score` | float | Device-based risk score (0–1) |
| `ip_risk_score` | float | IP-based risk score (0–1) |
| `is_fraud` | int | Target variable (0 = legit, 1 = fraud) |
| `amount_range` *(engineered)* | category | Binned transaction amount |
| `time_period` *(engineered)* | category | Night / Morning / Afternoon / Evening |

> **Note:** Dataset is synthetic and used for educational/portfolio purposes only.

---

## 🛠️ Tech Stack

| Layer | Tools |
|---|---|
| **Data Storage** | PostgreSQL |
| **Data Analysis** | Python (Pandas, NumPy) |
| **Visualization** | Matplotlib, Power BI |
| **Database Connectivity** | SQLAlchemy, psycopg2 |
| **Environment** | Jupyter Notebook |

---

## 📁 Repository Structure

```
financial-fraud-analysis/
│
├── data/
│   └── synthetic_fraud_dataset.csv          # Raw dataset
│
├── notebooks/
│   └── Project2.ipynb                       # Full Python EDA & analysis
│
├── sql/
│   └── fraud_transactionsSQL.sql            # 10 analytical SQL queries
│
├── dashboard/
│   ├── fraud_dashboard.pbix                 # Power BI dashboard file
│   └── dashboard_screenshot.png             # Dashboard preview image
│
├── visuals/
│   └── fraud_analysis_dashboard.png         # Matplotlib summary dashboard
│
├── reports/
│   └── Financial_Fraud_Analysis_Report.pdf  # Full project report
│
├── README.md
└── requirements.txt
```

---

## 📊 Key Findings

### Fraud Rate by Transaction Type
| Type | Fraud Rate |
|---|---|
| ATM | **5.46%** 🔴 |
| Online | 5.26% |
| QR | 4.79% |
| POS | 4.52% |

### Highest-Risk Countries
| Country | Fraud Rate |
|---|---|
| 🇳🇬 Nigeria | **100%** 🚨 |
| 🇺🇸 US | 4.73% |
| 🇬🇧 UK | 4.33% |

### Highest-Risk Merchant Category
**Clothing** — 5.50% fraud rate

### Temporal Risk
**Night transactions (12 AM–6 AM)**: **28.55%** fraud rate — nearly **9x higher** than any other time period.

### Amount Thresholds
Transactions **above ₹500** show a **100% fraud rate** in this dataset, signaling a critical verification threshold.

### Risk Score Validation
| Metric | Fraud Avg | Legit Avg | Correlation with Fraud |
|---|---|---|---|
| Device Risk Score | 0.86 | 0.15 | **0.87** |
| IP Risk Score | 0.87 | 0.16 | **0.87** |

Both risk scores show **very strong correlation** with actual fraud outcomes, validating their use as a real-time screening signal.

---

## 📈 Dashboard Preview

![Dashboard Preview](dashboard/dashboard_screenshot.png)

**Features:**
- 5 KPI cards (fraud count, fraud rate, transaction volume, loss amount)
- Interactive transaction type filter
- Geographic fraud heat map
- Fraud rate breakdown by payment type
- Donut chart: fraud vs. legitimate transaction value

---

## 💡 Recommendations

| Priority | Recommendation |
|---|---|
| 🔴 High | Block/flag transactions from Nigeria pending enhanced verification |
| 🔴 High | Require step-up authentication for transactions above ₹500 |
| 🔴 High | Apply enhanced monitoring for 12 AM–6 AM transactions |
| 🟡 Medium | Deploy real-time risk scoring; auto-decline scores > 0.70 |
| 🟡 Medium | Increase scrutiny on Clothing & Travel merchant categories |
| 🟢 Long-term | Train a supervised ML classifier using engineered risk features |

**Estimated Impact:** 60–70% reduction in fraud losses (~₹497K–₹580K annually) if recommendations are implemented.

---

## 🚀 Future Work

- [ ] Build a supervised ML model (Logistic Regression / Random Forest / XGBoost) to predict fraud in real time
- [ ] Add SHAP/feature importance analysis for model explainability
- [ ] Deploy a Streamlit app for live fraud scoring
- [ ] Automate the SQL → Power BI refresh pipeline
- [ ] Expand dataset with real-world (anonymized) transaction data

---

## 👤 Author

**[Rishab Chakraborty]**
BCom Student | Data Analyst
📍 Dibrugarh, Assam

- 🔗 [LinkedIn](#)
- 🐙 [GitHub](#)
- 📧 your.email@example.com

---


📧 your.email@example.com | 🔗 linkedin.com/in/yourname
