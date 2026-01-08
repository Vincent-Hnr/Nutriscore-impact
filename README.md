# NutriScore Impact Analysis

![Dashboard Preview](assets/ns_cover.png)

## 📌 Executive Summary
This project evaluates the impact of NutriScore on product composition and distribution strategies. Acting as a consultant for the fictional firm **"FoodSmart"**, I used data-driven insights to help food industry stakeholders optimize product positioning and identify promising markets based on nutritional profiles.

**Key Hypotheses Analyzed:**
* **Formulation Strategy:** Do manufacturers adapt product recipes in countries where NutriScore is active to achieve better ratings?
* **Impact Drivers:** Which specific nutrients have the most significant influence on a product's final score?
* **Optimization:** Can we recommend alternative manufacturing processes to improve NutriScore ratings?

---

## 🛠️ Tech Stack
* **Storage & Querying:** Google BigQuery (SQL)
* **Analysis & Cleaning:** Python (Pandas, Numpy, Scikit-Learn) via Google Colab & VS Code
* **Visualization:** Looker Studio
* **Data Source:** [OpenFood Facts via HuggingFace](https://huggingface.co/datasets/openfoodfacts/product-database)

---

## 📊 Methodology & Workflow
1. **Extraction (BigQuery):** Handled complex data cleaning, including de-duplication and flattening of **nested dictionaries** within the source files. Standardized product names, brands, and country labels.
2. **Processing (VS Code):** Conducted Exploratory Data Analysis (EDA) and handled missing values. Developed a script to **calculate NutriScore** for unrated products.
3. **Visualization (Looker Studio):** Designed an interactive business dashboard for decision-makers to track nutritional trends and market opportunities.

---

## 🚀 Key Insights
* **Insight 1:** While labels significantly influence sales (+7% for A/B rated products; -3.4% for D/E), data shows **no significant change in product composition** specifically in countries that adopted the NutriScore system.
* **Insight 2:** **Salt and additive content** are the primary drivers of negative NutriScore ratings. Reducing these by only a few grams can pivot a product into a higher rating category.
* **Direct Link:** [🔗 View Interactive Looker Studio Dashboard](https://lookerstudio.google.com/reporting/38fc0190-df00-4336-9944-7a4821fe0913)

---

## 📂 Repository Structure
* `/sql`: SQL scripts used for BigQuery extraction and transformation.
* `/assets`: Dashboard screenshots and visualization exports.

---

## 📬 Contact
**Vincent Henrion** - [LinkedIn Profile](https://www.linkedin.com/in/vincent-henrion/)
