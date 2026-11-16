-- Una ausencia de TotalCharges con antiguedad positiva requeriría investigación.
select customer_id
from PSET2_CHURN.SILVER.slv_telco_customers
where total_charges is null and tenure_months > 0