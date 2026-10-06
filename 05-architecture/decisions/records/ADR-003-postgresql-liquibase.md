# ADR-003 — Gobernar PostgreSQL con Liquibase

> [!NOTE] INSTRUCTIONS
> Mantenga separados el hecho implementado y las mejoras futuras del proceso de entrega.

## Identificación

| Campo | Valor |
|---|---|
| Id | ADR-003 |
| Fecha | Pendiente |
| Estado | Accepted |
| Autores | Pendiente |
| Sustituye | Ninguno |

## Contexto

La persistencia necesita cambios reproducibles, reversibles y auditables. El repositorio Database ya organiza el modelo PostgreSQL mediante changelogs y SQL de avance y reversión.

| Restricción | Fuente |
|---|---|
| PostgreSQL es el motor oficial | Repositorio Database |
| Cambios versionados y ordenados | Changelog Liquibase |
| Validación de avance y rollback | `scripts/test-release.ps1` |

## Decisión

**Decidimos:** administrar todo cambio físico de base de datos mediante Liquibase en el repositorio Database.

Cada cambio debe ser idempotente donde corresponda, declarar rollback y pasar la validación de release vigente.

## Alternativas evaluadas

| Alternativa | Ventajas | Costos | Veredicto |
|---|---|---|---|
| Liquibase y SQL versionado | Trazabilidad y rollback explícito | Disciplina de changesets | Elegida |
| Scripts manuales | Rapidez puntual | Estado no reproducible | Descartada |
| ORM como autoridad | Cercanía al Backend | Mezcla propiedad de esquemas | Descartada |

## Consecuencias

| Tipo | Consecuencia |
|---|---|
| Positiva | La estructura física tiene una única fuente |
| Costo | Cada historia Database requiere evidencia de release |
| Riesgo | Modificar un changeset aplicado rompe checksums |

**Documentos a actualizar:** convenciones y migraciones de datos.

## Revisión futura

Revisar si cambia el motor o la herramienta oficial de migración.

---

**Relacionados:** [`../../../06-data/migrations.md`](../../../06-data/migrations.md) · [`../../../09-modules/database/README.md`](../../../09-modules/database/README.md)
