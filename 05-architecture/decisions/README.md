# 05 — Registros de Decisión Arquitectónica

> [!NOTE] INSTRUCTIONS
> Una decisión aceptada no se reescribe para cambiar su sentido; se crea un ADR que la sustituya.

## Cuándo escribir un ADR

- Cambia límites de ecosistema o módulo.
- Cambia contrato, almacenamiento, seguridad o despliegue.
- Introduce dependencia difícil de revertir.
- Resuelve una contradicción con más de una opción válida.
- Establece una excepción a una regla arquitectónica.

## Estados

| Estado | Significado |
|---|---|
| Proposed | Está en revisión; no guía implementación. |
| Accepted | Guía cambios nuevos. |
| Rejected | Evaluada y descartada; conserva razones. |
| Superseded | Otro ADR vigente la reemplaza. |

## Registro

| ADR | Decisión | Estado |
|---|---|---|
| [ADR-001](./records/ADR-001-separate-ecosystems.md) | Tres ecosistemas independientes | Accepted |
| [ADR-002](./records/ADR-002-backend-modular-monolith.md) | Backend monolítico modular por capas | Accepted |
| [ADR-003](./records/ADR-003-postgresql-liquibase.md) | PostgreSQL y Liquibase desde Database | Accepted |
| [ADR-004](./records/ADR-004-sos-idempotency.md) | Emergencia abierta como idempotencia SOS | Accepted |
| [ADR-005](./records/ADR-005-local-evidence-files.md) | Archivos de evidencia en almacenamiento local controlado | Accepted |

## Nombres

Copie `_template-adr.md` a `records/ADR-NNN-short-title.md`. El número nunca se reutiliza y el título describe la decisión, no el problema.

---

**Relacionados:** [`./_template-adr.md`](./_template-adr.md) · [`../README.md`](../README.md)
