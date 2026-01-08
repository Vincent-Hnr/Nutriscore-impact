# Nutriscore-impact

![Aperçu du Dashboard](assets/ns_cover.png)

## 📌 Résumé du Projet
Etudier l'impact du NutriScore sur la composition des produits et leur stratégie de distribution.
On imagine un cabinet de consulting "*FoodSmart*" qui utilise la data pour aiders les acteurs du food industry à positionner leur produits selon leur composition, et à identifier les marchés les plus porteurs en fonction de la composition moyenne des produits distribués.

Hypothèses analysées : 
- Est ce que les fabricants changent la composition de leur produit dans les pays ou le NutriScore est actif pour avoir une meilleur note ?
- Quels sont les nutriments ayant le plus fort impact sur la notation finale d'un produit ?
- Est il possible de recommander des procédés de compositions alternatifs pour améliorer la notation d'un produit ? 

---

## 🛠️ Stack Technique
* **Stockage & Requêtage :** Google BigQuery (SQL)
* **Analyse & Nettoyage :** Python (Pandas, Numpy, SKlearn) via Google Colab & VSCode
* **Visualisation :** Looker Studio
* **Source des données :** [[Openfood facts @huggingface](https://huggingface.co/datasets/openfoodfacts/product-database)]

---

## 📊 Méthodologie & Étapes
1.  **Extraction (BigQuery) :** Nettoyage des doublons et des nested dictionaries dans le fichier source. Uniformisation des noms de produits, de marques et de pays. 
2.  **Traitement (VSCode) :** Analyse exploratoire (EDA), gestion des valeurs manquantes. Calcul du NutriScore des produits non notés.
3.  **Visualisation (Looker) :** Création d'un dashboard interactif pour les décideurs.

---

## 🚀 Résultats Clés
* **Insight 1 :** Malgré un impact évident sur les ventes (+7% pour les produits label A/B ; -3,4% pour les produits label D/E), on n'observe pas de différence de composition dans les pays ayant adopté la notation européenne NutriScore.
* **Insight 2 :** Les teneurs en Sel et en additifs sont les éléments les plus impactants sur la notation finale du NutriScore. En diminuant ces valeurs de quelques grammes, on peut impacter positivement la notation d'un produit.
* **Lien direct :** [[🔗 Consulter le Dashboard Interactif Looker Studio](https://lookerstudio.google.com/reporting/38fc0190-df00-4336-9944-7a4821fe0913)]

---

## 📂 Structure du Repo
* `/sql` : Contient les scripts `.sql` utilisés dans BigQuery.
* `/assets` : Captures d'écran et graphiques.

---

## 📬 Contact
[Vincent Henrion]
