# 09 — Catálogo de módulos

> [!NOTE] INSTRUCTIONS
> Use esta vista para ubicar propiedad. El detalle vive en la carpeta del ecosistema o en arquitectura Backend.

## Ecosistemas oficiales

| Ecosistema | Repositorio | Responsabilidad | Estado verificado |
|---|---|---|---|
| Frontend | [AlertaMujer_Frontend](https://github.com/FreinierCardona/AlertaMujer_Frontend) | Mobile, Web, interacción, accesibilidad e i18n | Clientes REST/STOMP implementados; ejecución integrada requiere evidencia |
| Backend | [AlertaMujer_Backend](https://github.com/FreinierCardona/AlertaMujer_Backend) | API, seguridad, reglas e integraciones | HU-API-001 a 019 integradas; 126 pruebas aprobadas contra PostgreSQL local |
| Database | [AlertaMujer_Database](https://github.com/FreinierCardona/AlertaMujer_Database) | PostgreSQL, Liquibase, grants y validación | Scripts incluyen HU-DB-026 y flujo telefónico HU-DB-028; aplicación en ambiente por verificar |

## Capacidades Backend

| Capacidad | Responsabilidad | Datos principales |
|---|---|---|
| Identity | Registro, OTP, sesiones, acceso y perfil | identity.* y profile.* |
| Contacts | Contactos de emergencia | contacts.* |
| Emergency | Ciclo SOS, estado, ubicación e historial | emergency.* |
| Evidence | Carga y acceso autorizado | emergency_evidences y almacenamiento privado |
| Chat | Historial y canal en tiempo real | emergency_chat_messages |
| Alertas para contactos | Consultas internas derivadas de alertas abiertas y contactos aceptados en `contacts` | Emergency / Contacts / Evidence |
| Administration | Operación autorizada y auditoría | audit.* y consultas controladas |
| Shared | Configuración, seguridad y correlación | configuration.* |

## Matriz de dependencias

| Consumidor | Proveedor | Interfaz |
|---|---|---|
| Frontend | Backend | Clientes REST y STOMP presentes; ejecución integrada pendiente de evidencia |
| Backend | Database | SQL mediante rol alertamujer_app |
| Database | PostgreSQL | Changelog Liquibase |
| Backend | FCM | No se encontró adaptador en el código principal revisado; las tablas históricas permanecen en Database |

## Regla

Una capacidad no adopta tablas, pantallas o despliegues de otro ecosistema. Los cambios transversales actualizan contrato y trazabilidad.

---

**Relacionados:** [frontend/README.md](./frontend/README.md) · [backend/README.md](./backend/README.md) · [database/README.md](./database/README.md)
