WITH grade_frequency AS (
    SELECT
        geographic_region,
        country,
        category_group_new,
        global_nutri_grade,
        COUNT(global_nutri_grade) AS grade_count,
        
        -- Classement des grades par fréquence (1 étant le plus fréquent)
        ROW_NUMBER() OVER (
            PARTITION BY geographic_region, country, category_group_new
            ORDER BY COUNT(global_nutri_grade) DESC, global_nutri_grade ASC 
        ) AS rn
    FROM
        `wagon-nutriscore.Final_datasets.H3_country_clean_cat`
    WHERE
        global_nutri_grade IS NOT NULL
        AND numeric_grade_value IS NOT NULL
    GROUP BY
        geographic_region,
        country,
        category_group_new,
        global_nutri_grade
)

SELECT
    t1.geographic_region,
    t1.country,
    t1.category_group_new, 
    
    -- Statistiques agrégées
    COUNT(t1.global_nutri_grade) AS total_valid_products,

    -- ⭐ Moyenne du Grade Numérique (Grade pondéré)
    ROUND(AVG(t1.numeric_grade_value), 0) AS weighted_average_grade,
    
    -- ⭐ Grade moyen arrondi à l'entier supérieur (CEIL)
    --CEIL(AVG(t1.numeric_grade_value)) AS rounded_up_average_grade,
    
    -- Moyennes des nutriments et du score
    ROUND(AVG(t1.global_nutri_score), 2) AS average_nutri_score,
    ROUND(AVG(t1.energy), 2) AS avg_energy,
    ROUND(AVG(t1.sugar), 3) AS avg_sugar,
    ROUND(AVG(t1.fat), 3) AS avg_fat,
    ROUND(AVG(t1.saturated_fat), 3) AS avg_saturated_fat,
    ROUND(AVG(t1.salt), 3) AS avg_salt,
    ROUND(AVG(t1.protein), 3) AS avg_protein,
    ROUND(AVG(t1.fiber), 3) AS avg_fiber,
    ROUND(AVG(t1.fru_veg_leg_estimate), 3) AS avg_fru_veg_leg_estimate

FROM
    `wagon-nutriscore.Final_datasets.H3_country_clean_cat` AS t1
LEFT JOIN
    grade_frequency AS t2
    ON t1.geographic_region = t2.geographic_region
    AND t1.country = t2.country
    AND t1.category_group_new = t2.category_group_new
    AND t2.rn = 1 -- Ne garde que le grade le plus fréquent
WHERE
    t1.country IS NOT NULL
    AND TRIM(t1.country) != ''
    AND t1.category_group_new IS NOT NULL
    AND t1.numeric_grade_value IS NOT NULL
GROUP BY
    t1.geographic_region,
    t1.country,
    t1.category_group_new,
    t2.global_nutri_grade -- Groupement par le grade le plus fréquent
ORDER BY
    t1.geographic_region,
    t1.country,
    total_valid_products DESC;