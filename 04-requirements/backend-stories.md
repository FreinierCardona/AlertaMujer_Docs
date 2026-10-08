# 04 — Historias Backend

> [!NOTE] INSTRUCTIONS
> El catálogo conserva el alcance y las dependencias de las HU. Integrada acredita el merge en develop; Verificada exige evidencia de pruebas y no equivale a un despliegue productivo.

## Corte de entrega comprobado

Al 2026-10-08, AlertaMujer_Backend está limpio en develop, en el merge d6b694e de la PR #19. Las HU-API-001 a HU-API-019 están integradas. La ejecución reproducible de scripts/verify-integration.ps1 contra PostgreSQL 17.11 y fixtures sintéticas terminó con 126 pruebas, 0 fallos, 0 errores y 0 omitidas.

El Backend consume únicamente el esquema migrado como alertamujer_app. Liquibase, DDL, grants y credenciales de migración siguen siendo propiedad de AlertaMujer_Database.

## Plataforma y transversal

| Id | Resultado implementado | Dependencias principales | Estado y evidencia |
|---|---|---|---|
| HU-API-001 | Base Java 21, Spring Boot y Maven Wrapper | — | Integrada y verificada; PR #1 |
| HU-API-002 | Contenedor Backend y configuración externa | 001, Database migrada | Integrada y verificada; PR #2 |
| HU-API-003 | Paquetes por módulo y capas | 001 | Integrada y verificada; PR #3 |
| HU-API-004 | Error HTTP seguro, UTC, paginación y X-Request-Id | 001, 003 | Integrada y verificada; pruebas de contrato HTTP |
| HU-API-005 | Validación de PostgreSQL con alertamujer_app | 002 a 004, HU-DB-001 a 025 | Integrada y verificada; prueba de rol y esquema real |
| HU-API-006 | Carga inmutable de configuración del sistema | 005, HU-DB-008 | Integrada y verificada; validación de singleton |
| HU-API-018 | Jobs internos acotados e idempotentes | 008, 010, 013, 015, 017 | Integrada y verificada; pruebas de jobs y PostgreSQL |
| HU-API-019 | CORS de orígenes locales y procedimiento de integración | 001 a 018 | Integrada y verificada; PR #19 y suite reproducible |

## Verticales funcionales

| Id | Resultado implementado | Módulo dueño | Dependencias principales | Estado y evidencia |
|---|---|---|---|---|
| HU-API-007 | Solicitud de registro y alta administrativa | Identity | 004 a 006, HU-DB-009 a 012/025 | Integrada y verificada; MVC, servicio y PostgreSQL |
| HU-API-008 | OTP, verificación, SMTP y purga | Identity | 007, HU-DB-009/011/012/024 | Integrada y verificada; reglas, hash y PostgreSQL |
| HU-API-009 | Login, JWT, refresh, logout y reset | Identity / Security | 005, 008, HU-DB-010 a 013 | Integrada y verificada; sesiones revocables |
| HU-API-010 | Perfil, términos, mensaje SOS y baja | Identity | 008 a 009, HU-DB-010/014/024/025 | Integrada y verificada; perfil y PostgreSQL |
| HU-API-011 | Directorio e invitaciones | Contacts | 009, HU-DB-010/015 | Integrada y verificada; estados y concurrencia |
| HU-API-012 | SOS idempotente y primera ubicación | Emergency | 009 a 011, HU-DB-014/015/017 a 019 | Integrada y verificada; 201/200 y carrera real |
| HU-API-013 | Latidos, estados, finalización e historial | Emergency | 012, HU-DB-017 a 019 | Integrada y verificada; transiciones e historial |
| HU-API-014 | Tokens FCM e intentos trazables | Notification | 009, 012, HU-DB-016/022 | Integrada y verificada; adapter simulado y PostgreSQL |
| HU-API-015 | Evidencia fotográfica privada | Evidence | 012, HU-DB-020 | Integrada y verificada; archivos, compensación y PostgreSQL |
| HU-API-016 | Chat REST y WSS/STOMP | Chat | 009, 012 a 013, HU-DB-021 | Integrada y verificada; autorización e idempotencia |
| HU-API-017 | Panel administrativo y auditoría | Administration | 009 a 013, HU-DB-023/025 | Integrada y verificada; HTTP, RBAC y auditoría |

## Límites de la evidencia

- La suite validó código, contratos internos, controladores, servicios y persistencia real; no aplicó Liquibase ni modificó el esquema.
- SMTP aceptado por un proveedor no acredita la llegada a una bandeja. FCM aceptado no acredita lectura ni recepción en un dispositivo.
- La imagen y Compose pertenecen al código integrado, pero este corte no sustituye una prueba de despliegue, una política de promoción ni operación productiva.
- El contrato OpenAPI y WSS conserva autoridad para consumidores; cualquier diferencia se corrige en el mismo cambio que la implementación.

## Reglas de mantenimiento

- Antes de una nueva HU, enlazar requisito, OpenAPI/WSS, datos y criterios de [Definition of Ready](../00-governance/definition-of-ready.md).
- Una operación de estado prueba autorización, conflicto, transacción y concurrencia cuando aplique.
- Una HU futura se marca Verificada solo después de preservar prueba y evidencia actualizada.

---

**Relacionados:** [functional.md](./functional.md) · [traceability-matrix.md](./traceability-matrix.md) · [../09-modules/backend/README.md](../09-modules/backend/README.md) · [../_stacks/java-spring.md](../_stacks/java-spring.md)
