
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from PSET2_CHURN.GOLD.fact_customer_churn
where customer_id is not null
group by customer_id
having count(*) > 1


