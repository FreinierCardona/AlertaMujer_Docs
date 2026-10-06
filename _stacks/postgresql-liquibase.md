# Stack — PostgreSQL y Liquibase

> [!NOTE] INSTRUCTIONS
> Las versiones y comandos se verifican contra Docker Compose, configuración Liquibase y scripts Database.

## Baseline de versión

| Elemento | Versión verificada | Fuente |
|---|---|---|
| PostgreSQL | 17.11 | Compose Database |
| Liquibase | 4.33 | tooling Database |
| Docker Compose | instalación local compatible | runbook |

## Distribución

Changelog raíz incluye cambios por HU-DB. Cada entidad conserva SQL de avance y rollback, sin consolidaciones amplias no aprobadas.

## Control de límites

- `alertamujer_owner` posee objetos.
- `alertamujer_migrator` aplica cambios.
- `alertamujer_app` usa permisos mínimos.
- Frontend nunca conecta a PostgreSQL.

## Migraciones

Usar `rollback-count` y `rollback-count-sql` en Liquibase 4.33 cuando el aislamiento por conteo sea válido. No modificar un changeSet ya aplicado.

## Capas de prueba

| Capa | Alcance |
|---|---|
| sintaxis | changelog y SQL |
| migración | update en base limpia |
| seguridad | grants efectivos |
| reversión | rollback y reaplicación |

## Comandos

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\test-release.ps1 -ReleaseTag <tag>
```

Éxito exige código cero y mensaje final `Release validation passed`.

---

**Relacionados:** [`../06-data/migrations.md`](../06-data/migrations.md) · [`../09-modules/database/runbook.md`](../09-modules/database/runbook.md)
