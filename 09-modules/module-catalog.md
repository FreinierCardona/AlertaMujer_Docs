# 09 — Catálogo de módulos

> [!NOTE] INSTRUCTIONS
> Use esta vista para ubicar propiedad. El detalle vive en la carpeta del ecosistema o en arquitectura Backend.

## Ecosistemas oficiales

| Ecosistema | Repositorio | Responsabilidad | Estado verificado |
|---|---|---|---|
| Frontend | [AlertaMujer_Frontend](https://github.com/FreinierCardona/AlertaMujer_Frontend) | Mobile, Web, interacción, accesibilidad e i18n | Implementación local y mocks; consumo real requiere evidencia Frontend |
| Backend | [AlertaMujer_Backend](https://github.com/FreinierCardona/AlertaMujer_Backend) | API, seguridad, reglas e integraciones | HU-API-001 a 019 integradas; 126 pruebas aprobadas contra PostgreSQL local |
| Database | [AlertaMujer_Database](https://github.com/FreinierCardona/AlertaMujer_Database) | PostgreSQL, Liquibase, grants y validación | 25 HU-DB integradas; HU-DB-025 aplicada |

## Capacidades Backend

| Capacidad | Responsabilidad | Datos principales |
|---|---|---|
| Identity | Registro, OTP, sesiones, acceso y perfil | identity.* y profile.* |
| Contacts | Contactos de emergencia | contacts.* |
| Emergency | Ciclo SOS, estado, ubicación e historial | emergency.* |
| Evidence | Carga y acceso autorizado | emergency_evidences y almacenamiento privado |
| Chat | Historial y canal en tiempo real | emergency_chat_messages |
| Notification | Panel interno derivado de alertas abiertas y contactos aceptados | Emergency / Contacts / Evidence; transición ADR-006 |
| Administration | Operación autorizada y auditoría | audit.* y consultas controladas |
| Shared | Configuración, seguridad y correlación | configuration.* |

## Matriz de dependencias

| Consumidor | Proveedor | Interfaz |
|---|---|---|
| Frontend | Backend | REST y WSS/STOMP implementados; integración Frontend pendiente de evidencia |
| Backend | Database | SQL mediante rol alertamujer_app |
| Database | PostgreSQL | Changelog Liquibase |
| Backend | FCM | Implementado en el estado actual, pero aprobado para retiro por ADR-006; no es arquitectura objetivo |

## Regla

Una capacidad no adopta tablas, pantallas o despliegues de otro ecosistema. Los cambios transversales actualizan contrato y trazabilidad.

---

**Relacionados:** [frontend/README.md](./frontend/README.md) · [backend/README.md](./backend/README.md) · [database/README.md](./database/README.md)
