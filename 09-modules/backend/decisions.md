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

## Pendientes

| Id | Pregunta | Responsable | Criterio de cierre |
|---|---|---|---|
| BCK-PEN-01 | ¿Cuál es el contrato OTP definitivo? | Pendiente | ADR y pruebas contractuales |
| BCK-PEN-02 | ¿Cómo se prueba la carrera SOS? | Pendiente | pruebas `201`, reintento `200` y concurrencia |
| BCK-PEN-03 | ¿Cómo se autoriza operación administrativa? | Pendiente | matriz de roles aprobada |

## Conflictos

Los documentos objetivo no constituyen evidencia de código. Cualquier diferencia se resuelve contra implementación revisada y decisiones aprobadas.

## Revisión

Revisar en la primera implementación funcional y en cada cambio de contrato.

---

**Relacionados:** [`README.md`](README.md) · [`../../05-architecture/decisions/README.md`](../../05-architecture/decisions/README.md)
