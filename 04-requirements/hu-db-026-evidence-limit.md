# HU-DB-026 — Elevar límite de evidencia a 10 MB

> [!NOTE] INSTRUCTIONS
> Historia Propuesta. Implementar solo mediante nuevo changeset Liquibase con rollback verificable.

## Identificación

| Campo | Valor |
|---|---|
| Ecosistema | Database |
| Módulo | Emergency evidence / system configuration |
| Objetivo | Permitir metadata WebP final entre 1 y 10 485 760 bytes. |
| Alcance | Constraint, configuración semilla, comentarios, grants si cambian y pruebas release. |
| Precondiciones | ADR-007 y nombre real del constraint identificados. |
| Dependencias | HU-API-020; release anterior aplicada. |
| Candidatos | Nuevo changeset, master changelog, test/rollback de release. |
| Resultado | `alertamujer_app` inserta <=10 MB y PostgreSQL rechaza >10 MB. |

## Descripción

Reemplazar el constraint de 1 048 576 bytes y actualizar el valor de configuración sin editar migrations ya aplicadas.

## Criterios de aceptación

```gherkin
Escenario: límite válido
  Dado el release migrado
  Cuando se inserta file_size_bytes = 10485760
  Entonces PostgreSQL acepta la metadata

Escenario: límite excedido
  Cuando se inserta file_size_bytes = 10485761
  Entonces PostgreSQL rechaza por constraint

Escenario: rollback
  Cuando se revierte el changeset
  Entonces se restaura el límite anterior sin dejar objetos duplicados
```

## Validaciones

- Funcionales: valores 1, 10 MB y 10 MB + 1.
- Técnicas: validate, update, rollback/update, checksum, grants y prueba con rol aplicación.

---

**Relacionados:** [paquete](./change-package-evidence-internal-notifications.md) · [ADR-007](../05-architecture/decisions/records/ADR-007-webp-evidence-up-to-10mb.md)
