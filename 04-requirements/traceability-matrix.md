# 04 — Matriz de Trazabilidad

> [!NOTE] INSTRUCTIONS
> Cada fila debe terminar en prueba y evidencia. Un guion indica un vacío que se registra en “Brechas”.

## Cómo leer las tablas

La cadena mínima es necesidad → RF/RNF → HU → ADR/contrato → módulo → prueba → evidencia. El documento enlaza fuentes; no copia sus definiciones completas.

## Historias

| Capacidad | RF | HU | Decisión/contrato | Módulo | Prueba esperada |
|---|---|---|---|---|---|
| Identidad | RF1 | AM-001/002; DB-008..013/025; API-007..010 | OpenAPI; ADR-002/003 | Identity | registro, OTP, JWT y revocación |
| Contactos | RF2, RF10 | AM-003; DB-015/022; API-011/014 | OpenAPI | Contacts / Notification | estados, concurrencia y FCM |
| SOS | RF4, RF5 | AM-006..008; DB-017..019; API-012/013 | ADR-004 | Emergency / Location | idempotencia, estados y ubicación |
| Evidencia | RF8 | AM-009/018; DB-020; API-015 | ADR-005 | Evidence | límites, archivo, hash y autorización |
| Historial | RF9 | AM-011; DB-017..021; API-013 | OpenAPI | Emergency | detalle propio en lectura |
| Chat | RF16 | AM-010/018; DB-021; API-016 | WSS/STOMP | Chat | auth, idempotencia y persistencia |
| Administración | RF11..14 | AM-014..020; DB-023/025; API-017 | OpenAPI; ADR-002 | Administration | RBAC, atención y auditoría |
| Experiencia | RF15, RF18, RF19 | AM-005/013/015 | Design system | Frontend | cuatro idiomas, tema y accesibilidad |

## Requisitos no funcionales

| RNF | ADR/diseño | Prueba | Evidencia |
|---|---|---|---|
| RNF3 | flujo SOS / timeouts por definir | integración degradada | EV-SOS pendiente |
| RNF4 | ADR-002/003; security policy | authz, sesión, grants | suite Backend pendiente; Database disponible |
| RNF5 | design system | teclado, contraste, idiomas | catálogo transversal pendiente |
| RNF7 | module boundaries / migrations | boundary + release gate | `test-release.ps1` para Database |
| RNF9 | observability | correlación de request | Backend pendiente |

## Brechas

| Id | Brecha | Criterio de cierre |
|---|---|---|
| GAP-01 | Solo existe prueba de contexto Backend; faltan suites por vertical | API implementada y pruebas de integración/contrato |
| GAP-02 | No existe catálogo TC/EV transversal | IDs, propietario y repositorio de evidencia |
| GAP-03 | Umbrales RNF incompletos | valor, fuente y prueba aprobados |

---

**Relacionados:** [`./user-stories.md`](./user-stories.md) · [`./non-functional.md`](./non-functional.md)
