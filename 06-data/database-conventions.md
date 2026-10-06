# 06 — Convenciones de base de datos

> [!NOTE] INSTRUCTIONS
> Las convenciones describen evidencia vigente. Una regla nueva necesita historia, migración y validación antes de declararse obligatoria.

## Nombres y separación

| Elemento | Convención |
|---|---|
| Esquemas | minúscula, capacidad singular |
| Tablas y columnas | `snake_case` |
| Claves | UUID generado en PostgreSQL |
| Constraints | nombre explícito y semántico |
| Cambios | `hu-db-NNN` y changeSets ordenados |

## Roles técnicos

| Rol | Responsabilidad | Límite |
|---|---|---|
| `alertamujer_owner` | propiedad de objetos | no ejecuta la aplicación |
| `alertamujer_migrator` | aplicar Liquibase | no atiende tráfico funcional |
| `alertamujer_app` | operaciones concedidas | no altera estructura |

Los permisos se validan en una base desechable nueva; no se asume que un entorno antiguo represente grants actuales.

## Integridad

- Claves foráneas expresan dependencias persistentes.
- Restricciones únicas evitan duplicados definidos por el dominio.
- Checks limitan estados y valores conocidos cuando están implementados.
- Índices responden a accesos confirmados; no sustituyen medición.
- Timestamps y auditoría siguen la definición de cada changeset.

## Seguridad de datos

Material sensible como hashes de sesión se accede mediante funciones protegidas cuando así lo implementa Database. Las credenciales no se documentan ni se versionan.

## Formato SQL

Las tablas se presentan en bloques semánticos comentados, columnas alineadas y constraints nombradas separadamente. El formato no debe alterar comportamiento.

## Excepciones

Cualquier excepción se registra en una HU-DB o ADR, incluye motivo, impacto, rollback y evidencia.

---

**Relacionados:** [`./migrations.md`](./migrations.md) · [`../00-governance/security-policy.md`](../00-governance/security-policy.md)
