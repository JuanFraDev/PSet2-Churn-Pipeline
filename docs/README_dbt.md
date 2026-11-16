# Complemento dbt para PSet #2

## Instalación sin alterar Kestra

1. Descomprimir este complemento dentro de `C:\Proyectos\pset_2` (combinar carpetas, no borrar archivos anteriores).
2. `Copy-Item .env.dbt.example .env.dbt`; editar `.env.dbt` con el identificador de Snowflake ya probado en Kestra.
3. Asegurar que `.gitignore` incluya `.env.dbt`, `.env.snowflake`, `.env`, `secrets/`.
4. En Snowflake, ejecutar `docs/grants_dbt.sql` con rol `SECURITYADMIN`.
5. En PowerShell:
   ```powershell
   cd C:\Proyectos\pset_2
   docker compose -f docker-compose.yml -f docker-compose.dbt.yml build dbt
   docker compose -f docker-compose.yml -f docker-compose.dbt.yml run --rm dbt debug
   docker compose -f docker-compose.yml -f docker-compose.dbt.yml run --rm dbt run --select bronze silver
   docker compose -f docker-compose.yml -f docker-compose.dbt.yml run --rm dbt test
   ```
6. En Snowflake, verificar:
   ```sql
   SELECT COUNT(*), COUNT_IF(TOTAL_CHARGES IS NULL)
   FROM PSET2_CHURN.SILVER.SLV_TELCO_CUSTOMERS;
   ```

## Notas metodológicas
- `RAW` permanece inmutable y con texto; Bronze convierte tipos usando TRY_TO_DECIMAL.
- Las 11 filas sin `TotalCharges`, todas con `tenure=0`, permanecen en Silver con importe `NULL`, más indicadores explícitos.
- La macro `generate_schema_name` permite crear exactamente BRONZE y SILVER, en lugar de BRONZE_BRONZE.
- Bronze se materializa como VIEW y Silver como TABLE; datos operativos del conjunto son transversales, no temporalmente longitudinales.
- Este complemento NO incluye todavía Gold ni Spark/OBT.
- La passphrase para dbt se obtiene del valor Base64 que Kestra usa en `.env.snowflake`; no copies contraseñas a SQL/YAML.
- Para un entorno de producción usar cuenta de servicio y clave distintas para dbt.
