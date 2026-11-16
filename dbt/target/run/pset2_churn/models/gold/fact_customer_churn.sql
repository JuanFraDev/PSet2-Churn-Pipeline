
  
    

create or replace transient table PSET2_CHURN.GOLD.fact_customer_churn
    
    
    
    
    

    as (
-- Grano: una fila por cliente en el único snapshot de negocio del CSV.
-- La fecha INGESTED_AT es técnica, NO una fecha de abandono.
select
    md5(customer_id) as customer_key,
    md5(to_json(array_construct(contract, paperless_billing, payment_method))) as contract_key,
    md5(to_json(array_construct(
        phone_service, multiple_lines, internet_service,
        online_security, online_backup, device_protection,
        tech_support, streaming_tv, streaming_movies
    ))) as services_key,
    customer_id,
    tenure_months,
    monthly_charges,
    total_charges,
    total_charges_missing,
    new_customer_without_charges,
    churn_flag,
    ingested_at
from PSET2_CHURN.SILVER.slv_telco_customers
    )
;


  