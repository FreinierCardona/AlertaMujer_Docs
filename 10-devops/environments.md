# 10 — Ambientes

> [!NOTE] INSTRUCTIONS
> Estado: En refinamiento. No se documentan nombres, URLs o promociones no confirmadas.

## Ambientes confirmados

| Ambiente | Propósito | Estado |
|---|---|---|
| Local Frontend | Desarrollo Mobile/Web con mocks y contratos | Confirmado |
| Local Database | Migración y validación aislada | Confirmado |
| Local Backend | Ejecución Spring Boot contra PostgreSQL migrada | Confirmado; validación integrada local ejecutada |
| Contenedor Backend local | Imagen Backend con configuración externa | Configurado; validación de ambiente pendiente |

## Ambientes por aprobar

| Ambiente propuesto | Decisión necesaria |
|---|---|
| Desarrollo compartido | Responsables, acceso y datos |
| QA | Gate, dataset y promoción |
| Producción | Infraestructura, seguridad y operación |

## Separación

- Credenciales diferentes por ambiente.
- Bases, tokens y endpoints nunca se comparten por comodidad.
- Datos personales reales no se usan en validación local.
- Cada artefacto registra versión o commit desplegado.

## Promoción

Flujo, aprobadores, rollback y ventanas: Pendiente. Hasta aprobarlos, no se presenta un pipeline de promoción como existente.

## Evidencia requerida

Versión, ambiente, resultado de gates y responsable de aprobación, sin secretos ni datos personales.

---

**Relacionados:** [ci-cd.md](./ci-cd.md) · [../13-operations/runbook.md](../13-operations/runbook.md)
