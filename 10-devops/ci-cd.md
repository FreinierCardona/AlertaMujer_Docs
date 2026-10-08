# 10 — Integración y entrega continua

> [!NOTE] INSTRUCTIONS
> Estado: Pendiente de workflow aprobado. Los gates locales existentes no equivalen a CI/CD.

## Estado actual

| Ecosistema | Automatización confirmada | Gate local |
|---|---|---|
| Frontend | No documentada como oficial | Scripts del repositorio |
| Backend | No existe workflow oficial | Maven verify e integración PostgreSQL reproducible |
| Database | No documentada como workflow | scripts/test-release.ps1 |

El gate Backend ejecutado el 2026-10-08 produjo 126 pruebas, 0 fallos, 0 errores y 0 omitidas. No existe evidencia de un workflow remoto, publicación de artefactos ni promoción automática.

## Pipeline objetivo mínimo

Pull Request → análisis estático → pruebas → build → controles de seguridad → aprobación → despliegue autorizado.

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

---

**Relacionados:** [../00-governance/definition-of-done.md](../00-governance/definition-of-done.md) · [./environments.md](./environments.md)
