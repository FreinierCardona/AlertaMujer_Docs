# 02 — Entidades y Reglas

> [!NOTE] INSTRUCTIONS
> Este documento resume invariantes funcionales. El modelo físico detallado permanece en `06-data`.

## Entidades

| Entidad funcional | Identidad | Ciclo de vida | Fuente persistente |
|---|---|---|---|
| Cuenta | UUID de usuario | registro → habilitada/inhabilitada → eliminación | `identity.users` |
| Solicitud de registro | UUID de solicitud | pendiente → completada/cancelada/vencida | `identity.registration_requests` |
| Contacto | par canónico de usuarias | pendiente → aceptado/rechazado/vencido | `contacts.emergency_contacts` |
| Emergencia | UUID de emergencia | activa → en proceso/sin conexión → finalizada | `emergency.emergencies` |
| Evidencia | UUID de metadata | creada durante alerta; lectura histórica | `emergency.emergency_evidences` |
| Mensaje | secuencia `BIGINT` + UUID cliente | persistido → publicado | `emergency.emergency_chat_messages` |
| Intento FCM | secuencia de intento | pendiente → resultado proveedor | `notification.emergency_notification_attempts` |

## Reglas de negocio

| Id | Regla | Dueño funcional |
|---|---|---|
| BR-01 | Una usuaria mantiene como máximo una emergencia abierta. | Emergencia |
| BR-02 | Solo la propietaria finaliza su emergencia. | Emergencia |
| BR-03 | El administrador puede iniciar atención, nunca finalizar. | Administración |
| BR-04 | SOS exige contacto aceptado, cuenta válida, permisos, GPS, red y coordenada. | Emergencia / Mobile |
| BR-05 | El reintento SOS devuelve la misma emergencia abierta. | Emergencia |
| BR-06 | Contacto es relación, no rol; no permite autocontacto ni duplicado. | Contactos |
| BR-07 | FCM realiza un intento y no acredita entrega o lectura. | Notificaciones |
| BR-08 | Evidencia es WebP, máximo 1 MB y 10 fotografías por emergencia. | Evidencias |
| BR-09 | Chat no acepta mensajes después de `FINALIZED`. | Chat |
| BR-10 | Los cuatro idiomas cambian interfaz, no datos aportados por actores. | Experiencia |

## Dónde se aplica una regla

| Tipo | Aplicación |
|---|---|
| Integridad estructural | Constraint, índice o FK en Database. |
| Estado, autorización o concurrencia | Transacción Backend. |
| Permiso/dispositivo/presentación | Frontend, sin sustituir validación servidor. |

---

**Relacionados:** [`./domain-map.md`](./domain-map.md) · [`../06-data/models.md`](../06-data/models.md)
