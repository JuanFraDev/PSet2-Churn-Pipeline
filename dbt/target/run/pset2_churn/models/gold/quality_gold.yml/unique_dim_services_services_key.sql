
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    services_key as unique_field,
    count(*) as n_records

from PSET2_CHURN.GOLD.dim_services
where services_key is not null
group by services_key
having count(*) > 1



  
  
      
    ) dbt_internal_test