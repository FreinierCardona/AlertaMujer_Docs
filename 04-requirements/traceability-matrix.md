# 04 — Matriz de Trazabilidad

> [!NOTE] INSTRUCTIONS
> Cada fila termina en prueba y evidencia. Un guion indica un vacío que se registra en Brechas.

## Cómo leer las tablas

La cadena mínima es necesidad → RF/RNF → HU → ADR/contrato → módulo → prueba → evidencia. El documento enlaza fuentes; no copia sus definiciones completas.

## Cobertura funcional Backend

| Capacidad | RF | HU Backend | Decisión o contrato | Módulo | Evidencia actual |
|---|---|---|---|---|---|
| Identidad y perfil | RF1, RF3, RF16 | API-007 a 010, 018 | OpenAPI, ADR-002/003 | Identity / Shared | Registro, OTP, JWT, sesión, perfil y PostgreSQL |
| Contactos y aviso interno | RF2, RF9 | API-011, 021, 022 | ADR-006 y propuesta de contrato | Contacts / Emergency / Evidence | Contactos implementados; retiro FCM y panel interno pendientes |
| SOS, ubicación e historial | RF4, RF5, RF8 | API-012, 013, 018 | ADR-004, OpenAPI | Emergency | 201/200, carrera, bloqueo, transición e historial |
| Evidencia | RF7 | API-015, 018, 020, 022 | ADR-005/007 | Evidence | Flujo privado de 1 MB implementado; WebP previo/500 KB/acceso de contacto pendientes |
| Chat | RF15 | API-016 | WSS/STOMP | Chat | JWT, destino autorizado, idempotencia y persistencia |
| Administración y auditoría | RF10 a RF13 | API-009, 017, 018 | OpenAPI, ADR-002 | Administration | RBAC, atención, usuarios y auditoría inmutable |
| CORS y consumo web | RF1 a RF16 que usan API | API-019 | REST conventions | Shared / Security | Orígenes locales explícitos y prueba CORS |
| Marcador, sitio, idioma y tema | RF6, RF14, RF17, RF18 | No aplica | Design system y Frontend | Frontend | El Backend no es el dueño funcional |

Corte de evidencia: `scripts/verify-integration.ps1` ejecutado el 2026-10-13 sobre PostgreSQL 17.11 con 138 pruebas, 0 fallos, 0 errores y 0 omitidas. Las pruebas usan fixtures sintéticas y no acreditan despliegue, bandeja SMTP, dispositivo Mobile ni las HU propuestas.

## Requisitos no funcionales

| RNF | ADR o diseño | Prueba | Evidencia actual |
|---|---|---|---|
| RNF3 | Flujo SOS y timeouts | Emergencia y job interno | Transiciones y PostgreSQL verificados; métricas de tiempo siguen en refinamiento |
| RNF4 | ADR-002/003, security policy | Authz, JWT, sesión, grants y hashes | Suite Backend y PostgreSQL aprobadas |
| RNF5 | Design system | Teclado, contraste e idiomas | Evidencia propiedad de Frontend |
| RNF7 | Module boundaries y migrations | Límites, rol app y release Database | Backend no ejecuta DDL/Liquibase; Database conserva su release test |
| RNF9 | Observability | Correlación HTTP y logs seguros | X-Request-Id y contrato de error cubiertos; alertas/SLO pendientes |

## Brechas

| Id | Brecha | Criterio de cierre |
|---|---|---|
| GAP-01 | No hay evidencia de despliegue o promoción compartida | Ambiente, versión desplegada, rollback y responsables aprobados |
| GAP-02 | SMTP real no se validó con buzón y FCM sigue presente aunque ADR-006 ordena retirarlo | Validar SMTP y completar HU-AM-029/API-021/DB-027 |
| GAP-03 | No existe catálogo transversal TC/EV con propietario | IDs, responsable y repositorio de evidencia |
| GAP-04 | Configuración Expo ubicada en `web/src/shared/api/app.json`, fuera de Mobile | Restaurar `mobile/app.json` y validar cámara/permisos en build Android |
| GAP-05 | Playwright Web solo aprobó 3/10 casos el 2026-10-13 | Actualizar pruebas/mocks o corregir integración y obtener 10/10 |
| GAP-06 | Panel interno y WebP de 500 KB solo están documentados | Implementar y verificar HU-AM-028 a 031, HU-API-020 a 022 y HU-DB-026/027 |

---

**Relacionados:** [functional.md](./functional.md) · [backend-stories.md](./backend-stories.md) · [non-functional.md](./non-functional.md)
