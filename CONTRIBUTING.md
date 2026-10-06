# Contribuir

Los cambios ingresan mediante Pull Request y respetan la fuente principal de cada concepto.

## Lea primero

| Documento | Motivo |
|---|---|
| [`00-sdd-guide.md`](00-sdd-guide.md) | Fases, puertas y orden de elaboración |
| [`00-governance/documentation-rules.md`](00-governance/documentation-rules.md) | Criterio de documento terminado |
| [`00-governance/git-conventions.md`](00-governance/git-conventions.md) | Ramas, commits y política de integración |

Un cambio que agregue, elimine o renombre documentos debe actualizar el README de su sección y el grafo raíz.

## Convenciones documentales

- Una pregunta por documento.
- Entre 25 y 80 líneas; README y guía SDD quedan exentos del máximo.
- Tablas, listas y Mermaid sobre prosa extensa.
- Español profesional, enlaces relativos y términos definidos una sola vez.
- Bloque `INSTRUCTIONS` hasta revisión humana secundaria.
- Pie `Relacionados` en cada documento del framework.
- `_template-*` se copia; nunca se completa en su ubicación original.
- Diseño, implementación y validación se declaran por separado.
- `Pendiente` y `En refinamiento` se usan en vez de inventar información.

## Validar un cambio

1. Ejecute `powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-docs.ps1`.
2. Revise la lista de [`documentation-rules.md`](00-governance/documentation-rules.md).
3. Agregue una entrada bajo `[Unreleased]` en [CHANGELOG.md](CHANGELOG.md).
4. Incluya evidencia concreta en `Evidence / Validation` del Pull Request.
5. Solicite una segunda revisión; solo entonces retire el bloque `INSTRUCTIONS`.
