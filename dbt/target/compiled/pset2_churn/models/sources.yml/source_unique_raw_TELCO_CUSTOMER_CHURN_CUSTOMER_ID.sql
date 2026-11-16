
    
    

select
    CUSTOMER_ID as unique_field,
    count(*) as n_records

from PSET2_CHURN.RAW.TELCO_CUSTOMER_CHURN
where CUSTOMER_ID is not null
group by CUSTOMER_ID
having count(*) > 1


