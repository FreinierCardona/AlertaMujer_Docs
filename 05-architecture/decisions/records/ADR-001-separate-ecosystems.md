# ADR-001 — Separar Frontend, Backend y Database

> [!NOTE] INSTRUCTIONS
> Registro inicial derivado de la organización oficial. Conserve este bloque hasta que el equipo confirme responsables y fecha de aprobación.

## Identificación

| Campo | Valor |
|---|---|
| Id | ADR-001 |
| Fecha | Pendiente |
| Estado | Accepted |
| Autores | Pendiente |
| Sustituye | Ninguno |

## Contexto

AlertaMujer distribuye presentación, servicios y persistencia en repositorios independientes. La documentación debe respetar esa separación y evitar que un ecosistema sea presentado como propietario de otro.

| Restricción | Fuente |
|---|---|
| Frontend contiene Mobile y Web | Repositorio Frontend |
| Backend expone servicios e integraciones | Diseño Backend vigente |
| Database gobierna PostgreSQL y Liquibase | Repositorio Database |

## Decisión

**Decidimos:** mantener Frontend, Backend y Database como ecosistemas oficiales independientes, con contratos explícitos entre ellos.

La separación permite versionar responsabilidades técnicas distintas sin duplicar su detalle en este repositorio documental.

## Alternativas evaluadas

| Alternativa | Ventajas | Costos | Veredicto |
|---|---|---|---|
| Tres repositorios | Límites claros y evolución independiente | Coordinación de contratos | Elegida |
| Repositorio único | Cambios atómicos | Mezcla responsabilidades y ciclos | Descartada |

## Consecuencias

| Tipo | Consecuencia |
|---|---|
| Positiva | Cada ecosistema conserva una fuente técnica verificable |
| Costo | Los cambios transversales requieren trazabilidad entre repositorios |
| Riesgo | Contratos divergentes si no se revisan en conjunto |

**Documentos a actualizar:** catálogo de módulos, contratos y matriz de trazabilidad.

## Revisión futura

Revisar solo si cambia la distribución oficial de repositorios.

---

**Relacionados:** [`../../../09-modules/module-catalog.md`](../../../09-modules/module-catalog.md) · [`../../../07-api/README.md`](../../../07-api/README.md)
