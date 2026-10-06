# Frontend — Decisiones

> [!NOTE] INSTRUCTIONS
> Mantenga aquí decisiones verificadas en Frontend y enlaces a ADR globales; no replique sus argumentos.

## Decisiones aplicables

| Decisión | Estado | Impacto local |
|---|---|---|
| ADR-001 | Accepted | Frontend permanece repositorio independiente |
| Cuatro idiomas | Implementado | español, inglés, portugués y francés en el mismo RF |
| Mobile y Web | Implementado | superficies separadas en el repositorio |

## Convenciones locales

| Convención | Razón | Fuente |
|---|---|---|
| Ramas `feat/hu-am-NNN-dev` | trazabilidad de HU | gobernanza Git |
| Estado simulado explícito | evita falsa integración | evidencia del repositorio |

## Pendientes

| Id | Pregunta | Responsable | Criterio de cierre |
|---|---|---|---|
| FE-PEN-01 | ¿Cómo se almacenará la sesión real? | Pendiente | contrato Backend y prueba de seguridad |
| FE-PEN-02 | ¿Cómo se recuperará chat tras reconexión? | Pendiente | contrato WSS aprobado |

## Conflictos

No se conserva ningún alcance asociado al requisito funcional eliminado. La numeración vigente salta de RF6 a RF8.

## Revisión

Revisar al integrar servicios reales o modificar recursos de localización.

---

**Relacionados:** [`README.md`](README.md) · [`../../05-architecture/decisions/README.md`](../../05-architecture/decisions/README.md)
