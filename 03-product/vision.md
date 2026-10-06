# 03 — Visión

> [!NOTE] INSTRUCTIONS
> La visión guía prioridad; no sustituye criterios de aceptación o evidencia técnica.

## Declaración de visión

Para personas que necesitan solicitar apoyo ante riesgo, AlertaMujer es un sistema de asistencia que reúne preparación, SOS, ubicación, evidencia y comunicación en un flujo trazable. A diferencia de acciones aisladas del dispositivo, conserva un estado compartido y comunica claramente lo confirmado, lo fallido y lo pendiente.

## Objetivos

| Id | Objetivo | Evidencia de avance |
|---|---|---|
| OBJ-01 | Reducir pasos y ambigüedad al activar SOS | flujo Mobile con precondiciones y confirmación Backend |
| OBJ-02 | Mantener una fuente confiable del estado de emergencia | transiciones serializadas e historial persistido |
| OBJ-03 | Entregar contexto autorizado para atención | panel con ubicación, evidencia y chat contextual |
| OBJ-04 | Proteger identidad y datos sensibles | sesión revocable, RBAC, mínimo privilegio y archivos privados |
| OBJ-05 | Evitar promesas técnicas falsas | estados de red/FCM/Maps visibles y evidencia verificable |
| OBJ-06 | Mantener evolución coordinada | contratos, migraciones y documentación viva |

## Revisión de la visión

La visión se revisa cuando cambia el actor principal, el límite de responsabilidad, el modelo de atención o la separación de ecosistemas. Un framework, pantalla o proveedor nuevo no cambia por sí solo la visión.

| Pregunta | Respuesta vigente |
|---|---|
| ¿Garantiza respuesta institucional? | No. |
| ¿Garantiza entrega FCM? | No. |
| ¿La usuaria conserva control del cierre? | Sí. |
| ¿El sistema opera en cuatro idiomas? | Sí, bajo RF18. |

---

**Relacionados:** [`./problem-framing.md`](./problem-framing.md) · [`../01-context/overview.md`](../01-context/overview.md)
