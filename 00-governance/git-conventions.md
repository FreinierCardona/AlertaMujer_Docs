# 00 — Convenciones Git

> [!NOTE] INSTRUCTIONS
> Este documento separa convenciones observadas de decisiones pendientes. Mantenga el bloque hasta aprobar promoción y protección de ramas.

## Estrategia de ramas

| Repositorio | Estado observado | Regla aplicable |
|---|---|---|
| Frontend | main, qa, develop; trabajo HU desde develop | feat/hu-am-NNN-dev → Pull Request a develop |
| Database | main, qa, develop; HU y fixes desde develop | feat/hu-db-NNN-dev o fix/descripcion → develop |
| Backend | develop contiene las PR #1 a #19 | feat/hu-api-NNN-dev → Pull Request a develop |
| Docs | main con cambios locales | docs/descripcion-kebab-case cuando el equipo adopte ramas documentales |

## Nombres de rama

- feat/hu-am-NNN-dev
- feat/hu-db-NNN-dev
- feat/hu-api-NNN-dev
- fix/descripcion-kebab-case
- docs/descripcion-kebab-case

## Formato de commit

Para Backend, un cambio por HU usa type(hu-api-NNN): resumen imperativo en inglés y minúscula. Tipos permitidos: feat, fix, refactor, test, docs, build y chore. Los cambios fuera de una HU usan platform o backend como scope. No use update o changes como resumen.

La descripción de Pull Request mantiene Summary, Scope, Out Of Scope, Evidence / Validation, Impact y Checklist. El mensaje no afirma pruebas, push o PR que no existan.

## Política de integración

- Pull Request antes de integrar; actualización documental y evidencia en el mismo cambio.
- No reescribir changesets Liquibase aplicados.
- No promover a qa o main sin política aprobada.
- Aprobaciones mínimas, protección, squash/rebase y promoción permanecen En refinamiento.

---

**Relacionados:** [agile-conventions.md](./agile-conventions.md) · [_template-pull-request.md](./_template-pull-request.md)
