
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select customer_id
from PSET2_CHURN.SILVER.slv_telco_customers
where tenure_months < 0
   or monthly_charges < 0
   or total_charges < 0
  
  
      
    ) dbt_internal_test