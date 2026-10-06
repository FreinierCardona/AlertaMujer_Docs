# 00 — Convenciones Git

> [!NOTE] INSTRUCTIONS
> Este documento separa convenciones observadas de decisiones pendientes. Mantenga el bloque hasta aprobar promoción y protección de ramas.

## Estrategia de ramas

| Repositorio | Estado observado | Regla aplicable |
|---|---|---|
| Frontend | `main`, `qa`, `develop`; trabajo HU desde `develop` | `feat/hu-am-NNN-dev` → Pull Request a `develop` |
| Database | `main`, `qa`, `develop`; HU y fixes desde `develop` | `feat/hu-db-NNN-dev` o `fix/<descripcion>` → `develop` |
| Backend | Solo `main` y README inicial | Estado: Pendiente de convención y rama de integración |
| Docs | `main` con cambios locales | `docs/<descripcion-kebab-case>` cuando el equipo adopte ramas documentales |

## Nombres de rama

```text
feat/hu-am-NNN-dev
feat/hu-db-NNN-dev
fix/<descripcion-kebab-case>
docs/<descripcion-kebab-case>
```

## Formato de commit

```text
type(scope): imperative summary in English
```

Tipos permitidos: `feat`, `fix`, `docs`, `test`, `refactor`, `chore`, `revert`. El scope usa el identificador o dominio estable; el mensaje no afirma pruebas no ejecutadas.

## Política de integración

- Pull Request antes de integrar; actualización documental y evidencia en el mismo cambio.
- Descripción con `Summary`, `Scope`, `Out Of Scope`, `Evidence / Validation`, `Impact`, `Checklist`.
- No reescribir changesets Liquibase aplicados.
- No promover a `qa` o `main` sin política aprobada.
- Estado: En refinamiento para aprobaciones mínimas, protección, squash/rebase y promoción.

---

**Relacionados:** [`agile-conventions.md`](./agile-conventions.md) · [`_template-pull-request.md`](./_template-pull-request.md)
