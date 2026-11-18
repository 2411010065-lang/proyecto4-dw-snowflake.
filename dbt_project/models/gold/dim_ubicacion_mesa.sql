SELECT
    id_mesa,
    total_electores_habiles,
    id_local,
    nombre_local,
    direccion_local,
    id_ubigeo,
    departamento,
    provincia,
    distrito
FROM {{ ref('slv_ubicacion_mesas') }}
