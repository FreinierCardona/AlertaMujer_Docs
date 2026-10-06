# 09 — Catálogo de módulos

> [!NOTE] INSTRUCTIONS
> Use esta vista para ubicar propiedad. El detalle vive en la carpeta del ecosistema o en arquitectura Backend.

## Ecosistemas oficiales

| Ecosistema | Repositorio | Responsabilidad | Estado verificado |
|---|---|---|---|
| Frontend | [AlertaMujer_Frontend](https://github.com/FreinierCardona/AlertaMujer_Frontend) | Mobile, Web, interacción, accesibilidad e i18n | Implementación local/mocks |
| Backend | [AlertaMujer_Backend](https://github.com/FreinierCardona/AlertaMujer_Backend) | API, seguridad, reglas e integraciones | Sin código funcional verificado |
| Database | [AlertaMujer_Database](https://github.com/FreinierCardona/AlertaMujer_Database) | PostgreSQL, Liquibase, grants y validación | 25 HU-DB integradas; HU-DB-025 aplicada |

## Capacidades Backend objetivo

| Capacidad | Responsabilidad | Datos principales |
|---|---|---|
| Identity | registro, OTP, sesiones y acceso | `identity.*` |
| Profile | perfil y preferencias SOS | `profile.*` |
| Contacts | contactos de emergencia | `contacts.*` |
| Emergency | ciclo SOS, estado y ubicación | `emergency.*` |
| Evidence | carga y acceso autorizado | metadata `emergency_evidences` |
| Chat | historial y canal en tiempo real | `emergency_chat_messages` |
| Notification | dispositivos e intentos FCM | `notification.*` |
| Administration | operación autorizada y auditoría | `audit.*` |

## Matriz de dependencias

| Consumidor | Proveedor | Interfaz |
|---|---|---|
| Frontend | Backend | REST y WSS/STOMP pendientes de implementación |
| Backend | Database | SQL mediante rol `alertamujer_app` |
| Database | PostgreSQL | changelog Liquibase |
| Backend | FCM | integración pendiente |

## Regla

Una capacidad no adopta tablas, pantallas o despliegues de otro ecosistema. Los cambios transversales actualizan contrato y trazabilidad.

---

**Relacionados:** [`./frontend/README.md`](./frontend/README.md) · [`./backend/README.md`](./backend/README.md) · [`./database/README.md`](./database/README.md)
