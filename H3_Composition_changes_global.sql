WITH cleaned_data AS (
  SELECT
    TRIM(LOWER(REPLACE(brands, '-', ' '))) AS brand_normalized,
    TRIM(LOWER(REPLACE(
      REGEXP_EXTRACT(product_name, r"text': '([^']*)"), 
      '-', ' '
    ))) AS new_product_name_clean,
    countries_tags,
    ROUND(COALESCE(energy_100g, 0.0), 3) AS energy,
    ROUND(COALESCE(sugars_100g, 0.0), 3) AS sugar,
    ROUND(COALESCE(fat_100g, 0.0), 3) AS fat,
    ROUND(COALESCE(salt_100g, 0.0), 3) AS salt,
    ROUND(COALESCE(additives_n, 0.0), 0) AS additives
  FROM `wagon-nutriscore.openfoodfacts_updated.vc_raw_table_updated`
  WHERE product_name IS NOT NULL AND brands IS NOT NULL AND brands != 'None' AND energy_100g > 0 
),

product_country_mapping AS (
  SELECT 
    brand_normalized, new_product_name_clean,
    energy, sugar, fat, salt, additives, extracted_country 
  FROM cleaned_data, UNNEST(countries_tags) AS extracted_country
  WHERE LENGTH(TRIM(extracted_country)) > 0 
    AND new_product_name_clean IS NOT NULL 
    AND brand_normalized != 'none'
),

-- On calcule les "flags" de variation pour chaque produit
variations_flags AS (
  SELECT
    brand_normalized,
    new_product_name_clean,
    -- Si le sucre change, ça vaut 1, sinon 0
    CASE WHEN COUNT(DISTINCT sugar) > 1 THEN 1 ELSE 0 END as varie_sucre,
    CASE WHEN COUNT(DISTINCT fat) > 1 THEN 1 ELSE 0 END as varie_gras,
    CASE WHEN COUNT(DISTINCT salt) > 1 THEN 1 ELSE 0 END as varie_sel,
    CASE WHEN COUNT(DISTINCT energy) > 1 THEN 1 ELSE 0 END as varie_energie,
    CASE WHEN COUNT(DISTINCT additives) > 1 THEN 1 ELSE 0 END as varie_additifs
  FROM product_country_mapping
  GROUP BY brand_normalized, new_product_name_clean
  HAVING COUNT(DISTINCT extracted_country) >= 2
)

-- Somme finale
SELECT
  COUNT(*) as total_produits_analyses,
  SUM(varie_energie) as nb_changements_energie,
  SUM(varie_sucre) as nb_changements_sucre,
  SUM(varie_gras) as nb_changements_gras,
  SUM(varie_sel) as nb_changements_sel,
  SUM(varie_additifs) as nb_changements_nb_additifs
FROM variations_flags