
    
    

with child as (
    select services_key as from_field
    from PSET2_CHURN.GOLD.fact_customer_churn
    where services_key is not null
),

parent as (
    select services_key as to_field
    from PSET2_CHURN.GOLD.dim_services
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


