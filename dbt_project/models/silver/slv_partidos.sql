SELECT
    "id_partido" AS id_partido,
    UPPER(TRIM("nombre_partido")) AS nombre_partido,
    UPPER(TRIM("siglas")) AS siglas,
    "fecha_inscripcion" AS fecha_inscripcion,
    UPPER(TRIM("estado")) AS estado_partido
FROM {{ source('jne_oltp_source', 'partidos_politicos') }}
WHERE "id_partido" IS NOT NULL
