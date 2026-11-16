
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select churn_flag
from PSET2_CHURN.SILVER.slv_telco_customers
where churn_flag is null



  
  
      
    ) dbt_internal_test