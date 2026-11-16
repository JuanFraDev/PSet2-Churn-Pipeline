
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select monthly_charges
from PSET2_CHURN.SILVER.slv_telco_customers
where monthly_charges is null



  
  
      
    ) dbt_internal_test