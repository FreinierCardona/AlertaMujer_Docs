# Paquete de cambio — Evidencia WebP y notificaciones internas

> [!NOTE] INSTRUCTIONS
> Mantener este archivo como índice del incremento. Cada HU vive en una ficha propia y permanece Propuesta hasta contar con código, pruebas e integración verificable.

## Objetivo

Corregir el flujo fotográfico de extremo a extremo, retirar las notificaciones push y habilitar un panel interno para que un contacto autenticado consulte alertas abiertas vinculadas, detalle mínimo y evidencias autorizadas.

## Decisiones rectoras

- ADR-006 retira FCM, tokens e intentos push; el reemplazo consulta emergencias abiertas y contactos `ACCEPTED` sin tabla paralela de notificaciones.
- ADR-007 exige conversión WebP previa en Mobile y un máximo de 500 KB (500 000 bytes) tanto en transferencia como en almacenamiento final.
- El contacto es un `USER` vinculado, no un rol global; nunca modifica, atiende ni finaliza una alerta ajena.

## Historias del incremento

| HU | Ecosistema | Resultado comprobable | Ficha |
|---|---|---|---|
| HU-AM-028 | Frontend Mobile | Captura configurada, WebP y carga <=500 KB | [Detalle](./hu-am-028-evidence-webp.md) |
| HU-AM-029 | Frontend Mobile | Push remoto retirado sin romper aviso local de ubicación | [Detalle](./hu-am-029-remove-push.md) |
| HU-AM-030 | Frontend Mobile | Campana, punto rojo y listado vinculado | [Detalle](./hu-am-030-internal-notification-panel.md) |
| HU-AM-031 | Frontend Mobile | Detalle seguro, Maps y galería | [Detalle](./hu-am-031-contact-alert-detail.md) |
| HU-API-020 | Backend | Evidencia WebP coherente con 500 KB | [Detalle](./hu-api-020-evidence-webp.md) |
| HU-API-021 | Backend | Endpoint, adaptador y eventos FCM retirados | [Detalle](./hu-api-021-remove-fcm.md) |
| HU-API-022 | Backend | Consultas seguras para contactos | [Detalle](./hu-api-022-contact-alert-api.md) |
| HU-DB-026 | Database | Constraint/configuración de evidencia a 500 KB | [Detalle](./hu-db-026-evidence-limit.md) |
| HU-DB-027 | Database | Persistencia FCM retirada de forma reversible | [Detalle](./hu-db-027-remove-fcm-storage.md) |

## Precondiciones compartidas

- ADR-006 y ADR-007 aceptados, contratos actuales identificados y datos de prueba sintéticos.
- Relación de contacto `ACCEPTED`, cuentas habilitadas y emergencia no `FINALIZED` para lectura del contacto.
- Release Database, Backend y Mobile se validan por separado antes del recorrido integrado.

## Orden recomendado

1. HU-DB-026 y HU-API-020; después HU-AM-028.
2. HU-API-022; después HU-AM-030 y HU-AM-031.
3. HU-AM-029, HU-API-021 y HU-DB-027 como retiro coordinado.
4. Dispositivo Android, Backend + PostgreSQL, release Database y recorrido integral antes de cerrar las historias.

## Límites del alcance

No se añade leído/no leído, tabla de notificaciones, chat para contactos, datos de perfil completos, acciones sobre alerta ajena, cola offline ni garantía de aviso con la app cerrada.

## Resultado esperado

Docs, Obsidian, contratos y los tres ecosistemas de implementación describen el mismo límite de 500 KB (500 000 bytes), el mismo modelo de autorización y la ausencia de push remoto.

---

**Relacionados:** [historias Frontend](./frontend-stories.md) · [historias Backend](./backend-stories.md) · [historias Database](./database-stories.md) · [ADR-006](../05-architecture/decisions/records/ADR-006-retire-push-notifications.md) · [ADR-007](../05-architecture/decisions/records/ADR-007-webp-evidence-up-to-10mb.md)
