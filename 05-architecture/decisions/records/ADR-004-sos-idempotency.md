# ADR-004 — Definir idempotencia del inicio SOS

> [!NOTE] INSTRUCTIONS
> La decisión está implementada y validada contra PostgreSQL local. No representa por sí sola un despliegue productivo.

## Identificación

| Campo | Valor |
|---|---|
| Id | ADR-004 |
| Fecha | 2026-10-06 |
| Estado | Accepted |
| Autores | Pendiente |
| Sustituye | Ninguno |

## Contexto

El inicio SOS puede repetirse por latencia, reintento o interacción duplicada. Database protege una única emergencia abierta por usuaria y el contrato debe devolver un resultado recuperable.

| Restricción | Fuente |
|---|---|
| Evitar emergencias duplicadas | Flujo SOS |
| Mantener respuesta observable | Contrato REST implementado |
| Preservar auditoría | RNF de trazabilidad |

## Decisión

**Decidimos:** usar como clave natural la usuaria autenticada y su emergencia abierta; la primera creación responde `201` y un reintento o carrera devuelve `200` con la misma emergencia.

No se agrega cabecera, token, ventana temporal ni tabla de idempotencia.

## Evidencia de implementación

HU-API-012 crea SOS con 201 y recupera la emergencia abierta con 200 ante reintento o carrera. La suite integrada del 2026-10-08 ejerció la persistencia PostgreSQL y terminó con 126 pruebas, 0 fallos, 0 errores y 0 omitidas.

## Alternativas evaluadas

| Alternativa | Ventajas | Costos | Veredicto |
|---|---|---|---|
| Emergencia abierta por usuaria | Reutiliza integridad existente | Recuperar conflicto concurrente | Elegida |
| Clave enviada por cliente | Reintento determinista | Gestión de vigencia | Descartada |
| Sin idempotencia | Sin estado adicional | Duplicados | No aceptable |

## Consecuencias

| Tipo | Consecuencia |
|---|---|
| Positiva | Un timeout se reintenta sin duplicar la alerta |
| Costo | Backend debe recuperar la fila tras conflicto de unicidad |
| Riesgo | Una implementación no transaccional puede fallar en carreras |

**Documentos a actualizar:** contrato OpenAPI, modelo, requisito y pruebas SOS.

## Revisión futura

Revisar si se permite más de una emergencia abierta por usuaria o cambia su restricción física.

---

**Relacionados:** [`../../../03-product/functional-flow.md`](../../../03-product/functional-flow.md) · [`../../../07-api/contracts/openapi/openapi-alertamujer-v1.yaml`](../../../07-api/contracts/openapi/openapi-alertamujer-v1.yaml)
