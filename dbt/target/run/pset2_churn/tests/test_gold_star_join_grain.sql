
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- Falla si el join de hechos con dimensiones multiplica o pierde filas.
with joined as (
    select f.customer_id
    from PSET2_CHURN.GOLD.fact_customer_churn f
    inner join PSET2_CHURN.GOLD.dim_customer c on f.customer_key = c.customer_key
    inner join PSET2_CHURN.GOLD.dim_contract d on f.contract_key = d.contract_key
    inner join PSET2_CHURN.GOLD.dim_services s on f.services_key = s.services_key
)
select 'join_cardinality_changed' as issue
where (select count(*) from joined)
   <> (select count(*) from PSET2_CHURN.GOLD.fact_customer_churn)
  
  
      
    ) dbt_internal_test