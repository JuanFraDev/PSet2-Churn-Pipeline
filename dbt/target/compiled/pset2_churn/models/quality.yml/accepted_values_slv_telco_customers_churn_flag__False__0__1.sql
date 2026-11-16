
    
    

with all_values as (

    select
        churn_flag as value_field,
        count(*) as n_records

    from PSET2_CHURN.SILVER.slv_telco_customers
    group by churn_flag

)

select *
from all_values
where value_field not in (
    0,1
)


