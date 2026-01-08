CREATE OR REPLACE TABLE `wagon-nutriscore.Final_datasets.H3_country_clean_cat`
AS
-- ======================================================================
-- ÉTAPE 1 : DICTIONNAIRE DE MAPPING DES PAYS (CTE CountryMapping)
-- ======================================================================
WITH CountryMapping AS (
    -- Liste des variations de pays mappées au nom standardisé en anglais
    SELECT 'france' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'frankrijk' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'francia' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'frankreich' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'fr' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'guadeloupe' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'francelareunion' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'francuska' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'francie' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'franca' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'francja' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'saintpierresurdropt' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'ain' AS variation, 'france' AS standard_name UNION ALL
    SELECT 'domtom' AS variation, 'france' AS standard_name UNION ALL

    SELECT 'madagascartoamasina' AS variation, 'madagascar' AS standard_name UNION ALL

    SELECT 'chosni' AS variation, 'japan' AS standard_name UNION ALL

    SELECT 'germany' AS variation, 'germany' AS standard_name UNION ALL
    SELECT 'de' AS variation, 'germany' AS standard_name UNION ALL
    SELECT 'allemagne' AS variation, 'germany' AS standard_name UNION ALL
    SELECT 'alemania' AS variation, 'germany' AS standard_name UNION ALL
    SELECT 'alemanha' AS variation, 'germany' AS standard_name UNION ALL
    SELECT 'deutschland' AS variation, 'germany' AS standard_name UNION ALL
    SELECT 'nemetorszag' AS variation, 'germany' AS standard_name UNION ALL
    SELECT 'nemcy' AS variation, 'germany' AS standard_name UNION ALL
    SELECT 'straufhain' AS variation, 'germany' AS standard_name UNION ALL

    SELECT 'kanada' AS variation, 'canada' AS standard_name UNION ALL

    SELECT 'unitedstates' AS variation, 'united-states' AS standard_name UNION ALL
    SELECT 'estadosunidos' AS variation, 'united-states' AS standard_name UNION ALL
    SELECT 'etatsunis' AS variation, 'united-states' AS standard_name UNION ALL
    SELECT 'us' AS variation, 'united-states' AS standard_name UNION ALL
    SELECT 'statiunitidamerica' AS variation, 'united-states' AS standard_name UNION ALL
    SELECT 'vereinigtestaatenvonamerika' AS variation, 'united-states' AS standard_name UNION ALL
    SELECT 'usa' AS variation, 'united-states' AS standard_name UNION ALL
    SELECT 'stanyzjednoczone' AS variation, 'united-states' AS standard_name UNION ALL

    SELECT 'unitedkingdom' AS variation, 'united-kingdom' AS standard_name UNION ALL
    SELECT 'royaumeuni' AS variation, 'united-kingdom' AS standard_name UNION ALL
    SELECT 'reinounido' AS variation, 'united-kingdom' AS standard_name UNION ALL
    SELECT 'angleterre' AS variation, 'united-kingdom' AS standard_name UNION ALL
    SELECT 'england' AS variation, 'united-kingdom' AS standard_name UNION ALL
    SELECT 'scotland' AS variation, 'united-kingdom' AS standard_name UNION ALL
    SELECT 'wales' AS variation, 'united-kingdom' AS standard_name UNION ALL
    SELECT 'irelanduk' AS variation, 'united-kingdom' AS standard_name UNION ALL
    SELECT 'ireland' AS variation, 'ireland' AS standard_name UNION ALL
    SELECT 'irlande' AS variation, 'ireland' AS standard_name UNION ALL

    SELECT 'belgium' AS variation, 'belgium' AS standard_name UNION ALL
    SELECT 'belgique' AS variation, 'belgium' AS standard_name UNION ALL
    SELECT 'belgie' AS variation, 'belgium' AS standard_name UNION ALL
    SELECT 'belgien' AS variation, 'belgium' AS standard_name UNION ALL
    SELECT 'belgica' AS variation, 'belgium' AS standard_name UNION ALL

    SELECT 'spain' AS variation, 'spain' AS standard_name UNION ALL
    SELECT 'espagne' AS variation, 'spain' AS standard_name UNION ALL
    SELECT 'espanha' AS variation, 'spain' AS standard_name UNION ALL
    SELECT 'spanien' AS variation, 'spain' AS standard_name UNION ALL
    SELECT 'hiszpania' AS variation, 'spain' AS standard_name UNION ALL
    SELECT 'esko' AS variation, 'spain' AS standard_name UNION ALL
    SELECT 'catalunya' AS variation, 'spain' AS standard_name UNION ALL

    SELECT 'netherlands' AS variation, 'netherlands' AS standard_name UNION ALL
    SELECT 'paisesbajos' AS variation, 'netherlands' AS standard_name UNION ALL
    SELECT 'holandia' AS variation, 'netherlands' AS standard_name UNION ALL
    SELECT 'nederland' AS variation, 'netherlands' AS standard_name UNION ALL
    SELECT 'caribbeannetherlands' AS variation, 'netherlands' AS standard_name UNION ALL

    SELECT 'switzerland' AS variation, 'switzerland' AS standard_name UNION ALL
    SELECT 'suisse' AS variation, 'switzerland' AS standard_name UNION ALL
    SELECT 'suiza' AS variation, 'switzerland' AS standard_name UNION ALL
    SELECT 'schweiz' AS variation, 'switzerland' AS standard_name UNION ALL
    SELECT 'svajcs' AS variation, 'switzerland' AS standard_name UNION ALL

    SELECT 'italy' AS variation, 'italy' AS standard_name UNION ALL
    SELECT 'italien' AS variation, 'italy' AS standard_name UNION ALL
    SELECT 'iteland' AS variation, 'italy' AS standard_name UNION ALL

    SELECT 'canada' AS variation, 'canada' AS standard_name UNION ALL
    SELECT 'bccanada' AS variation, 'canada' AS standard_name UNION ALL
    SELECT 'jorsankanada' AS variation, 'canada' AS standard_name UNION ALL
    SELECT 'vancouverbccanada' AS variation, 'canada' AS standard_name UNION ALL
    SELECT 'brasilsowacja' AS variation, 'brazil' AS standard_name UNION ALL
    SELECT 'brazil' AS variation, 'brazil' AS standard_name UNION ALL
    SELECT 'bulgaria' AS variation, 'bulgaria' AS standard_name UNION ALL
    SELECT 'bugarska' AS variation, 'bulgaria' AS standard_name UNION ALL
    SELECT 'croatia' AS variation, 'croatia' AS standard_name UNION ALL
    SELECT 'hrvatska' AS variation, 'croatia' AS standard_name UNION ALL
    SELECT 'denmark' AS variation, 'denmark' AS standard_name UNION ALL
    SELECT 'finland' AS variation, 'finland' AS standard_name UNION ALL
    SELECT 'suomi' AS variation, 'finland' AS standard_name UNION ALL
    SELECT 'hungary' AS variation, 'hungary' AS standard_name UNION ALL
    SELECT 'magyarorszag' AS variation, 'hungary' AS standard_name UNION ALL
    SELECT 'hungria' AS variation, 'hungary' AS standard_name UNION ALL
    SELECT 'luxembourg' AS variation, 'luxembourg' AS standard_name UNION ALL
    SELECT 'poland' AS variation, 'poland' AS standard_name UNION ALL
    SELECT 'polen' AS variation, 'poland' AS standard_name UNION ALL
    SELECT 'polniapolskapolynesiefrancaise' AS variation, 'poland' AS standard_name UNION ALL
    SELECT 'romania' AS variation, 'romania' AS standard_name UNION ALL
    SELECT 'roemenie' AS variation, 'romania' AS standard_name UNION ALL
    SELECT 'russia' AS variation, 'russia' AS standard_name UNION ALL
    SELECT 'rosja' AS variation, 'russia' AS standard_name UNION ALL
    SELECT 'sweden' AS variation, 'sweden' AS standard_name UNION ALL
    SELECT 'sverige' AS variation, 'sweden' AS standard_name UNION ALL
    SELECT 'ukraine' AS variation, 'ukraine' AS standard_name UNION ALL
    SELECT 'maroc' AS variation, 'morocco' AS standard_name UNION ALL
    SELECT 'marruecos' AS variation, 'morocco' AS standard_name UNION ALL
    SELECT 'tunisia' AS variation, 'tunisia' AS standard_name UNION ALL
    SELECT 'turkey' AS variation, 'turkey' AS standard_name UNION ALL
    SELECT 'turkiye' AS variation, 'turkey' AS standard_name UNION ALL
    SELECT 'albania' AS variation, 'albania' AS standard_name UNION ALL
    SELECT 'algeria' AS variation, 'algeria' AS standard_name UNION ALL
    SELECT 'argelia' AS variation, 'algeria' AS standard_name UNION ALL
    SELECT 'algerie' AS variation, 'algeria' AS standard_name UNION ALL
    SELECT 'arabiesaoudite' AS variation, 'saudi-arabia' AS standard_name UNION ALL
    SELECT 'saudiarabia' AS variation, 'saudi-arabia' AS standard_name UNION ALL
    SELECT 'emiratsarabesunis' AS variation, 'united-arab-emirates' AS standard_name UNION ALL
    SELECT 'unitedarabemirates' AS variation, 'united-arab-emirates' AS standard_name

),
-- ======================================================================
-- ÉTAPE 2 : NETTOYAGE DES COLONNES
-- ======================================================================
cleaned_data AS (
  SELECT
    t.nutriscore_grade,
    t.nutriscore_score,
    t.calculated_nutriscore_grade,
    t.calculated_nutriscore_score,
    t.category_group_new,
    t.category_group,
    t.main_category_name,
    t.main_category_level,

    TRIM(LOWER(REPLACE(t.brands, '-', ' '))) AS brand_normalized,
    TRIM(LOWER(REPLACE(
      REGEXP_EXTRACT(t.product_name, r"text': '([^']*)"),
      '-', ' '
    ))) AS new_product_name_clean,

    t.countries_tags,

    ROUND(COALESCE(t.energy_100g, 0.0), 3) AS energy,
    ROUND(COALESCE(t.sugars_100g, 0.0), 3) AS sugar,
    ROUND(COALESCE(t.fat_100g, 0.0), 3) AS fat,
    ROUND(COALESCE(t.salt_100g, 0.0), 3) AS salt,
    ROUND(COALESCE(t.proteins_100g, 0.0), 3) AS protein,
    ROUND(COALESCE(t.saturated_fat_100g, 0.0), 3) AS saturated_fat,
    ROUND(COALESCE(t.fiber_100g, 0.0), 3) AS fiber, 
    ROUND(COALESCE(t.fruits_vegetables_legumes_estimate_from_ingredients_100g, 0.0), 3) AS fru_veg_leg_estimate,

    t.* EXCEPT(
      brands, 
      product_name, 
      countries_tags,
      energy_100g, 
      sugars_100g, 
      fat_100g, 
      salt_100g,
      proteins_100g, 
      saturated_fat_100g,
      fiber_100g,
      fruits_vegetables_legumes_estimate_from_ingredients_100g,
      nutriscore_grade, 
      nutriscore_score,
      calculated_nutriscore_grade, 
      calculated_nutriscore_score,
      category_group_new, 
      main_category_name
    )

  FROM
    `wagon-nutriscore.Final_datasets.with_calculated_nutriscore` AS t
  WHERE
    t.product_name IS NOT NULL
    AND t.brands IS NOT NULL
    AND t.brands != 'None'
    AND LENGTH(TRIM(t.brands)) > 2
    AND t.energy_100g > 0
),
-- ======================================================================
-- ÉTAPE 3 : NETTOYAGE ET STANDARDISATION DES PAYS
-- ======================================================================
product_country_mapping AS (
  SELECT
    cd.* EXCEPT(countries_tags),
    extracted_country,
    -- Colonne de référence NETTOYÉE avec REGEXP_REPLACE
    TRIM(REGEXP_REPLACE(LOWER(COALESCE(REGEXP_EXTRACT(extracted_country, r':(.*)$'), extracted_country)), '[^a-z]', '')) AS cleaned_country_value,

    -- Standardisation de l'entité Pays via la jointure
    COALESCE(cm.standard_name, TRIM(REGEXP_REPLACE(LOWER(COALESCE(REGEXP_EXTRACT(extracted_country, r':(.*)$'), extracted_country)), '[^a-z]', ''))) AS country_standardized

  FROM
    cleaned_data AS cd,
    UNNEST(countries_tags) AS extracted_country
  LEFT JOIN
    CountryMapping AS cm
    ON TRIM(REGEXP_REPLACE(LOWER(COALESCE(REGEXP_EXTRACT(extracted_country, r':(.*)$'), extracted_country)), '[^a-z]', '')) = cm.variation
  WHERE
    LENGTH(TRIM(extracted_country)) > 0
    AND new_product_name_clean IS NOT NULL
)
-- ======================================================================
-- ÉTAPE 4 : CLASSIFICATION GÉOGRAPHIQUE ET PRÉPARATION
-- ======================================================================
SELECT
    brand_normalized AS brand,
    new_product_name_clean AS product,

    t1.country_standardized AS country,

    t1.category_group_new,
    t1.main_category_name,

    t1.energy,
    t1.sugar,
    t1.fat,
    t1.salt,
    t1.protein,
    t1.fiber,
    t1.saturated_fat,
    t1.fru_veg_leg_estimate as fruits_vegetables_legumes,

    -- Classification de la région géographique
    CASE
        WHEN t1.country_standardized IN UNNEST([
            'france', 'fr', 'de', 'germany', 'allemagne', 'spain', 'espana', 'espagne', 'es', 'belgium', 'netherlands', 'lu', 'it', 'gb', 'ie', 'at', 'pt', 'se', 'dk', 'fi', 'pl', 'cz', 'gr', 'ro', 'hu', 'ch', 'no', 'is', 'al', 'ad', 'am', 'az', 'by', 'ba', 'bg', 'hr', 'cy', 'ee', 'ge', 'kz', 'lv', 'li', 'lt', 'mk', 'mt', 'md', 'mc', 'me', 'rs', 'sm', 'sk', 'si', 'tr', 'ua', 'va', 'xk', 'portugal', 'italy', 'austria', 'ireland', 'switzerland', 'unitedkingdom', 'sweden', 'estonia', 'poland', 'greece', 'lithuania', 'croatia', 'finland', 'romania', 'ukraine', 'latvia', 'hungary', 'luxembourg', 'serbia', 'russia', 'deutschland', 'norway', 'denmark', 'bulgaria','cyprus','czech-republic','czech-republic','frankreich','belgica','czechrepublic','polska','slovenia','slovakia','francia','irland','iceland','malta','montenegro','scotland','united-kingdom'
        ]) THEN 'Europe'
        WHEN t1.country_standardized IN UNNEST([
            'cn', 'in', 'jp', 'kr', 'th', 'vn', 'id', 'ph', 'pk', 'sg', 'my', 'hk', 'mo', 'bd', 'kh', 'la', 'np', 'lk', 'mn',
            'mm', 'af', 'bn', 'bt', 'tl', 'mv', 'tw', 'uz', 'tj', 'kg', 'southkorea', 'japan', 'hongkong', 'taiwan',
            'thailand', 'malaysia', 'philippines', 'india','singapore','bangladesh','kazakhstan','indonesia','vietnam','china'
        ]) THEN 'Asia'
        WHEN t1.country_standardized IN UNNEST([
            'sa', 'ae', 'qa', 'kw', 'om', 'bh', 'ir', 'iq', 'il', 'jo', 'lb', 'sy', 'ps', 'ye', 'tr', 'unitedarabemirates', 'oman','turkey','iraq','jordan','lebanon','israel','syria','saudiarabia','qatar','bahrain','kuwait','turkiye','armenia','bosniaandherzegovina','iran','saudi-arabia','united-arab-emirates'
        ]) THEN 'Middle East'
        WHEN t1.country_standardized IN UNNEST([
            'za', 'ng', 'eg', 'ma', 'dz', 'ke', 'gh', 'ci', 'tn', 'sd', 'et', 'cm', 'sn', 'mg', 'ml', 'ao', 'ug', 'zm', 'zw',
            'cd', 'tz', 'rw', 'bi', 'ne', 'bf', 'td', 'gn', 'sl', 'lr', 'na', 'bw', 'sz', 'ls', 'ga', 'cg', 'bj', 'tg', 'er',
            'dj', 'so', 'mr', 'gw', 'cv', 'st', 'km', 'sc', 'reunion', 'mu', 'morocco', 'algeria','egypt','burkinafaso','cameroon','cotedivoire','ghana',"southafrica",'benin','gabon','zambia','tunisia','democraticrepublicofthecongo'
        ]) THEN 'Africa'
        WHEN t1.country_standardized IN UNNEST([
            'us', 'ca', 'mx', 'cu', 'pr', 'jm', 'ht', 'do', 'bs', 'tt', 'bb', 'lc', 'ag', 'gd', 'vc', 'dm', 'kn', 'bz', 'cr',
            'sv', 'gt', 'hn', 'ni', 'pa', 'unitedstates', 'mexico', 'etatsunis', 'estadosunidos', 'canada',"puertorico","estados-unidos",'united-states'
        ]) THEN 'North America'
        WHEN t1.country_standardized IN UNNEST([
            'br', 'ar', 'co', 'pe', 'cl', 've', 'ec', 'bo', 'py', 'uy', 'gy', 'sr', 'gf', 'brazil', 'bolivia', 'chile', 'peru','ecuador','panama','colombia','elsalvador','paraguay','argentina','nicaragua','costarica','venezuela','cuba','uruguay','honduras'
        ]) THEN 'South America'
        WHEN t1.country_standardized IN UNNEST([
            'au', 'nz', 'fj', 'pg', 'sb', 'vu', 'to', 'ws', 'fm', 'ki', 'mh', 'nr', 'pw', 'tv', 'australia', 'frenchpolynesia','new-zealand',"newzealand",'newcaledonia'
        ]) THEN 'Oceania'
        WHEN t1.country_standardized = 'world' THEN 'World'
        ELSE 'Other/Unclassified'
    END AS geographic_region,

    -- Colonnes 'Global'
    COALESCE(
        NULLIF(t1.nutriscore_grade, 'unknown'),
        NULLIF(t1.calculated_nutriscore_grade, 'unknown')
    ) AS global_nutri_grade,

    COALESCE(
        t1.nutriscore_score,
        t1.calculated_nutriscore_score
    ) AS global_nutri_score,

    -- Assignation d'une valeur numérique au grade
    CASE
        WHEN COALESCE(NULLIF(t1.nutriscore_grade, 'unknown'), NULLIF(t1.calculated_nutriscore_grade, 'unknown')) = 'a' THEN 5
        WHEN COALESCE(NULLIF(t1.nutriscore_grade, 'unknown'), NULLIF(t1.calculated_nutriscore_grade, 'unknown')) = 'b' THEN 4
        WHEN COALESCE(NULLIF(t1.nutriscore_grade, 'unknown'), NULLIF(t1.calculated_nutriscore_grade, 'unknown')) = 'c' THEN 3
        WHEN COALESCE(NULLIF(t1.nutriscore_grade, 'unknown'), NULLIF(t1.calculated_nutriscore_grade, 'unknown')) = 'd' THEN 2
        WHEN COALESCE(NULLIF(t1.nutriscore_grade, 'unknown'), NULLIF(t1.calculated_nutriscore_grade, 'unknown')) = 'e' THEN 1
        ELSE NULL
    END AS numeric_grade_value

FROM
    product_country_mapping AS t1
WHERE
    t1.country_standardized IS NOT NULL
    AND TRIM(t1.country_standardized) != ''