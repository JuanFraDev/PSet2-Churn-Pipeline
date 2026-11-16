# PSet #2 — Gold → Spark → OBT

Este complemento no reemplaza archivos ya existentes. Usa el servicio `spark` del `docker-compose.yml` original, lo prepara con OpenSSL y le añade el conector oficial Spark-Snowflake.

## Estructura nueva
- `docker-compose.spark.yml`: Compose complementario (no reemplaza `docker-compose.yml`).
- `spark/Dockerfile`: imagen Spark 4.0.0 con OpenSSL.
- `spark/jobs/build_obt.py`: lecturas de Gold, joins, controles de grano y escritura de OBT.
- `docs/grants_spark.sql`: permisos específicos del rol Spark.
- `docs/validacion_obt.sql`: comprobación de las filas y el target en Snowflake.

## 1. SQL permisos
Ejecutar `docs/grants_spark.sql` en Snowflake como `SECURITYADMIN`.

## 2. Build + run (PowerShell en pset_2)
```powershell
docker compose -f docker-compose.yml -f docker-compose.spark.yml build spark
docker compose -f docker-compose.yml -f docker-compose.spark.yml run --rm spark
```

Se reutiliza `.env.dbt` (`SNOWFLAKE_ACCOUNT`), `.env.snowflake` (passphrase Base64) y la clave privada **cifrada** `secrets/snowflake_private_key.pem`. No compartirlas ni subirlas al repo. El script usa OpenSSL para descifrar la clave en memoria y pasarla al conector; no la guarda en disco.

El primer arranque descarga desde Maven el conector Spark-Snowflake 3.2.3 para Spark 4.0 y el JDBC 4.4.1; requiere acceso a internet desde el contenedor.

## 3. Validar
Ejecutar `docs/validacion_obt.sql`. Esperados según el snapshot actual: 7043 clientes, 7043 IDs únicos, 1869 abandonos y 11 cargos totales nulos. No se inventan observaciones temporales.

## Diseño
- Grano de Gold FACT_CUSTOMER_CHURN: 1 fila por cliente.
- Grano de OBT CUSTOMER_CHURN_OBT: 1 fila por cliente en el único snapshot.
- Consumo analítico: Star Schema (evita repetir atributos y sirve para BI).
- Consumo ML: OBT (una matriz plana de características por cliente con CHURN_FLAG como target).
- La fecha INGESTED_AT es técnica; no debe usarse como predictor.

## Notas
- `mode('overwrite')` reemplaza el snapshot completo para evitar duplicación por reejecución; no implementa versionado histórico.
- Se usa `spark-submit --master local[2]`; no es un cluster distribuido.
- Errores de Maven: confirmar conectividad a Internet desde Docker.
- Errores de permisos: revisar los grants del esquema GOLD y OBT, especialmente CREATE STAGE.
- Si falla el build de OpenSSL, compartir las últimas líneas del error para ajustar el Dockerfile al sistema base.
