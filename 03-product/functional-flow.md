# 03 — Flujo Funcional

> [!NOTE] INSTRUCTIONS
> El flujo describe comportamiento confirmado; rutas y payloads pertenecen a `07-api`.

## Preparación

1. La usuaria registra y verifica su identidad, inicia sesión y completa perfil.
2. Configura mensaje de ayuda y establece al menos un contacto aceptado y válido.
3. Mobile evalúa ubicación foreground/background, notificaciones, GPS, red y coordenadas.
4. La cámara se solicita al capturar evidencia y no bloquea SOS.

## Emergencia

| Paso | Actor | Resultado confirmado |
|---|---|---|
| 1 | Usuaria | Mantiene SOS y confirma intención. |
| 2 | Mobile | Envía coordenada inicial y contexto válido. |
| 3 | Backend | Crea o recupera la emergencia abierta idempotente. |
| 4 | Database | Persiste emergencia, historial y primera ubicación. |
| 5 | Backend | Ejecuta un intento FCM por contacto elegible. |
| 6 | Mobile | Presenta el último estado confirmado. |
| 7 | Usuaria | Puede aportar fotografía, chat o abrir marcador. |
| 8 | Administrador | Consulta y puede iniciar atención. |
| 9 | Propietaria | Solicita finalización; `FINALIZED` es terminal. |

## Después de la emergencia

- Historial, ubicación, evidencia y chat quedan disponibles según autorización.
- El administrador consulta auditoría separada del historial de estados.
- FCM aceptado no se presenta como entrega o lectura.
- Pérdida de red conserva la última información confirmada sin inventar continuidad.

---

**Relacionados:** [`../04-requirements/user-stories.md`](../04-requirements/user-stories.md) · [`../08-uml/diagram-index.md`](../08-uml/diagram-index.md)
