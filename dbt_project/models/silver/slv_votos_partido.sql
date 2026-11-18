SELECT
    "id_detalle_votos" AS id_detalle_votos,
    "id_acta" AS id_acta,
    "id_partido" AS id_partido,
    COALESCE("amount_votos", 0) AS cantidad_votos
FROM {{ source('jne_oltp_source', 'votos_por_partido') }}
WHERE "id_detalle_votos" IS NOT NULL
