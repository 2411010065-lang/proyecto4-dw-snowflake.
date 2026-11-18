SELECT
    v.id_detalle_votos,
    v.id_acta,
    a.id_mesa,
    a.id_proceso,
    v.id_partido,
    v.cantidad_votos AS votos_validos_partido,
    a.votos_blancos,
    a.votos_nulos,
    a.votos_impugnados,
    a.estado_acta,
    a.tiene_impugnacion,
    a.tipo_incidencia,
    a.resolucion_jne
FROM {{ ref('slv_votos_partido') }} v
INNER JOIN {{ ref('slv_actas') }} a
    ON v.id_acta = a.id_acta
