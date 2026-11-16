
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select contract_key as from_field
    from PSET2_CHURN.GOLD.fact_customer_churn
    where contract_key is not null
),

parent as (
    select contract_key as to_field
    from PSET2_CHURN.GOLD.dim_contract
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test