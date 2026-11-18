SELECT
    id_partido,
    nombre_partido,
    siglas,
    fecha_inscripcion,
    estado_partido
FROM {{ ref('slv_partidos') }}
