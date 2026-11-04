# 07 — Convenciones REST

> [!NOTE] INSTRUCTIONS
> Estado: Implementado en Backend y vigente para nuevas rutas. Revise el contrato OpenAPI y las pruebas cuando se cambie una operación.

## Recursos

| Regla | Aplicación |
|---|---|
| URI | Sustantivos plurales y minúsculos |
| Versión | `/api/v1`; registro telefónico adicional en `/api/v2/registration-requests` |
| Formato | JSON UTF-8; multipart solo para evidencia |
| Identificador | UUID opaco, salvo messageId consecutivo de chat |
| Fecha/hora | ISO 8601 con zona UTC |

## Operaciones implementadas por controlador

Rutas relativas a `/api/v1`, salvo indicación v2. El inventario se contrastó con anotaciones de `AlertaMujer_Backend/src/main/java/com/alertamujer/backend`; los detalles de cuerpos y respuestas siguen en OpenAPI y DTO.

| Controlador | Operaciones |
|---|---|
| `RegistrationRequestController` | POST `/registration-requests`, `/admin/users` |
| `PhoneFirstRegistrationController` | POST `/api/v2/registration-requests`, `/{registrationRequestId}/verification-codes`, `/{registrationRequestId}/verification-codes/verify`; PUT `/{registrationRequestId}/credentials` (últimas tres rutas relativas a `/api/v2/registration-requests`) |
| `OtpController` | POST `/registration-requests/{registrationRequestId}/verification-codes`, `/registration-requests/{registrationRequestId}/verification-codes/verify`, `/auth/password-reset/verification-codes` |
| `AuthenticationController` | POST `/auth/login`, `/auth/refresh`, `/auth/logout`, `/auth/password-reset/confirm`; PATCH `/me/password` |
| `ProfileController` | GET, PATCH y DELETE `/me`; POST `/me/terms-acceptance`, `/me/contact-changes`, `/me/contact-changes/verify`; GET y PUT `/me/emergency-settings` |
| `ContactController` | GET `/directory`, `/contacts`; POST `/contact-invitations` y `/{contactId}/accept`, `/{contactId}/reject`, `/{contactId}/reinvite` bajo `/contact-invitations` |
| `ContactAlertController` | GET `/me/contact-alerts`, `/{emergencyId}`, `/{emergencyId}/evidences`, `/{emergencyId}/evidences/{evidenceId}/content` bajo `/me/contact-alerts` |
| `EmergencyController`, `OwnEmergencyHistoryController` | POST `/emergencies`, `/{emergencyId}/heartbeats`, `/{emergencyId}/locations`, `/{emergencyId}/finish`; GET `/emergencies/active`, `/emergencies/{emergencyId}`, `/me/emergencies` |
| `EvidenceController`, `ChatController` | POST y GET `/emergencies/{emergencyId}/evidences`; GET `/evidences/{evidenceId}/content`, `/emergencies/{emergencyId}/messages` |
| `AdministrationController` | GET `/admin/dashboard`, `/admin/emergencies`, `/admin/users`, `/admin/users/{userId}`, `/admin/audit-logs`; POST `/admin/emergencies/{emergencyId}/attention`; PATCH `/admin/users/{userId}/status`; DELETE `/admin/users/{userId}/deletion` |

El anterior `POST /me/device-tokens` se retiró del OpenAPI: no existe controlador correspondiente en el código principal revisado. El handshake STOMP usa `/ws`; sus destinos y autorización se describen en [wss-stomp.md](wss-stomp.md).

## Métodos

| Método | Uso | Repetición esperada |
|---|---|---|
| GET | Consultar | Segura e idempotente |
| POST | Crear o ejecutar acción | Definida por operación; SOS recupera la emergencia abierta |
| PUT | Reemplazar | Idempotente cuando se incluya |
| PATCH | Modificar parcialmente | Definida por contrato |
| DELETE | Eliminar o desactivar | Idempotencia documentada por operación |

## Respuestas y correlación

Los errores comunes contienen code, message, requestId y fields cuando corresponde. X-Request-Id acepta un UUID válido o se genera en Backend, se devuelve al cliente y no transporta información sensible. Las colecciones usan page desde cero y size entre 1 y 50 con valor predeterminado 20.

**Diferencia entre repositorios:** `web/src/shared/api/client.ts` envía `web-` seguido de un UUID y `mobile/src/core/api/ApiClient.ts` genera `mobile-...`; `RequestIdFilter` solo conserva un UUID canónico y reemplaza esos valores por otro. La solicitud continúa, pero el identificador generado por el cliente no coincide con el devuelto por Backend.

## Seguridad

- Las rutas públicas se limitan a registro, verificación y flujos de autenticación definidos.
- Las demás rutas requieren Bearer JWT, sesión vigente, rol, propiedad y estado aplicables.
- Administración requiere ENTITY_ADMIN.
- CORS permite solo los orígenes exactos de CORS_ALLOWED_ORIGINS, sin comodines ni credenciales cross-site.
- Ningún secreto o dato sensible se registra en URL, log o ejemplo.

## Compatibilidad

Los cambios incompatibles requieren ADR, versión y plan de transición. Agregar un campo opcional no exime la revisión de consumidores ni de la matriz de trazabilidad.

## Latidos y evidencias — revisión 2026-11-04

`POST /api/v1/emergencies/{emergencyId}/heartbeats` acepta cuerpo ausente o `LocationInput` válido: actualiza el latido y solo guarda ubicación si se aporta; una emergencia `OFFLINE` recupera el estado operativo previo. El timeout mide la ausencia de latidos, no prueba ausencia de internet.

La propietaria puede cargar WebP válido de hasta 500 000 bytes en `ACTIVE`, `IN_PROGRESS` u `OFFLINE`; `FINALIZED` se rechaza. El límite de cantidad positivo se aplica por emergencia; `0` lo desactiva. Contactos aceptados y administradores autorizados consultan metadatos y después contenido privado por sus rutas respectivas. El contrato de detalle figura en [OpenAPI](./contracts/openapi/openapi-alertamujer-v1.yaml).

---

**Relacionados:** [contracts/openapi/openapi-alertamujer-v1.yaml](contracts/openapi/openapi-alertamujer-v1.yaml) · [README.md](README.md) · [../00-governance/definition-of-done.md](../00-governance/definition-of-done.md)
