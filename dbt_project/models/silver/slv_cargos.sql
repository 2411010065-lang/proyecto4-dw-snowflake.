SELECT
    "id_cargo" AS id_cargo,
    UPPER(TRIM("nombre_cargo")) AS nombre_cargo
FROM {{ source('jne_oltp_source', 'cargos') }}
WHERE "id_cargo" IS NOT NULL
