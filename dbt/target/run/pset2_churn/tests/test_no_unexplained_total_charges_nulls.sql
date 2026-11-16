
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- Una ausencia de TotalCharges con antiguedad positiva requeriría investigación.
select customer_id
from PSET2_CHURN.SILVER.slv_telco_customers
where total_charges is null and tenure_months > 0
  
  
      
    ) dbt_internal_test