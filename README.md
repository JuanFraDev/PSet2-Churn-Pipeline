# PSet #2 — Pipeline de datos para Churn

Entorno inicial para **Kestra**, **Spark** y **Snowflake**. dbt se incorporara al implementar las transformaciones. Este repositorio NO contiene aun un pipeline funcional de punta a punta.

## Requisitos

- Windows 10/11 + PowerShell + Docker Desktop (Linux containers, WSL2).
- Cuenta de Snowflake con permisos para crear objetos.

## 1. Preparar variables

En PowerShell, desde esta carpeta:

```powershell
Copy-Item .env.example .env
notepad .env
```

Cambia las dos contrasenas por contrasenas propias. **No compartas ni subas `.env`.**

## 2. Arrancar los servicios

```powershell
docker compose config --quiet
docker compose up -d
docker compose ps
```

Kestra: http://localhost:8080 (usuario/clave definidos en `.env`).

## 3. Comprobar Spark

```powershell
docker compose exec spark /opt/spark/bin/spark-submit --version
```

## 4. Crear el destino de datos en Snowflake

En **Snowflake / Snowsight > Projects > Worksheets**, ejecutar `docs/snowflake_setup.sql`.

Debe aparecer una base `PSET2_CHURN`, cinco esquemas y un warehouse `PSET2_WH`.

## 5. Detener sin borrar datos

```powershell
docker compose down
```

Evita `docker compose down -v`, porque borra los volumenes persistentes de este entorno.

## Proximas etapas

1. Credenciales de Snowflake en un mecanismo seguro (no en Git).
2. Descarga automatica e ingesta Raw con Kestra.
3. Modelos y tests dbt (Bronze, Silver, Gold).
4. Trabajo Spark para construir una OBT y guardar en Snowflake.
5. Documento tecnico con evidencias de ejecuciones reales.
