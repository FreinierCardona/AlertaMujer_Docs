# 01 — Glosario

> [!NOTE] INSTRUCTIONS
> Agregue términos solo cuando eviten una ambigüedad real. Una definición técnica detallada pertenece a su dominio, no aquí.

## Términos

| Término | Definición canónica | No usar como sinónimo |
|---|---|---|
| Alerta / emergencia | Registro SOS y su ciclo de vida. | notificación, incidente técnico |
| Alerta abierta | Emergencia `ACTIVE`, `IN_PROGRESS` u `OFFLINE`. | alerta sin leer |
| Propietaria | Usuaria que creó la emergencia y puede finalizarla. | administradora, contacto |
| Contacto de emergencia | Relación aceptada entre usuarias. | rol, autoridad |
| Administrador de entidad | Cuenta funcional `ENTITY_ADMIN`. | rol PostgreSQL |
| Evidencia | Fotografía WebP asociada a una emergencia. | video, archivo genérico |
| Intento FCM | Solicitud aceptada o rechazada por el proveedor. | entrega, lectura |
| OTP | Código de un solo uso persistido como hash. | contraseña temporal |
| Sesión | Credencial renovable y revocable asociada a una cuenta. | JWT aislado |
| Changeset | Unidad inmutable de cambio Liquibase. | script manual |
| ADR | Registro de decisión arquitectónica. | nota informal |
| Ecosistema | Repositorio independiente Frontend, Backend o Database. | módulo desplegable |

## Por qué importan los sinónimos prohibidos

Confundir contacto con rol altera autorización; confundir FCM aceptado con entrega crea promesas falsas; confundir ecosistema con módulo mezcla ciclos de cambio y responsabilidades.

## Agregar un término

1. Identifique dos interpretaciones reales.
2. Elija una definición compatible con requisitos y código.
3. Actualice documentos que usan la variante descartada.
4. Añada enlaces a la fuente técnica cuando requiera detalle.

---

**Relacionados:** [`./overview.md`](./overview.md) · [`../02-domain/module-boundaries.md`](../02-domain/module-boundaries.md)
