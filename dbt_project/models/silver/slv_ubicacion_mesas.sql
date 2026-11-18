SELECT
    m."id_mesa" AS id_mesa,
    COALESCE(m."total_electores_hábiles", 0) AS total_electores_habiles,
    l."id_local" AS id_local,
    UPPER(TRIM(l."nombre_local")) AS nombre_local,
    UPPER(TRIM(l."direccion")) AS direccion_local,
    u."id_ubigeo" AS id_ubigeo,
    UPPER(TRIM(u."departamento")) AS departamento,
    UPPER(TRIM(u."provincia")) AS provincia,
    UPPER(TRIM(u."distrito")) AS distrito
FROM {{ source('jne_oltp_source', 'mesas_votacion') }} m
LEFT JOIN {{ source('jne_oltp_source', 'locales_votacion') }} l
    ON m."id_local" = l."id_local"
LEFT JOIN {{ source('jne_oltp_source', 'ubigeo') }} u
    ON l."id_ubigeo" = u."id_ubigeo"
WHERE m."id_mesa" IS NOT NULL
