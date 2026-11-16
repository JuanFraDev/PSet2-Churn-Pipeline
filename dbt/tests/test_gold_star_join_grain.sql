-- Falla si el join de hechos con dimensiones multiplica o pierde filas.
with joined as (
    select f.customer_id
    from {{ ref('fact_customer_churn') }} f
    inner join {{ ref('dim_customer') }} c on f.customer_key = c.customer_key
    inner join {{ ref('dim_contract') }} d on f.contract_key = d.contract_key
    inner join {{ ref('dim_services') }} s on f.services_key = s.services_key
)
select 'join_cardinality_changed' as issue
where (select count(*) from joined)
   <> (select count(*) from {{ ref('fact_customer_churn') }})
