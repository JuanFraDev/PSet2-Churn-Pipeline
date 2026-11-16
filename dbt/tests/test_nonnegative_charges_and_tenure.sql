select customer_id
from {{ ref('slv_telco_customers') }}
where tenure_months < 0
   or monthly_charges < 0
   or total_charges < 0
