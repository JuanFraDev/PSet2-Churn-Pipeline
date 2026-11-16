-- Falla si la construcción de Gold altera la cantidad de TotalCharges nulos.
select 'missing_total_charges_changed' as issue
where (select count_if(total_charges is null) from {{ ref('fact_customer_churn') }})
   <> (select count_if(total_charges is null) from {{ ref('slv_telco_customers') }})
