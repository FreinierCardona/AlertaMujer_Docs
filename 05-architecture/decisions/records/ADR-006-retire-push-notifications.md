# ADR-006 — Retirar notificaciones push y usar panel interno

> [!NOTE] INSTRUCTIONS
> Decisión funcional y técnica aprobada para el siguiente incremento. Mantener separados el código FCM actual y el estado objetivo hasta completar las HUs relacionadas.

## Identificación

| Campo | Valor |
|---|---|
| Id | ADR-006 |
| Fecha | 2026-10-13 |
| Estado | Accepted |
| Autores | Equipo AlertaMujer |
| Sustituye | La decisión de usar FCM descrita por HU-API-014, HU-DB-016 y HU-DB-022 |

## Contexto

El producto implementa actualmente registro de tokens, un intento FCM por contacto y trazabilidad del resultado técnico. La entrega real a un dispositivo no está validada y depende de credenciales, servicios externos y configuración nativa. El nuevo alcance requiere que un contacto autenticado consulte dentro de la aplicación las alertas activas con las que tiene una relación aceptada, sin depender de push.

| Restricción | Fuente |
|---|---|
| Un contacto no es un rol global; sigue siendo `USER` | Modelo de contactos vigente |
| Solo una relación `ACCEPTED` entre cuentas habilitadas concede acceso | Reglas de contactos y seguridad |
| El panel muestra únicamente alertas abiertas vinculadas al contacto | Decisión funcional 2026-10-13 |
| El contacto nunca modifica ni finaliza la alerta ajena | Alcance inicial aprobado |
| El aviso persistente del servicio Android de ubicación no es push remoto y se conserva mientras sea técnicamente necesario | Flujo de alerta activa |

## Decisión

**Decidimos:** retirar FCM y los tokens de dispositivo del producto, y reemplazar el aviso a contactos por un panel interno derivado de alertas abiertas y relaciones de contacto aceptadas.

La campana de Home muestra un punto rojo cuando la consulta autorizada devuelve al menos una alerta abierta. El listado y el detalle se obtienen del Backend; no se crea una segunda fuente de verdad ni una tabla de “notificaciones” solo para copiar emergencias. El contacto puede leer datos mínimos de apoyo y evidencias de esa alerta mientras siga vinculado y autorizado, pero no puede acceder al chat administrativo, modificar estados ni finalizarla.

## Alternativas evaluadas

| Alternativa | Ventajas | Costos | Veredicto |
|---|---|---|---|
| Panel interno derivado de emergencias y contactos | Sin proveedor externo ni duplicación; estado actual | Requiere abrir o refrescar la app | Elegida |
| Mantener FCM y agregar el panel | Mayor oportunidad de aviso fuera de la app | Duplica canales y conserva credenciales, tokens y trazabilidad FCM | Descartada |
| Crear tabla de notificaciones internas | Permite leído/no leído histórico | Agrega estado no solicitado por el alcance inicial | Descartada |

## Consecuencias

| Tipo | Consecuencia |
|---|---|
| Positiva | Se elimina la dependencia de FCM, sus secretos, tokens y afirmaciones ambiguas de entrega. |
| Positiva | La campana, el listado y el detalle reflejan el estado autoritativo de emergencia. |
| Costo | Frontend debe agregar rutas, estados de carga/error/vacío y refresco al volver a Home. |
| Costo | Backend debe exponer consultas para el contacto y ampliar de forma explícita la autorización de evidencias. |
| Costo | Database debe retirar en una migración reversible `user_device_tokens` y `emergency_notification_attempts`, junto con índices, grants y schema vacío si aplica. |
| Riesgo | No hay aviso cuando la app está cerrada; debe comunicarse como límite del alcance inicial. |
| Riesgo | Una consulta mal autorizada podría exponer emergencias; las pruebas deben cubrir no-contacto, relación pendiente/rechazada, cuenta inhabilitada y alerta finalizada. |

## Ecosistemas afectados

- Frontend Mobile: retirar registro de token y requisito FCM; agregar campana, indicador, listado y detalle.
- Backend: retirar módulo/adaptador FCM y endpoint de tokens; agregar consultas seguras del contacto.
- Database: retirar persistencia exclusiva de FCM; reutilizar emergencias, ubicaciones, contactos y evidencias.
- Docs/Obsidian: sustituir RF9 y toda afirmación FCM por el panel interno.

## Revisión futura

Reabrir solo si el alcance incorpora avisos con la aplicación cerrada o requiere leído/no leído histórico. Esa ampliación exige una nueva decisión y no reactiva FCM implícitamente.

---

**Relacionados:** [`../../integrations.md`](../../integrations.md) · [`../../../04-requirements/change-package-evidence-internal-notifications.md`](../../../04-requirements/change-package-evidence-internal-notifications.md)
