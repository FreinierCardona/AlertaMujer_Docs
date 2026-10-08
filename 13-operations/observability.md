# 13 — Observabilidad

> [!NOTE] INSTRUCTIONS
> Estado: Parcialmente implementado. La taxonomía operativa debe validarse contra infraestructura y código antes de aprobarla.

## Objetivo

Responder si el sistema está disponible, qué falló, a quién afectó y qué cambio introdujo el comportamiento.

## Señales

| Señal | Ejemplo de uso | Estado |
|---|---|---|
| Logs | Diagnóstico seguro con requestId | Implementado en Backend; retención pendiente |
| Salud técnica | Actuator health | Implementado; SMTP puede afectar salud agregada |
| Métricas | Tasa, latencia, errores y saturación | Pendiente |
| Trazas | Recorrido entre módulos e integraciones | Pendiente |
| Auditoría | Acción sensible y actor | Implementada para operaciones administrativas |

## Correlación

X-Request-Id correlaciona solicitudes HTTP y respuestas de error. No se usa token, OTP, ubicación o dato personal como correlación. El Backend genera un UUID cuando el cliente no aporta uno válido.

## Eventos prioritarios

- Inicio, transición y cierre de una emergencia.
- Fallo de ubicación, evidencia, chat o notificación.
- Acceso denegado y sesión revocada.
- Cambio administrativo sensible.
- Error de migración o incompatibilidad de esquema.

## Protección

No registrar contraseñas, OTP, tokens, cuerpos de evidencia, ubicación precisa innecesaria ni contenido de chat. Definir redacción y retención antes de producción.

## Alertas y SLO

Umbrales, ventanas, destinatarios, presupuesto de error y guardias: Pendiente.

---

**Relacionados:** [runbook.md](./runbook.md) · [../06-data/models.md](../06-data/models.md) · [../09-modules/backend/runbook.md](../09-modules/backend/runbook.md)
