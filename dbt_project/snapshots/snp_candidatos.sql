{% snapshot snp_candidatos %}

{{
    config(
      target_database='PROYECTO4_DW',
      target_schema='SILVER',
      unique_key='id_candidato',
      strategy='check',
      check_cols=['id_partido', 'id_cargo', 'id_proceso', 'nombre_completo'],
      invalidate_hard_deletes=True
    )
}}

SELECT * FROM {{ ref('slv_candidatos') }}

{% endsnapshot %}
