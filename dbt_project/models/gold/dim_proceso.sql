SELECT
    id_proceso,
    nombre_proceso,
    fecha_eleccion,
    tipo_proceso,
    descripcion_tipo
FROM {{ ref('slv_procesos') }}
