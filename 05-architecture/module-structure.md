# 05 — Estructura de Módulos

> [!NOTE] INSTRUCTIONS
> La estructura Backend se verificó contra el checkout integrado. Frontend y Database se contrastan con sus repositorios antes de actualizar este documento.

## Árbol Backend implementado

La raíz Java contiene AlertaMujerApplication y el paquete backend. Dentro de backend existen los módulos shared, identity, contacts, emergency, notification, evidence, chat y administration.

- shared concentra configuración, seguridad, errores, auditoría y observabilidad.
- identity concentra registro, OTP, sesiones y perfil.
- contacts administra directorio e invitaciones.
- emergency administra SOS, ubicaciones, estados e historial.
- notification expone el panel interno derivado; tokens e intentos FCM son legado pendiente de retiro por ADR-006.
- evidence persiste metadatos y mantiene almacenamiento privado.
- chat ofrece REST, STOMP y publicación posterior al commit.
- administration agrupa panel, atención, usuarios y auditoría.

Cada módulo mantiene sus capas controller, dto, service, repository y model cuando corresponden. Los adaptadores específicos permanecen dentro de su módulo: fcm, storage y websocket.

## Estructuras de los demás ecosistemas

Frontend conserva mobile/app con mobile/src/modules, y web/src/modules con web/src/shared. Database conserva 01_ddl, 02_dml, 03_dcl, 04_tcl, 05_rollbacks, changelog, docker y scripts.

## Límites

| Área | Contenido | Fuente de verdad |
|---|---|---|
| Backend controller | Adaptación HTTP/STOMP y DTOs | Código Backend y contratos |
| Backend service | Autorización, reglas y transacciones | Código Backend |
| Backend repository | Persistencia PostgreSQL sin reglas de permisos | Código Backend y modelo Database |
| Database | Esquema, Liquibase, grants y rollback | Código Database |
| Frontend | Pantallas, estado de presentación e interacción | Código Frontend |

## Reglas independientes del stack

- Ningún cliente accede directamente a PostgreSQL.
- Backend no contiene migrations ejecutables.
- Un controller no consulta repositorios directamente.
- Los contratos públicos se mantienen trazados y probados.
- Archivos de evidencia no se almacenan como binarios en la base.
- Eventos STOMP se publican después de la persistencia confirmada.

---

**Relacionados:** [modular-monolith.md](./modular-monolith.md) · [boundary-enforcement.md](./boundary-enforcement.md) · [../09-modules/backend/README.md](../09-modules/backend/README.md)
