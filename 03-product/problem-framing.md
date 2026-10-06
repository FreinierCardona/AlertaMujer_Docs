# 03 — Planteamiento del Problema

> [!NOTE] INSTRUCTIONS
> Mantenga el problema independiente de una solución tecnológica específica.

## El problema

Una persona en situación de riesgo necesita activar ayuda, compartir contexto y mantener continuidad aun cuando permisos, GPS, red o servicios externos fallen parcialmente. Sin un flujo único, el estado puede ser ambiguo y la atención carecer de trazabilidad.

## A quién afecta

| Actor | Dificultad | Consecuencia |
|---|---|---|
| Usuaria | Coordinar contacto, ubicación, evidencia y comunicación bajo estrés | activación tardía o falsa percepción de envío |
| Administrador | Priorizar alertas sin contexto consolidado | atención incompleta o decisiones sobre estado no confirmado |
| Contacto | Saber si existe una emergencia relevante | notificación sin garantía de entrega/lectura |
| Equipo técnico | Mantener reglas coherentes en tres repositorios | contradicciones entre UI, contrato y datos |

## Costo de no actuar

- Interacciones fragmentadas durante un evento sensible.
- Información operativa sin origen o estado verificable.
- Promesas de entrega, seguimiento o atención que el sistema no puede garantizar.
- Duplicación SOS, pérdida de evidencia o autorización inconsistente.
- Evolución técnica con reglas divergentes entre ecosistemas.

## Criterio de éxito

El flujo se considera eficaz cuando una usuaria preparada puede crear una única emergencia abierta con ubicación confirmada; cada acción posterior es autorizada, trazable y comunica límites sin inventar éxito.

| Indicador | Estado |
|---|---|
| Flujo funcional completo | Definido; integración Backend pendiente. |
| Métricas cuantitativas de tiempo/éxito | Estado: En refinamiento. |

---

**Relacionados:** [`./vision.md`](./vision.md) · [`../01-context/scope.md`](../01-context/scope.md)
