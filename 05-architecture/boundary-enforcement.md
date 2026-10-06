# 05 — Control de Límites

> [!NOTE] INSTRUCTIONS
> Estado: En refinamiento. Documente solo controles ejecutables existentes; los faltantes conservan dueño y criterio de cierre.

## Qué se controla

| Límite | Regla |
|---|---|
| Frontend → Backend | Solo contratos REST/WSS; sin SQL o secretos servidor. |
| Backend → Database | Solo `alertamujer_app`; esquema validado, Liquibase deshabilitado. |
| Database | Cambios solo por changelog principal y roles mínimos. |
| Módulo Backend → módulo | Interfaz pública; no import de internals. |
| Mobile ↔ Web | Catálogos y criterios compartidos, no dependencias de ejecución. |

## Herramienta por stack

| Ecosistema | Control actual | Pendiente |
|---|---|---|
| Frontend | TypeScript, lint, build y tests configurados | regla automatizada de import entre módulos |
| Backend | Ninguno: no existe código | ArchUnit o equivalente después del esqueleto |
| Database | estructura de changelogs, validate y `test-release.ps1` | conservar evidencia por release |
| Docs | `scripts/validate-docs.ps1` | segunda revisión humana |

## Regla mínima

Todo control debe fallar con salida distinta de cero, nombrar la dependencia inválida y ejecutarse antes de integrar. Una recomendación en README no es enforcement.

## Dónde se ejecuta

- Localmente antes del Pull Request.
- En CI solo después de que el equipo apruebe y cree la automatización.
- Database mantiene su puerta manual; no se añade GitHub Actions por inferencia.

## Excepción intencional

Una excepción requiere ADR o decisión de módulo, alcance temporal, propietario y prueba que impida expansión silenciosa.

---

**Relacionados:** [`./module-structure.md`](./module-structure.md) · [`../02-domain/module-boundaries.md`](../02-domain/module-boundaries.md)
