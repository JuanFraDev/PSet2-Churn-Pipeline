
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select services_key
from PSET2_CHURN.GOLD.dim_services
where services_key is null



  
  
      
    ) dbt_internal_test