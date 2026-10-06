# 10 — Integración y entrega continua

> [!NOTE] INSTRUCTIONS
> Estado: Pendiente. No existe autorización para agregar workflows; este documento define el mínimo a decidir.

## Estado actual

| Ecosistema | Automatización confirmada | Gate local |
|---|---|---|
| Frontend | no documentada como oficial | scripts del repositorio |
| Backend | no aplicable todavía | Pendiente |
| Database | no documentada como workflow | `scripts/test-release.ps1` |

## Pipeline objetivo mínimo

```mermaid
flowchart LR
  PR[Pull Request] --> STATIC[Formato y análisis]
  STATIC --> TEST[Pruebas]
  TEST --> BUILD[Build]
  BUILD --> SECURITY[Controles de seguridad]
  SECURITY --> APPROVE[Aprobación]
  APPROVE --> DEPLOY[Despliegue autorizado]
```

## Decisiones pendientes

| Tema | Pregunta de cierre |
|---|---|
| Plataforma | ¿Dónde se ejecutan los gates? |
| Ramas | ¿Qué rama despliega cada ambiente? |
| Secretos | ¿Qué almacén y rotación se usan? |
| Artefactos | ¿Cómo se versionan y retienen? |
| Rollback | ¿Qué dispara y quién autoriza? |

## Reglas

- Un pipeline no corrige requisitos ambiguos.
- Cada repositorio valida su responsabilidad.
- Los cambios Database conservan su release test oficial.
- Ningún secreto aparece en logs o artefactos.
- La documentación se valida como parte del cambio cuando se apruebe automatización.

## Criterio de aprobación

ADR, responsables, diagrama de promoción, gates reproducibles y prueba de rollback.

---

**Relacionados:** [`../00-governance/definition-of-done.md`](../00-governance/definition-of-done.md) · [`./environments.md`](./environments.md)
