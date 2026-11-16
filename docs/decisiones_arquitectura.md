# Decisiones iniciales de arquitectura

- **Caso de uso:** clasificar abandono de clientes de telecomunicaciones (PSet #1).
- **Fuente inicial:** Telco Customer Churn (CSV publico, una observacion por cliente).
- **Kestra:** coordinara la ingesta y su envio a Snowflake.RAW; aun no hay flujo implementado.
- **dbt:** construira capas Bronze, Silver y Gold con pruebas, aun por implementar.
- **Spark:** construira OBT con una fila por cliente, aun por implementar.
- **Snowflake:** destino cloud, base PSET2_CHURN y esquemas RAW, BRONZE, SILVER, GOLD, OBT.
- **Frecuencia prevista:** batch semanal para verificar cambios de la fuente.
- **Limitacion:** este CSV no contiene historia temporal de cada cliente. Backfill de ejecuciones no significa historia de comportamiento.
- **Seguridad:** nunca subir .env ni secretos. El montaje del socket de Docker en Kestra se reserva solo para este entorno local.
