
WITH with_energy AS(
SELECT * FROM 
`wagon-nutriscore.Final_datasets.with_calculated_nutriscore` 
WHERE energy_100g IS NOT NULL
)

SELECT
product_name_clean,
ROUND(AVG(saturated_fat_100g),2) AS avg_saturated_fat,
ROUND(AVG(sodium_100g),2) AS avg_sodium,
ROUND(AVG(salt_100g),2) AS avg_salt,
ROUND(AVG(fat_100g),2) AS avg_fats,
ROUND(AVG(proteins_100g),2) AS avg_proteins,
ROUND(AVG(sugars_100g),2) AS avg_sugars,
ROUND(AVG(energy_100g),2) AS avg_energy,
ROUND(AVG(fruits_vegetables_legumes_estimate_from_ingredients_100g),2) AS     avg_fruits_vegetables_legumes,
ROUND(AVG(with_non_nutritive_sweeteners),2) AS avg_with_non_nutritive_sweeteners,
ROUND(AVG(nutriscore_score),2) AS avg_nutriscore_score,
ROUND(AVG(calculated_nutriscore_score),2) AS avg_calculated_nutriscore_score,
ROUND(AVG(N_energy),2) AS avg_N_energy,
ROUND(AVG(N_saturated_fat),2) AS avg_N_saturated_fat,
ROUND(AVG(N_sugars),2) AS avg_N_sugars, 
ROUND(AVG(N_salt),2) AS avg_N_salt, 
ROUND(AVG(P_proteins),2) AS avg_P_proteins,
ROUND(AVG(P_fiber),2) AS avg_P_fiber, 
ROUND(AVG(P_fruits_vegetables_legumes),2) AS avg_P_fruits_vegetables_legumes, 
ROUND(AVG(N_fats_energy_from_saturates),2) AS avg_N_fats_energy_from_saturates, 
ROUND(AVG(N_fats_saturateslipids),2) AS avg_N_fats_saturateslipids, 
ROUND(AVG(N_beverages_energy),2) AS avg_N_beverages_energy, 
ROUND(AVG(N_beverages_sugars),2) AS avg_N_beverages_sugars, 
ROUND(AVG(N_beverages_sweeteners),2) AS avg_N_beverages_sweeteners, 
ROUND(AVG(P_beverages_proteins),2) AS avg_P_beverages_proteins, 
ROUND(AVG(P_beverages_fruits_vegetables_legumes),2) AS avg_P_beverages_fruits_vegetables_legumes

FROM with_energy 
GROUP BY product_name_clean
