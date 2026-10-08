# 07 — WSS y STOMP

> [!NOTE] INSTRUCTIONS
> Estado: Implementado y probado localmente. El uso de wss en un ambiente real requiere TLS del despliegue; el desarrollo local usa ws.

## Propósito

Definir chat y actualizaciones de estado de una emergencia. REST crea SOS y recupera alertas y mensajes persistidos.

## Conexión y destinos

| Elemento | Definición |
|---|---|
| Desarrollo local | ws://host:8080/ws |
| Ambiente con TLS | wss://host/ws |
| Autenticación | Frame CONNECT con Authorization: Bearer accessToken |
| Suscripción | /topic/emergencies/{emergencyId} |
| Envío | /app/emergencies/{emergencyId}/messages |
| Recuperación | GET /api/v1/emergencies/{id}/messages?after={messageId} |
| Reconexión cliente | Tres intentos: 1, 2 y 5 segundos; luego REST |

## Reglas implementadas

- clientMessageId UUID es idempotente por emergencia.
- Solo ACTIVE o IN_PROGRESS aceptan envío; OFFLINE y FINALIZED lo rechazan.
- El servidor persiste antes de publicar EMERGENCY_MESSAGE_CREATED.
- EMERGENCY_STATUS_CHANGED se publica después de una transición confirmada.
- Cada CONNECT, destino y envío autoriza identidad, sesión, rol y relación con la emergencia.

## Fallos y seguridad

No existe cola, confirmación de entrega ni mensajes offline pendientes. Un fallo de transporte no confirma envío; el cliente reconecta y recupera por REST desde el último messageId confirmado. Los identificadores no habilitan acceso y el contenido sensible no se registra en logs técnicos.

---

**Relacionados:** [../03-product/functional-flow.md](../03-product/functional-flow.md) · [../06-data/models.md](../06-data/models.md) · [README.md](README.md)
