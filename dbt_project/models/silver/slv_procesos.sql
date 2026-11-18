SELECT
    p."id_proceso" AS id_proceso,
    UPPER(TRIM(p."nombre_proceso")) AS nombre_proceso,
    p."fecha_eleccion" AS fecha_eleccion,
    p."id_tipo_proceso" AS id_tipo_proceso,
    UPPER(TRIM(tp."nombre_tipo")) AS tipo_proceso,
    TRIM(tp."descripcion") AS descripcion_tipo
FROM {{ source('jne_oltp_source', 'procesos_electorales') }} p
LEFT JOIN {{ source('jne_oltp_source', 'tipo_procesos') }} tp
    ON p."id_tipo_proceso" = tp."id_tipo_proceso"
WHERE p."id_proceso" IS NOT NULL
