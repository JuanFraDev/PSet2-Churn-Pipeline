-- El procesamiento no debe descartar filas de la fuente sin explicacion.
select 'raw_vs_silver' as validation_error
where (select count(*) from PSET2_CHURN.RAW.TELCO_CUSTOMER_CHURN)
   <> (select count(*) from PSET2_CHURN.SILVER.slv_telco_customers)