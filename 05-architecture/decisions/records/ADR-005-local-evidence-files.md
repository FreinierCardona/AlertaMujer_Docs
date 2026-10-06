# ADR-005 — Definir almacenamiento de archivos de evidencia

> [!NOTE] INSTRUCTIONS
> Registre aquí solo la decisión sobre archivos; la metadata relacional pertenece al modelo Database.

## Identificación

| Campo | Valor |
|---|---|
| Id | ADR-005 |
| Fecha | 2026-10-06 |
| Estado | Accepted |
| Autores | Pendiente |
| Sustituye | Ninguno |

## Contexto

El modelo Database persiste metadata de evidencia sin guardar binarios. El Backend debe recibir, convertir, proteger, servir y limpiar fotografías sin exponer su ruta física.

| Restricción | Fuente |
|---|---|
| Metadata en `emergency_evidences` | Modelo Database |
| Acceso restringido | Arquitectura de seguridad |
| WebP final, máximo 1 MB y 10 por emergencia | RF8 y reglas de evidencia |

## Decisión

**Decidimos:** guardar el WebP final en almacenamiento local controlado por Backend y montar un volumen persistente cuando se use Docker.

PostgreSQL guarda referencia y metadata; la ruta física nunca se expone por HTTP.

## Alternativas evaluadas

| Alternativa | Ventajas | Costos | Veredicto |
|---|---|---|---|
| Volumen local persistente | Alcance directo y controlado | Backup y montaje operativo | Elegida |
| Almacenamiento de objetos | Durabilidad y políticas | Proveedor fuera del alcance | Descartada |
| Binario en PostgreSQL | Transacción única | Crecimiento y respaldo | Descartada |

## Consecuencias

| Tipo | Consecuencia |
|---|---|
| Positiva | Archivo privado y metadata conservan responsabilidades separadas |
| Costo | Backend requiere compensación, volumen y reconciliador horario |
| Riesgo | Un montaje efímero puede perder archivos al reemplazar contenedor |

**Documentos a actualizar:** integración, runbook, contrato y pruebas de seguridad.

## Revisión futura

Revisar si cambian alcance operativo, durabilidad o infraestructura aprobada.

---

**Relacionados:** [`../../integrations.md`](../../integrations.md) · [`../../../06-data/models.md`](../../../06-data/models.md)
