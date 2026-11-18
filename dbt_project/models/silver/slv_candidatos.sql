SELECT
    "id_candidato" AS id_candidato,
    TRIM("dni_candidato") AS dni_candidato,
    UPPER(TRIM("nombres")) AS nombres,
    UPPER(TRIM("apellidos")) AS apellidos,
    UPPER(TRIM("nombres")) || ' ' || UPPER(TRIM("apellidos")) AS nombre_completo,
    "id_partido" AS id_partido,
    "id_cargo" AS id_cargo,
    "id_proceso" AS id_proceso
FROM {{ source('jne_oltp_source', 'candidatos') }}
WHERE "id_candidato" IS NOT NULL
