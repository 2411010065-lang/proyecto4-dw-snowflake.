SELECT
    a."id_asistencia" AS id_asistencia,
    TRIM(a."dni") AS dni,
    TRIM(a."id_mesa") AS id_mesa,
    a."id_proceso" AS id_proceso,
    COALESCE(a."asistio", FALSE) AS asistio,
    UPPER(TRIM(c."genero")) AS genero,
    c."fecha_nacimiento" AS fecha_nacimiento,
    UPPER(TRIM(c."estado_padron")) AS estado_padron
FROM {{ source('jne_oltp_source', 'asistencia_votantes') }} a
LEFT JOIN {{ source('jne_oltp_source', 'ciudadanos') }} c
    ON TRIM(a."dni") = TRIM(c."dni")
WHERE a."id_asistencia" IS NOT NULL
