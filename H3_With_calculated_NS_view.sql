
-- CREATE OR REPLACE TABLE `wagon-nutriscore.Final_datasets.with_calculated_nutriscore` AS(
SELECT 
  main.brands, 
  main.product_name, 
  REGEXP_EXTRACT(main.product_name, r"text': '([^']*)") AS product_name_clean,
  main.code,
  main.compared_to_category,
  main.nutriscore_grade, 
  main.nutriscore_score, 
  main.countries_tags, 
  main.saturated_fat_100g, 
  main.sodium_100g, 
  main.salt_100g, 
  main.fat_100g, 
  main.fiber_100g,
  main.proteins_100g, 
  main.sugars_100g, 
  main.energy_100g, 
  main.fruits_vegetables_legumes_estimate_from_ingredients_100g,
  main.with_non_nutritive_sweeteners,
  main.category_group_new, 
  main.N_energy, 
  main.N_saturated_fat, 
  main.N_sugars, 
  main.N_salt, 
  main.P_proteins, 
  main.P_fiber, 
  main.P_fruits_vegetables_legumes, 
  main.N_fats_energy_from_saturates, 
  main.N_fats_saturateslipids, 
  main.N_beverages_energy, 
  main.N_beverages_sugars, 
  main.N_beverages_sweeteners, 
  main.P_beverages_proteins, 
  main.P_beverages_fruits_vegetables_legumes, 
  main.calculated_nutriscore_score, 
  main.calculated_nutriscore_grade,
  cat.additives_clean,
  cat.categories_tags_clean,
  cat.category_group,
  cat.main_category_id,
  cat.main_category_code,
  cat.main_category_name,
  cat.main_category_level,
  cat.main_category_n_products,
FROM `wagon-nutriscore.post_cleaned_data.updated_opendfoodfacts_clean_with_calculated_nutriscore` AS main
LEFT JOIN `wagon-nutriscore.openfoodfacts_updated.v_product_main_category` AS cat
USING (code)
  WHERE (IFNULL(main.saturated_fat_100g,0) < 100
  AND IFNULL(main.sodium_100g,0) < 100
  AND IFNULL(main.salt_100g,0) < 100
  AND IFNULL(main.fat_100g,0) < 100
  AND IFNULL(main.fiber_100g,0) < 100
  AND IFNULL(main.proteins_100g,0) < 100
  AND IFNULL(main.sugars_100g,0) < 100)
  AND IFNULL(main.energy_100g,0) < 4000
