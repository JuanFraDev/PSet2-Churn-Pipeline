# PSet 2: modelo Gold (esquema estrella)

Se agrega como complemento **sin sustituir** archivos de Bronze/Silver ni Docker.

## Contenido
- `DIM_CUSTOMER`: 1 fila por cliente, atributos demográficos.
- `DIM_CONTRACT`: 1 fila por combinación de contrato, pago y facturación.
- `DIM_SERVICES`: 1 fila por combinación de servicios.
- `FACT_CUSTOMER_CHURN`: 1 fila por cliente con métricas y clave objetivo.

`customer_key`, `contract_key` y `services_key` son hashes determinísticos para
crear las relaciones con las dimensiones. No se asume una serie temporal.
El timestamp de ingesta es una marca técnica de auditoría, no la fecha de churn.

## Ejecutar desde PowerShell (carpeta pset_2)

```powershell
docker compose -f docker-compose.yml -f docker-compose.dbt.yml run --rm dbt run --select path:models/gold

docker compose -f docker-compose.yml -f docker-compose.dbt.yml run --rm dbt test
```

La segunda orden vuelve a comprobar **todas** las pruebas, incluidas Bronze/Silver.

## Verificar en Snowflake

Ejecutar `docs/validacion_gold.sql`. Si la sección de privilegios indica un error,
solicitar a un administrador acceso de SELECT a las tablas Gold.

La tabla de hechos y DIM_CUSTOMER deben tener 7.043 registros; las otras
dimensiones tienen un número de combinaciones menor, que debe determinarse
mediante consultas. El join del modelo estrella debe preservar 7.043 filas y
1.869 abandonos, y conservar 11 cargos totales ausentes.

## Para Spark (siguiente fase)

En el siguiente paso Spark leerá Gold, realizará los joins controlados y
guardará una OBT en `PSET2_CHURN.OBT`.
