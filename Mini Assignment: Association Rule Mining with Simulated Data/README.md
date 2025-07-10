# 🛒 Association Rule Mining with Simulated Transaction Data

This mini-project demonstrates how association rule mining can uncover hidden shopping patterns from transactional data using the **Apriori algorithm**.

---

## 🔍 Objective

To simulate retail transaction data, apply the Apriori algorithm to find frequent itemsets, and generate meaningful **association rules** that reflect common buying behavior.

---

## 🧾 Dataset Description

- Simulated data with **10 fake transactions**
- Each transaction contains **2 to 5 randomly selected items**
- Items are selected from a pool of **8 grocery products**:
  - Bread, Milk, Eggs, Butter, Cheese, Cereal, Juice, Apples

Example transaction:
Transaction 1: ['Bread', 'Milk', 'Butter']
Transaction 2: ['Cheese', 'Juice', 'Apples', 'Cereal']


---

## 🧠 Methodology

1. **One-Hot Encoding**: Converted transactions into a one-hot encoded DataFrame using `TransactionEncoder`.

2. **Frequent Itemsets**: Applied the `Apriori` algorithm (`mlxtend`) with a minimum support threshold of **0.3 (30%)**.

3. **Association Rules**: Generated rules using:
   - **Metric**: Confidence
   - **Minimum Confidence**: 0.7 (70%)

---

## 📈 Sample Rule Extracted

**Rule:**  
*If a customer buys Milk and Bread, they are likely to also buy Butter.*

- **Support**: 0.4  
- **Confidence**: 0.75  
- **Lift**: 1.5

---

## 💡 Real-World Interpretation

This rule indicates that customers who purchase **Milk** and **Bread** are also likely to purchase **Butter** 75% of the time.  
Retailers can use this insight to:
- Organize store layout more effectively (e.g., placing these items nearby)
- Design bundle offers or promotions to increase cross-selling

---

## 💻 Technologies Used

- Python
- Pandas
- Mlxtend
- Jupyter Notebook

---

## 📂 Project Structure

| File/Folder                                  | Description                                       |
|---------------------------------------------|---------------------------------------------------|
| [`association_rules.ipynb`](association_rules.ipynb) | Main Jupyter Notebook with code and analysis     |
| [`README.md`](README.md)                     | Project overview and rule interpretation         |
| [`requirements.txt`](requirements.txt)       | *(Optional)* List of Python libraries used       |


---

## 📌 License

This project is created for academic and educational purposes.

