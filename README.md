# Customer-Churn-Analysis-and-Prediction
This project aims to analyze customer churn patterns and predict churn using SQL, Python, and Machine Learning (Regression &amp; Decision Trees).

**🎯 Objective:**  
Predict customer churn using **Logistic Regression** and **Decision Tree**, while analyzing key factors like tenure, contract type, and monthly charges.  

**🛠️ Steps Involved:**  

**1️⃣ Data Collection & Cleaning (SQL)**  
- Import **customer churn dataset** into MySQL.  
- Handle missing values, remove duplicates, and categorize tenure into groups.  

**2️⃣ Exploratory Data Analysis (Python & Power BI)**  
- **SQL Queries**: Count missing values, group by contract types, and analyze churn patterns.  
- **Power BI Dashboard**: Create **pivot tables, bar charts, and slicers** to visualize trends.  

**3️⃣ Predictive Modeling (Python – Logistic Regression & Decision Tree)**  

💡 **Why Logistic Regression?**  
- Logistic Regression is used for **binary classification** (Churn = Yes/No).  
- It calculates the probability of a customer leaving based on tenure, charges, etc.  

📌 **Key Output:**  
- **Odds Ratio Interpretation**: Higher monthly charges → higher churn probability.  

💡 **Why Decision Tree?**  
- A Decision Tree helps visualize how different customer attributes lead to churn.  
- It segments customers into groups based on rules (e.g., "If contract = Month-to-Month and tenure < 12 months, high churn risk").  

📌 **Key Output:**  
- Identifies **top churn factors** (e.g., short tenure & high monthly charges).  

**📊 Insights from Regression & Decision Tree**  
| **Factor** | **Impact on Churn** |  
|-----------|----------------|  
| **Short Tenure (< 12 months)** | 🚨 High churn risk |  
| **Month-to-Month Contracts** | 🚨 High churn risk |  
| **Higher Monthly Charges** | 📈 Increases churn probability |  

**✅ Final Deliverables:**  
1️⃣ **SQL Queries & Processed Data**  
2️⃣ **Power BI Dashboard with Churn Insights**  
3️⃣ **Python Model (Logistic Regression & Decision Tree)**  
