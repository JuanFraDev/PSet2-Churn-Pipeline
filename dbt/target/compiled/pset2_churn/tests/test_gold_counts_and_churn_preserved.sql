-- Falla cuando Gold pierde clientes o cambia el total de eventos de abandono.
select 'counts_or_churn_changed' as issue
where (select count(*) from PSET2_CHURN.GOLD.fact_customer_churn)
   <> (select count(*) from PSET2_CHURN.SILVER.slv_telco_customers)
   or (select sum(churn_flag) from PSET2_CHURN.GOLD.fact_customer_churn)
   <> (select sum(churn_flag) from PSET2_CHURN.SILVER.slv_telco_customers)