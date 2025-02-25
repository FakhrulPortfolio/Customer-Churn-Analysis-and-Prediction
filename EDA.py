import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.read_csv("cleaned_Cust_Churn.csv")

# Convert categorical columns to string
cat_cols = ['gender', 'Partner', 'Dependents', 'InternetService', 'Contract', 'Churn']
df[cat_cols] = df[cat_cols].astype(str)

# Convert Churn column to binary
df['Churn'] = df['Churn'].apply(lambda x: 1 if x == 'Yes' else 0)

# Check dataset summary
df.info()
df.describe()

# visualize churn distribution
sns.countplot(x='Churn', data=df)
plt.title("Customer Churn Distribution")
plt.show()

#visualize monthlycharges vs churn
sns.boxplot(x='Churn', y='MonthlyCharges', data=df)
plt.title("Monthly Charges vs Churn")
plt.show()

#visualize contracttype vs churn
sns.countplot(x='Contract', hue='Churn', data=df)
plt.title("Contract Type vs Churn")
plt.show()
