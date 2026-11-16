
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select tenure_months
from PSET2_CHURN.SILVER.slv_telco_customers
where tenure_months is null



  
  
      
    ) dbt_internal_test