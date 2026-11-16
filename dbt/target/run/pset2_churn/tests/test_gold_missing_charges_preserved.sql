
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- Falla si la construcción de Gold altera la cantidad de TotalCharges nulos.
select 'missing_total_charges_changed' as issue
where (select count_if(total_charges is null) from PSET2_CHURN.GOLD.fact_customer_churn)
   <> (select count_if(total_charges is null) from PSET2_CHURN.SILVER.slv_telco_customers)
  
  
      
    ) dbt_internal_test