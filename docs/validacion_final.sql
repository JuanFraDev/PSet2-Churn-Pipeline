-- PSet #2: controles reproducibles para el snapshot Telco Churn.
-- Ejecución en Snowsight, con el rol que tenga SELECT sobre RAW, GOLD y OBT.
USE ROLE SYSADMIN;
USE WAREHOUSE PSET2_WH;

-- 1. RAW: carga y unicidad
SELECT COUNT(*) AS total_registros,
       COUNT(DISTINCT customer_id) AS clientes_unicos,
       COUNT(*) - COUNT(DISTINCT customer_id) AS duplicados,
       COUNT_IF(churn = 'Yes') AS abandonaron,
       COUNT_IF(churn = 'No') AS permanecieron
FROM PSET2_CHURN.RAW.TELCO_CUSTOMER_CHURN;

-- 2. RAW: completitud y casos de cargos vacíos
SELECT COUNT_IF(total_charges IS NULL OR TRIM(total_charges) = '') AS cargos_totales_vacios,
       COUNT_IF((total_charges IS NULL OR TRIM(total_charges) = '') AND TRY_TO_NUMBER(tenure) = 0) AS vacios_con_tenure_cero
FROM PSET2_CHURN.RAW.TELCO_CUSTOMER_CHURN;

-- 3. Gold: dimensiones y hechos
SELECT 'DIM_CUSTOMER' AS tabla, COUNT(*) AS filas FROM PSET2_CHURN.GOLD.DIM_CUSTOMER
UNION ALL SELECT 'DIM_CONTRACT', COUNT(*) FROM PSET2_CHURN.GOLD.DIM_CONTRACT
UNION ALL SELECT 'DIM_SERVICES', COUNT(*) FROM PSET2_CHURN.GOLD.DIM_SERVICES
UNION ALL SELECT 'FACT_CUSTOMER_CHURN', COUNT(*) FROM PSET2_CHURN.GOLD.FACT_CUSTOMER_CHURN;

-- 4. OBT: resultado final persistido
SELECT COUNT(*) AS total_registros,
       COUNT(DISTINCT customer_id) AS clientes_unicos,
       COUNT(*) - COUNT(DISTINCT customer_id) AS duplicados,
       COUNT_IF(churn_flag = 1) AS abandonaron,
       COUNT_IF(total_charges IS NULL) AS cargos_nulos
FROM PSET2_CHURN.OBT.CUSTOMER_CHURN_OBT;

-- 5. Información descriptiva del abandono por contrato (no causal)
SELECT contract,
       COUNT(*) AS clientes,
       COUNT_IF(churn = 'Yes') AS abandonaron,
       ROUND(100.0 * COUNT_IF(churn = 'Yes') / COUNT(*), 2) AS tasa_abandono_pct
FROM PSET2_CHURN.RAW.TELCO_CUSTOMER_CHURN
GROUP BY contract
ORDER BY clientes DESC;
