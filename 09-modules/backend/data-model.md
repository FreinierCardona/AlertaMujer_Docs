# Backend — Modelo de datos

> [!NOTE] INSTRUCTIONS
> Estado: Implementado como consumidores de PostgreSQL. Database continúa siendo propietaria exclusiva del modelo físico, DDL, Liquibase y grants.

## Propiedad

Backend posee DTO, modelos de aplicación, repositorios y transacciones. AlertaMujer_Database gobierna tablas, constraints, índices, funciones protegidas y cambios de esquema.

## Agregados implementados

| Agregado | Responsabilidad | Fuente persistente |
|---|---|---|
| Identity | Solicitudes, cuentas, OTP, credenciales y sesiones | identity.* |
| Profile | Preferencias SOS y datos editables | profile.* e identity.users |
| Contacts | Invitaciones y relaciones aceptadas | contacts.emergency_contacts |
| Emergency | SOS, ubicación, estado e historial | emergency.emergencies, emergency_locations y emergency_status_history |
| Notification | Tokens de dispositivo e intentos por emergencia | notification.user_device_tokens y emergency.emergency_notification_attempts |
| Evidence | Metadatos y referencia interna; binario fuera de PostgreSQL | emergency.emergency_evidences |
| Chat | Mensajes ordenados e idempotentes | emergency.emergency_chat_messages |
| Administration | Consulta y auditoría autorizada | identity.*, emergency.* y audit.audit_logs |
| Shared | Configuración de sistema de solo lectura | configuration.system_configuration |

## Relación de capas

El contrato REST o STOMP se adapta mediante DTO. El servicio valida reglas y transacciones, el repositorio consulta PostgreSQL migrado y los adaptadores de archivos, SMTP o FCM permanecen fuera de las entidades persistentes.

## Reglas de integridad verificadas

- Los servicios validan identidad, rol, propiedad y estado antes de escribir.
- Constraints y bloqueos de Database son la barrera persistente para invitaciones, SOS y mensajes.
- Hashes de contraseña, OTP y refresh token se obtienen solo mediante funciones protegidas cuando corresponde.
- Las entidades físicas no se exponen por REST o STOMP.
- La evidencia mantiene metadato en PostgreSQL y contenido bajo una ruta privada controlada.

## Datos sensibles

| Dato | Control implementado | Límite de evidencia |
|---|---|---|
| Credenciales, OTP y refresh token | Hash y acceso protegido; no se serializan | No demuestra rotación de secretos por ambiente |
| Ubicación, evidencia y chat | Autorización por emergencia y rutas no públicas | No sustituye política operativa de retención |
| Tokens FCM | Propiedad y resultado técnico saneado | No demuestra recepción por dispositivo real |

---

**Relacionados:** [README.md](README.md) · [../../06-data/models.md](../../06-data/models.md) · [../../04-requirements/backend-stories.md](../../04-requirements/backend-stories.md)
