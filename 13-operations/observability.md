# 13 — Observabilidad

> [!NOTE] INSTRUCTIONS
> Estado: Pendiente. La taxonomía objetivo debe validarse contra infraestructura y código antes de aprobarla.

## Objetivo

Responder si el sistema está disponible, qué falló, a quién afectó y qué cambio introdujo el comportamiento.

## Señales

| Señal | Ejemplo de uso | Estado |
|---|---|---|
| logs | diagnóstico con correlación | Pendiente Backend |
| métricas | tasa, latencia, errores y saturación | Pendiente |
| trazas | recorrido entre módulos e integraciones | Pendiente |
| auditoría | acción sensible y actor | modelo Database implementado |

## Correlación

Toda solicitud crítica debe poder relacionar cliente, operación Backend e intento de integración mediante identificador seguro. No se usa un token o dato personal como correlación.

## Eventos prioritarios

- Inicio, transición y cierre de una emergencia.
- Fallo de ubicación, evidencia, chat o notificación.
- Acceso denegado y sesión revocada.
- Cambio administrativo sensible.
- Error de migración o incompatibilidad de esquema.

## Protección

No registrar contraseñas, OTP, tokens, cuerpos de evidencia, ubicación precisa innecesaria ni contenido de chat. Definir redacción y retención antes de producción.

## Alertas y SLO

Umbrales, ventanas, destinatarios, presupuesto de error y guardias: **Pendiente**.

## Criterio de cierre

Instrumentación implementada, tableros y alertas probados, responsables asignados y runbook enlazado.

---

**Relacionados:** [`./runbook.md`](./runbook.md) · [`../06-data/models.md`](../06-data/models.md)
