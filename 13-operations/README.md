# 13 — Operación

> [!NOTE] INSTRUCTIONS
> Estado operativo global: Pendiente. Conserve solo procedimientos verificables y marque lo que depende de infraestructura no aprobada.

## Propósito

Definir observabilidad, respuesta operativa y formato de incidentes para sostener el sistema.

## Documentos

| Documento | Pregunta |
|---|---|
| [`observability.md`](observability.md) | ¿Qué señales permiten detectar y explicar fallos? |
| [`runbook.md`](runbook.md) | ¿Cómo se diagnostica y recupera el sistema? |
| [`_template-incident.md`](_template-incident.md) | ¿Cómo se registra un incidente? |

## Alcance por ecosistema

| Ecosistema | Operación disponible |
|---|---|
| Frontend | validación local y diagnóstico de cliente |
| Backend | Pendiente hasta implementación |
| Database | runbook local de release validado |

## Fuera de alcance

- Inventar SLO, alertas o turnos.
- Incluir secretos en logs o incidentes.
- Ejecutar cambios destructivos sin alcance exacto.
- Confundir logs con auditoría de negocio.

## Listo cuando

- SLO, señales, responsables y escalamiento están aprobados.
- Runbooks fueron ensayados.
- Incidentes conservan línea de tiempo y acciones.
- Datos sensibles están redactados.

---

**Relacionados:** [`../10-devops/README.md`](../10-devops/README.md) · [`../00-governance/security-policy.md`](../00-governance/security-policy.md)
