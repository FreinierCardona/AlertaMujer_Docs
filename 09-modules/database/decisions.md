# Database — Decisiones

> [!NOTE] INSTRUCTIONS
> Enlace la migración que prueba cada decisión implementada.

## Decisiones aplicables

| Decisión | Estado | Impacto local |
|---|---|---|
| ADR-001 | Accepted | Database es repositorio independiente |
| ADR-003 | Accepted e implementado | PostgreSQL evoluciona con Liquibase |
| separación de roles | Implementada | owner, migrator y app con límites |
| HU-DB-025 | Aplicada | ya no está en refinamiento |

## Convenciones locales

| Convención | Razón | Fuente |
|---|---|---|
| forward/rollback separados | reversibilidad | historias HU-DB |
| una estructura por entidad | mantenibilidad | changelog vigente |
| grants explícitos | mínimo privilegio | migraciones |

## Pendientes

| Id | Pregunta | Responsable | Criterio de cierre |
|---|---|---|---|
| DB-PEN-01 | ¿Cuál es la retención por clase de dato? | Pendiente | política aprobada y migraciones necesarias |

## Conflictos

Una ejecución larga sin mensaje final exitoso y código cero se clasifica como evidencia parcial.

## Revisión

Revisar con cada HU-DB, cambio de versión PostgreSQL o Liquibase.

---

**Relacionados:** [`README.md`](README.md) · [`../../05-architecture/decisions/records/ADR-003-postgresql-liquibase.md`](../../05-architecture/decisions/records/ADR-003-postgresql-liquibase.md)
