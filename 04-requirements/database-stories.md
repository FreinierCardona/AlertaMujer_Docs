# 04 — Historias Database

> [!NOTE] INSTRUCTIONS
> “Integrada” describe Git; “aplicada” describe la base. La evidencia de release se registra por ejecución, no se infiere.

## Plataforma y configuración

| Id | Resultado | Dependencia | Estado |
|---|---|---|---|
| HU-DB-001 | Cadena principal Liquibase | ninguna | Integrada |
| HU-DB-002 | PostgreSQL con Docker Compose | 001 | Integrada |
| HU-DB-003 | Extensiones requeridas | 002 | Integrada |
| HU-DB-004 | `citext` en `public` | 003 | Integrada |
| HU-DB-005 | Siete schemas funcionales | 004 | Integrada |
| HU-DB-006 | Roles owner, migrator y app | 005 | Integrada |
| HU-DB-007 | `system_configuration` | 006 | Integrada |

## Identidad, perfil y contactos

| Id | Entrega | Id | Entrega |
|---|---|---|---|
| HU-DB-008 | `registration_requests` | HU-DB-009 | `users` |
| HU-DB-010 | `user_credentials` | HU-DB-011 | funciones protegidas |
| HU-DB-012 | `user_verification_codes` | HU-DB-013 | `user_sessions` |
| HU-DB-014 | `user_emergency_settings` | HU-DB-015 | `emergency_contacts` |
| HU-DB-016 | `user_device_tokens` | HU-DB-025 | origen y términos aplicados |

## Emergencia, notificación y auditoría

| Id | Entrega | Id | Entrega |
|---|---|---|---|
| HU-DB-017 | `emergencies` | HU-DB-018 | `emergency_status_history` |
| HU-DB-019 | `emergency_locations` | HU-DB-020 | `emergency_evidences` |
| HU-DB-021 | `emergency_chat_messages` | HU-DB-022 | `emergency_notification_attempts` |
| HU-DB-023 | `audit_logs` | HU-DB-024 | controles de integración y DCL |

## Estado

Las 25 historias están integradas en `develop`; HU-DB-025 está aplicada y aporta `account_origin` y `accepted_terms_at` a solicitudes de registro.

---

**Relacionados:** [`./user-stories.md`](./user-stories.md) · [`../09-modules/database/README.md`](../09-modules/database/README.md)
