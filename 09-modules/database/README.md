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
| Entrada | HU-DB y modelo aprobado | [`../../04-requirements/database-stories.md`](../../04-requirements/database-stories.md) |
| Salida | esquema migrado y evidencia | changelog y prueba release |

## Dependencias

| Dependencia | Motivo | Tipo |
|---|---|---|
| PostgreSQL | motor persistente | runtime |
| Liquibase 4.33 | migraciones | build/runtime |
| Docker Compose | validación aislada | local |

## Estado

| Aspecto | Estado | Evidencia |
|---|---|---|
| HU-DB-001 a HU-DB-025 | Integradas en `develop` | repositorio oficial |
| HU-DB-025 | Aplicada | migración y merge verificados |
| Integración Backend | Pendiente | Backend sin código funcional |

## Criterio de cierre

- Release test termina con código cero y mensaje final exitoso.
- Avance, rollback, reaplicación y grants tienen evidencia.

---

**Relacionados:** [`data-model.md`](data-model.md) · [`decisions.md`](decisions.md) · [`runbook.md`](runbook.md)
