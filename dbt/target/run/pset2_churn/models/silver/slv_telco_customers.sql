
  
    

create or replace transient table PSET2_CHURN.SILVER.slv_telco_customers
    
    
    
    
    

    as (-- Silver: dataset consistente y de grano 1 cliente en el único corte disponible.
-- Se conservan TOTAL_CHARGES nulos para TENURE=0; no se inventan importes.
select
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents,
    tenure_months,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies,
    contract,
    paperless_billing,
    payment_method,
    monthly_charges,
    total_charges,
    total_charges_missing,
    (tenure_months = 0 and total_charges_missing) as new_customer_without_charges,
    churn,
    churn_flag,
    ingested_at
from PSET2_CHURN.BRONZE.brz_telco_customers
    )
;


  