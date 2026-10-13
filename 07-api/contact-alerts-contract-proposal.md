# Propuesta de contrato — Alertas vinculadas para contactos

> [!NOTE] INSTRUCTIONS
> Contrato objetivo de HU-API-022. No está implementado y no reemplaza `openapi-alertamujer-v1.yaml` hasta integrar y verificar las HUs relacionadas.

## Operaciones

| Método y ruta | Actor | Resultado | Errores relevantes |
|---|---|---|---|
| `GET /api/v1/me/contact-alerts?page=0&size=20` | `USER` habilitado | Alertas no finalizadas de usuarias con relación `ACCEPTED` | `401`, `403`, `400` |
| `GET /api/v1/me/contact-alerts/{emergencyId}` | Contacto autorizado | Detalle mínimo de una alerta abierta vinculada | `401`, `404` no revelador |
| `GET /api/v1/me/contact-alerts/{emergencyId}/evidences` | Contacto autorizado | Metadata ordenada de evidencias | `401`, `404` |
| `GET /api/v1/me/contact-alerts/{emergencyId}/evidences/{evidenceId}/content` | Contacto autorizado | Bytes `image/webp`, `Cache-Control: no-store` | `401`, `404` |

No se crea operación de marcado leído/no leído ni endpoint de token. La ruta actual `POST /api/v1/me/device-tokens` se retira al completar HU-API-021.

## Resumen de alerta vinculada

```json
{
  "emergencyId": "uuid",
  "title": "Alerta de Emergencia",
  "status": "ACTIVE",
  "userDisplayName": "Nombre permitido",
  "message": "Nombre permitido está en peligro",
  "startedAt": "2026-10-13T12:00:00Z"
}
```

Estados admitidos: `ACTIVE`, `IN_PROGRESS`, `OFFLINE`. La respuesta se elimina del listado al confirmar `FINALIZED`.

## Detalle mínimo

```json
{
  "emergencyId": "uuid",
  "status": "ACTIVE",
  "userDisplayName": "Nombre permitido",
  "startedAt": "2026-10-13T12:00:00Z",
  "messageSnapshot": "Necesito ayuda",
  "lastConfirmedLocation": {
    "latitude": 4.60971,
    "longitude": -74.08175,
    "capturedAt": "2026-10-13T12:01:00Z"
  },
  "evidences": [
    {
      "evidenceId": "uuid",
      "mimeType": "image/webp",
      "sizeBytes": 10485760,
      "receivedAt": "2026-10-13T12:02:00Z"
    }
  ]
}
```

No incluye correo, teléfono, username si no fue aprobado como nombre visible, perfil, chat, auditoría, historial general, tokens, rutas físicas ni acciones de cambio/finalización.

## Política de autorización

Para cada consulta deben cumplirse simultáneamente:

1. actor con rol `USER` y cuenta `ENABLED`;
2. propietaria con rol `USER` y cuenta `ENABLED`;
3. relación entre ambas cuentas en estado `ACCEPTED`, sin importar qué extremo inició la invitación;
4. emergencia perteneciente a la propietaria y estado distinto de `FINALIZED`;
5. evidencia perteneciente a esa misma emergencia.

Si alguna condición falla, el recurso individual responde `404` para no revelar su existencia. El listado simplemente omite filas no autorizadas.

## Evidencia WebP

HU-API-020 cambia el upload existente: Mobile envía `image/webp`; tamaño máximo 10 485 760 bytes; máximo 10 evidencias; solo la propietaria puede cargar. El contacto es lector, nunca cargador.

---

**Relacionados:** [`../04-requirements/change-package-evidence-internal-notifications.md`](../04-requirements/change-package-evidence-internal-notifications.md) · [`../05-architecture/decisions/records/ADR-006-retire-push-notifications.md`](../05-architecture/decisions/records/ADR-006-retire-push-notifications.md)
