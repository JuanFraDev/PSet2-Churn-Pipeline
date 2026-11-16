-- El procesamiento no debe descartar filas de la fuente sin explicacion.
select 'raw_vs_silver' as validation_error
where (select count(*) from {{ source('raw', 'TELCO_CUSTOMER_CHURN') }})
   <> (select count(*) from {{ ref('slv_telco_customers') }})
