
    
    

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


