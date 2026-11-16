
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        churn as value_field,
        count(*) as n_records

    from PSET2_CHURN.BRONZE.brz_telco_customers
    group by churn

)

select *
from all_values
where value_field not in (
    'Yes','No'
)



  
  
      
    ) dbt_internal_test