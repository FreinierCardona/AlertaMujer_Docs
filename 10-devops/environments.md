# 10 — Ambientes

> [!NOTE] INSTRUCTIONS
> Estado: En refinamiento. No se documentan nombres, URLs o promociones no confirmadas.

## Ambientes confirmados

| Ambiente | Propósito | Estado |
|---|---|---|
| Local Frontend | desarrollo Mobile/Web con mocks | Confirmado |
| Local Database | migración y validación aislada | Confirmado |
| Local Backend | ejecución de servicios | Pendiente |

## Ambientes por aprobar

| Ambiente propuesto | Decisión necesaria |
|---|---|
| Desarrollo compartido | responsables, acceso y datos |
| QA | gate, dataset y promoción |
| Producción | infraestructura, seguridad y operación |

## Separación

- Credenciales diferentes por ambiente.
- Bases, tokens y endpoints nunca se comparten por comodidad.
- Datos personales reales no se usan en validación local.
- Cada artefacto registra versión o commit desplegado.

## Configuración

| Tipo | Repositorio | Ambiente |
|---|---|---|
| valor no sensible | ejemplo versionado cuando exista | valor concreto |
| secreto | nunca | almacén seguro Pendiente |
| endpoint | nombre de variable | URL autorizada |

## Promoción

Flujo, aprobadores, rollback y ventanas: **Pendiente**. Hasta aprobarlos, no se presenta un pipeline de promoción como existente.

## Evidencia requerida

Versión, ambiente, resultado de gates y responsable de aprobación, sin secretos ni datos personales.

---

**Relacionados:** [`./ci-cd.md`](./ci-cd.md) · [`../13-operations/runbook.md`](../13-operations/runbook.md)
