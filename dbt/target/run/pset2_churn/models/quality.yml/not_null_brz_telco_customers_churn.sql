
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select churn
from PSET2_CHURN.BRONZE.brz_telco_customers
where churn is null



  
  
      
    ) dbt_internal_test