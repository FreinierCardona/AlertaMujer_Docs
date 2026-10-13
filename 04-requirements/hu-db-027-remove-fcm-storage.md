# HU-DB-027 — Retirar persistencia exclusiva de FCM

> [!NOTE] INSTRUCTIONS
> Historia Propuesta. Definir el tratamiento histórico antes del drop y conservar rollback estructural.

## Identificación

| Campo | Valor |
|---|---|
| Ecosistema | Database |
| Módulo | Notification |
| Objetivo | Retirar tokens, intentos FCM, índices, grants y schema vacío. |
| Alcance | `user_device_tokens`, `emergency_notification_attempts` y dependencias exclusivas. |
| Precondiciones | ADR-006; inventario de FK/índices/grants y política histórica acordada. |
| Dependencias | HU-API-021, HU-AM-029. |
| Candidatos | Nuevo changeset Liquibase, master changelog y pruebas release. |
| Resultado | Release sin persistencia push y sin afectar contactos/emergencias. |

## Descripción

Eliminar objetos FCM mediante migración trazable; el panel interno reutiliza tablas existentes y no introduce leído/no leído.

## Criterios de aceptación

```gherkin
Escenario: actualización
  Dado que Backend ya no usa FCM
  Cuando se aplica el changeset
  Entonces desaparecen tablas, índices y grants exclusivos de push

Escenario: datos operativos conservados
  Cuando se valida el release
  Entonces contactos, emergencias, ubicación y evidencias permanecen íntegros

Escenario: rollback estructural
  Cuando se revierte el changeset
  Entonces se recrean objetos compatibles sin afirmar restauración de datos borrados
```

## Validaciones

- Funcionales: SOS/contactos siguen operables tras la migración.
- Técnicas: update, rollback/update, dependencias, privilegio mínimo, conteo de entidades/esquemas.

---

**Relacionados:** [paquete](./change-package-evidence-internal-notifications.md) · [ADR-006](../05-architecture/decisions/records/ADR-006-retire-push-notifications.md)
