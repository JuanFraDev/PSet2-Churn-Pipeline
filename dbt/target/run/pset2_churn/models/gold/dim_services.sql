
  
    

create or replace transient table PSET2_CHURN.GOLD.dim_services
    
    
    
    
    

    as (
-- Grano: una fila por combinación única de servicios contratados.
select distinct
    md5(to_json(array_construct(
        phone_service, multiple_lines, internet_service,
        online_security, online_backup, device_protection,
        tech_support, streaming_tv, streaming_movies
    ))) as services_key,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies
from PSET2_CHURN.SILVER.slv_telco_customers
    )
;


  