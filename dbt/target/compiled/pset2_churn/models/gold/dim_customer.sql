
-- Grano: una fila por cliente del único corte de negocio disponible.
select
    md5(customer_id) as customer_key,
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents
from PSET2_CHURN.SILVER.slv_telco_customers