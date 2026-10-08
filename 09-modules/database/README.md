# Database

> [!NOTE] INSTRUCTIONS
> Verifique conteos y comandos contra el repositorio Database en cada release.

## Propósito

Gobernar el modelo PostgreSQL, migraciones Liquibase, roles técnicos y validación de release.

## Responsabilidades

- Esquemas, tablas, constraints, índices y funciones.
- SQL de avance y rollback por HU-DB.
- Roles, grants mínimos y prueba reproducible.

## Fuera de alcance

- Reglas de interfaz o navegación.
- Orquestación de casos de uso Backend.
- Almacenamiento físico de archivos de evidencia.

## Entradas y salidas

| Dirección | Elemento | Contrato o fuente |
|---|---|---|
| Entrada | HU-DB y modelo aprobado | [../../04-requirements/database-stories.md](../../04-requirements/database-stories.md) |
| Salida | Esquema migrado y evidencia | Changelog y prueba release |

## Dependencias

| Dependencia | Motivo | Tipo |
|---|---|---|
| PostgreSQL | Motor persistente | Runtime |
| Liquibase 4.33 | Migraciones | Build/runtime |
| Docker Compose | Validación aislada | Local |

## Estado

| Aspecto | Estado | Evidencia |
|---|---|---|
| HU-DB-001 a HU-DB-025 | Integradas en develop | Repositorio oficial |
| HU-DB-025 | Aplicada | Migración y merge verificados |
| Consumo Backend | Verificado localmente | Suite Backend del 2026-10-08 contra PostgreSQL 17.11 con alertamujer_app |
| Propiedad de esquema | Database | Backend no ejecuta DDL, Liquibase ni grants |

## Criterio de cierre

- Release test termina con código cero y mensaje final exitoso.
- Avance, rollback, reaplicación y grants tienen evidencia.

---

**Relacionados:** [data-model.md](data-model.md) · [decisions.md](decisions.md) · [runbook.md](runbook.md)
