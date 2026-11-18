{{
    config(
        materialized='view',
        schema='BRONZE'
    )
}}

SELECT
    *
FROM 
    {{ source('jne_oltp_source', 'candidatos') }}