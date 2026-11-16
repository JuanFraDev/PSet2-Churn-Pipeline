
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select churn_flag
from PSET2_CHURN.GOLD.fact_customer_churn
where churn_flag is null



  
  
      
    ) dbt_internal_test