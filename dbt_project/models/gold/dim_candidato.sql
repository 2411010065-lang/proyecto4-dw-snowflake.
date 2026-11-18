SELECT
    c.id_candidato,
    c.dni_candidato,
    c.nombre_completo,
    c.id_partido,
    p.nombre_partido,
    p.siglas AS siglas_partido,
    cg.nombre_cargo,
    c.id_proceso,
    c.dbt_valid_from AS fecha_inicio_vigencia
FROM {{ ref('snp_candidatos') }} c
LEFT JOIN {{ ref('slv_partidos') }} p ON c.id_partido = p.id_partido
LEFT JOIN {{ ref('slv_cargos') }} cg ON c.id_cargo = cg.id_cargo
WHERE c.dbt_valid_to IS NULL
