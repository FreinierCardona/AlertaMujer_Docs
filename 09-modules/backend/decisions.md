# Backend — Decisiones

> [!NOTE] INSTRUCTIONS
> Registre una decisión como aplicada solo cuando exista evidencia en Backend.

## Decisiones aplicables

| Decisión | Estado | Impacto local |
|---|---|---|
| ADR-001 | Accepted | Backend es ecosistema independiente |
| ADR-002 | Accepted como diseño | módulos por capacidad en un despliegue |
| ADR-004 | Accepted como diseño | emergencia abierta es clave natural SOS |
| ADR-005 | Accepted como diseño | archivos en almacenamiento local controlado |

## Convenciones locales

| Convención | Razón | Fuente |
|---|---|---|
| dependencias hacia interfaces públicas | proteger límites | arquitectura modular |
| DTO separados de persistencia | evitar acoplamiento | arquitectura por capas |

## Definiciones listas para implementar

| Id | Estado documental | Trabajo pendiente | Criterio de cierre |
|---|---|---|---|
| BCK-PEN-01 | REST `/api/v1` y WSS/STOMP documentados | implementar y probar contratos | pruebas contractuales aprobadas |
| BCK-PEN-02 | JWT HS256, sesiones y roles definidos | filtros, revocación y autorización | casos `401`/`403`/revocación |
| BCK-PEN-03 | Administrador inicial/reemplazo controlado | operación interna y runbook | transición atómica comprobada |
| BCK-PEN-09/10 | SOS y timeout tienen semántica documentada | concurrencia, bloqueos e historial | `201`/`200` y carreras cubiertas |

## Conflictos

Los documentos objetivo no constituyen evidencia de código. Cualquier diferencia se resuelve contra requisitos, contrato, Database y decisiones aprobadas; los demás focos se agrupan en [readiness.md](readiness.md).

## Revisión

Revisar en la primera implementación funcional y en cada cambio de contrato.

---

**Relacionados:** [`README.md`](README.md) · [`readiness.md`](readiness.md) · [`../../05-architecture/decisions/README.md`](../../05-architecture/decisions/README.md)
