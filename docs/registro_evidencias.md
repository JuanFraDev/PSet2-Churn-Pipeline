# Registro de evidencias — PSet #2

Este archivo diferencia verificaciones observadas en las capturas compartidas de elementos aún sin demostración concluyente. Completar o reemplazar enlaces a capturas antes de la entrega.

| Control | Evidencia observada | Estado |
|---|---|---|
| Kestra → RAW | Descarga, tabla, stage y carga realizadas; verificación de 7.043 filas | Confirmado |
| Duplicación y corrección | Segunda carga: 14.086 filas / 7.043 únicos; tras corrección: 7.043 / 7.043 / 0 duplicados | Confirmado |
| Calidad RAW | 11 `TOTAL_CHARGES` vacíos, todos con tenure 0; cero IDs duplicados tras corrección | Confirmado |
| dbt | Seis modelos creados y 36/36 pruebas aprobadas; repetición posterior sin errores según resultado comunicado | Confirmado según salidas compartidas |
| Gold | 7.043 clientes, 24 contratos, 322 servicios, 7.043 hechos | Confirmado |
| Spark OBT | 7.043 filas, 7.043 únicos, 1.869 abandonos, 11 cargos nulos; ejecución sin `root` | Confirmado |
| Trigger programado | `docs/evidencia_kestra_trigger_20261116.png`: 16/11/2026, 01:00 (hora visualizada), 8,23 s, `SUCCESS`, icono de trigger. `docs/evidencia_snowflake_raw_20261116.png`: 7.043 filas y 7.043 IDs distintos. | **Confirmado**; revisar restauración del cron semanal definitivo |
| Backfill | Logs de consulta/carga y ausencia de duplicados | **No concluyente** sobre origen backfill; requiere captura `SUCCESS` y fecha lógica |
| Exportación YAML | El flujo vive en Kestra UI | Exportarlo a `kestra/flows/` y versionarlo |

## Capturas mínimas para entregar

1. Diagrama de arquitectura y capturas de contenedores Docker activos.
2. Flujo Kestra completo; ejecución automática del 16/11/2026 `SUCCESS` ya capturada. Para backfill, obtener captura independiente de una ejecución histórica (si se ejecutó).
3. Conteos RAW antes y después de la corrección de duplicados.
4. `dbt run` con 6 modelos y `dbt test` con 36 pruebas aprobadas.
5. Snowflake Gold y OBT con conteos y claves únicas.
6. Finalización de Spark sin `root`, con `SUCCESS: OBT verificada en Snowflake`.

**Nota:** La ejecución semanal y la estrategia de full refresh se diseñaron para un snapshot estático. El backfill de fechas de ejecución no es un historial de atributos o eventos de clientes.
