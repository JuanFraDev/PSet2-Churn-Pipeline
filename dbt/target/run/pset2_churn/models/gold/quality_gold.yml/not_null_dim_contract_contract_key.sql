
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select contract_key
from PSET2_CHURN.GOLD.dim_contract
where contract_key is null



  
  
      
    ) dbt_internal_test