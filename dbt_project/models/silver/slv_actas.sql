SELECT
    a."id_acta" AS id_acta,
    TRIM(a."id_mesa") AS id_mesa,
    a."id_proceso" AS id_proceso,
    COALESCE(a."votos_blancos", 0) AS votos_blancos,
    COALESCE(a."votos_nulos", 0) AS votos_nulos,
    COALESCE(a."votos_impugnados", 0) AS votos_impugnados,
    UPPER(TRIM(a."estado_acta")) AS estado_acta,
    CASE WHEN i."id_impugnacion" IS NOT NULL THEN TRUE ELSE FALSE END AS tiene_impugnacion,
    UPPER(TRIM(COALESCE(ti."descripcion_incidencia", 'SIN INCIDENCIA'))) AS tipo_incidencia,
    UPPER(TRIM(COALESCE(i."resolucion_jne", 'NO APLICA'))) AS resolucion_jne
FROM {{ source('jne_oltp_source', 'actas_electorales') }} a
LEFT JOIN {{ source('jne_oltp_source', 'impugnaciones_actas') }} i
    ON a."id_acta" = i."id_acta"
LEFT JOIN {{ source('jne_oltp_source', 'tipo_incidencias') }} ti
    ON i."id_tipo_incidencia" = ti."id_tipo_incidencia"
WHERE a."id_acta" IS NOT NULL
