-- Una ausencia de TotalCharges con antiguedad positiva requeriría investigación.
select customer_id
from {{ ref('slv_telco_customers') }}
where total_charges is null and tenure_months > 0
