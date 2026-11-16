
-- Grano: una fila por combinación única de contrato, facturación y pago.
select distinct
    md5(to_json(array_construct(contract, paperless_billing, payment_method))) as contract_key,
    contract,
    paperless_billing,
    payment_method
from PSET2_CHURN.SILVER.slv_telco_customers