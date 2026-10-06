# 04 — Historias Backend

> [!NOTE] INSTRUCTIONS
> Catálogo adaptado del backlog técnico Backend. `Integrada` solo acredita integración Git; no equivale a validación funcional completa.

## Propósito

Ordenar el desarrollo de la API Java/Spring Boot contra contratos y datos ya aprobados. El detalle de rutas vive en `07-api`, las decisiones en `05-architecture` y la persistencia en `06-data`; este catálogo no los duplica.

## Estado comprobado

`hu-api-001` está integrada como scaffold en `AlertaMujer_Backend/develop`: Java 21, Spring Boot 4.1.1, Maven Wrapper, perfiles sin conexión por defecto, Liquibase deshabilitado y una prueba de contexto. No hay endpoints, entidades, conexión PostgreSQL ni lógica de negocio verificable. Las demás historias permanecen pendientes.

## Plataforma y transversal

| Id | Resultado | Dependencias principales | Estado |
|---|---|---|---|
| HU-API-001 | Scaffold Spring Boot mínimo | — | Integrada; alcance inicial |
| HU-API-002 | Contenedor Backend y configuración externa | 001, Database migrada | Pendiente |
| HU-API-003 | Paquetes modulares y capas | 001 | Pendiente |
| HU-API-004 | Errores seguros y correlación | 001, 003 | Pendiente |
| HU-API-005 | Persistencia con `alertamujer_app` | 002–004, HU-DB-001..025 | Pendiente |
| HU-API-006 | Configuración versionada del sistema | 005, HU-DB-008 | Pendiente |

## Verticales funcionales

| Id | Resultado | Módulo dueño | Dependencias principales | Estado |
|---|---|---|---|---|
| HU-API-007 | Registro y alta administrativa iniciada | Identity | 004–006, HU-DB-009..012/025 | Pendiente |
| HU-API-008 | OTP, verificación y purga | Identity | 007, HU-DB-009/011/012/024 | Pendiente |
| HU-API-009 | Login, JWT, renovación y cierre | Identity / Security | 005, 008, HU-DB-010..013 | Pendiente |
| HU-API-010 | Perfil, términos, mensaje SOS y baja | Identity | 008–009, HU-DB-010/014/024/025 | Pendiente |
| HU-API-011 | Directorio e invitaciones | Contacts | 009, HU-DB-010/015 | Pendiente |
| HU-API-012 | SOS idempotente y primera ubicación | Emergency | 009–011, HU-DB-014/015/017..019 | Pendiente |
| HU-API-013 | Latidos, estados, finalización e historial | Emergency | 012, HU-DB-017..019 | Pendiente |
| HU-API-014 | Tokens FCM e intentos trazables | Notification | 009, 012, HU-DB-016/022 | Pendiente |
| HU-API-015 | Evidencia fotográfica local | Evidence | 012, HU-DB-020 | Pendiente |
| HU-API-016 | Chat REST y WSS/STOMP | Chat | 009, 012–013, HU-DB-021 | Pendiente |
| HU-API-017 | Operación administrativa y auditoría | Administration | 009–013, HU-DB-023/025 | Pendiente |
| HU-API-018 | Jobs internos controlados | Transversal | 008, 010, 013, 015, 017 | Pendiente |
| HU-API-019 | Integración E2E y evidencia de release | Transversal | 001–018 | Pendiente |

## Reglas de inicio y cierre

- Antes de una HU, enlazar requisito, OpenAPI/WSS, datos y criterios de [Definition of Ready](../00-governance/definition-of-ready.md).
- Backend consume únicamente PostgreSQL ya migrado mediante `alertamujer_app`; no incorpora Liquibase, DDL ni credenciales de migración.
- Una operación de estado debe probar autorización, conflicto, transacción y, cuando aplique, concurrencia contra PostgreSQL real.
- Una HU se valida solo con pruebas, evidencia del entorno y trazabilidad actualizada; una clase o controlador aislado no basta.

## Riesgos previos

La resolución de conflictos de OTP, idempotencia SOS, autorización administrativa y chat debe mantenerse en refinamiento hasta que contrato, modelo físico y pruebas converjan. No se fija una regla nueva desde esta tabla.

---

**Relacionados:** [user-stories.md](./user-stories.md) · [traceability-matrix.md](./traceability-matrix.md) · [../_stacks/java-spring.md](../_stacks/java-spring.md) · [../09-modules/backend/README.md](../09-modules/backend/README.md)
