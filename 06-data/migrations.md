# 06 — Migraciones

> [!NOTE] INSTRUCTIONS
> Use el comando vigente del repositorio Database; no agregue una segunda puerta de calidad en esta documentación.

## Unidad de cambio

Una HU-DB agrupa el cambio de esquema necesario para una capacidad verificable. Conserva SQL de avance y rollback separados y su inclusión ordenada en el changelog.

## Flujo

```mermaid
flowchart TD
  HU[HU-DB lista] --> SQL[Forward y rollback]
  SQL --> CL[Incluir en changelog]
  CL --> UP[Liquibase update]
  UP --> CHECK[Validar estructura y grants]
  CHECK --> DOWN[Rollback aislado]
  DOWN --> AGAIN[Reaplicar]
  AGAIN --> EVIDENCE[Evidencia y exit code 0]
```

## Estado del changelog revisado

`changelog/changelog-master.yaml` incluye `01_ddl`, `02_dml`, `03_dcl` y `04_tcl`. Dentro de DDL se ordenan extensiones, esquemas, tablas, alteraciones, funciones e índices; los archivos correspondientes bajo `05_rollbacks/` contienen reversiones. La alteración 003 y el update DML de HU-DB-026 establecen el límite de evidencia; las alteraciones 004 y 005 introducen etapas de registro telefónico y `PHONE_SIMULATOR`. La alteración 006 y el update 002 de HU-DB-030 permiten secuencia positiva y configuran `max_evidence_count = 0`; su rollback restablece el límite de diez para inserciones nuevas y el valor de configuración a diez. Estos archivos no prueban que una base concreta los haya aplicado.

## Validación oficial

Desde el repositorio Database:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\test-release.ps1 -ReleaseTag <tag>
```

La ejecución solo es exitosa cuando termina con código `0` y el mensaje final de release aprobado. Una salida parcial no constituye evidencia suficiente.

## Rollback

- Limpiar fixtures dependientes antes de revertir una entidad padre.
- Usar `rollback-count` únicamente cuando los changesets de la historia sean globalmente contiguos.
- Confirmar que la reaplicación reproduce el estado esperado.
- No modificar checksums de cambios ya aplicados.
- HU-DB-030: coordinar la reversión de DML y DDL; el DDL vuelve a restringir inserciones a 1–10 con `NOT VALID`, conservando filas históricas superiores a diez. Probar el orden y compatibilidad antes de ejecutarlo.

## Responsabilidades

| Actor | Responsabilidad |
|---|---|
| Database | changeSets, SQL, rollback, grants y prueba |
| Backend | compatibilidad del acceso tras el cambio |
| Revisor | evidencia completa y alcance de la HU |

---

**Relacionados:** [`../05-architecture/decisions/records/ADR-003-postgresql-liquibase.md`](../05-architecture/decisions/records/ADR-003-postgresql-liquibase.md) · [`../11-quality/testing-strategy.md`](../11-quality/testing-strategy.md)
