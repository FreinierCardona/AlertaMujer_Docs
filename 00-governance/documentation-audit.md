# 00 — Auditoría Documental

> [!NOTE] INSTRUCTIONS
> Actualice esta fotografía solo con evidencia fechada. No la use como reemplazo de las fuentes principales.

## Corte verificado: 2026-10-08

| Ecosistema | Implementación observada | Límite o pendiente operativo |
|---|---|---|
| Frontend | Mobile React Native/Expo y Web React/Vite; HU-AM-001 a 027 con código integrado | Mobile sin prueba de dispositivo; Playwright Web 3/10; HU-AM-028 a 031 pendientes |
| Backend | HU-API-001 a 019 integradas en `f2edcb5`; 138 pruebas aprobadas contra PostgreSQL 17.11 el 2026-10-13 | HU-API-020 a 022, despliegue, TLS, SMTP real, SLO y promoción pendientes |
| Database | 25 HU-DB, 7 schemas, 16 entidades y 62 changesets; HU-DB-025 aplicada | El Backend consume el esquema sin poseer migraciones |
| Docs | Secciones 00 a 13, stacks y plantillas por dominio | Segunda revisión humana de cada documento |

## Inconsistencias reconciliadas

| Antes | Evidencia | Resolución |
|---|---|---|
| Backend se describía como scaffold sin rutas | develop contiene merges de las PR #1 a #19 | Se documentan capacidades y pruebas reales, sin declarar producción |
| HU-API-019 se resumía solo como evidencia de release | Commit 70d9fdb incorpora CORS y el procedimiento de integración | Se registra CORS local y suite reproducible, con límites de operación |
| Secuencia RF saltaba de RF6 a RF8 | Se aprobó renumerar los requisitos activos | RF1 a RF18 queda continua y todas las referencias se actualizan |
| Integración externa podía confundirse con código | FCM/SMTP producen resultados técnicos | FCM queda como implementación vigente en retirada; SMTP conserva límite de evidencia |

## Decisiones y brechas del 2026-10-13

- ADR-006 reemplaza push por un panel interno para contactos; no está implementado.
- ADR-007 reduce a 500 KB (500 000 bytes) el WebP transferido/final y exige conversión previa en Mobile; el código y la BD siguen en 1 MB final.
- La configuración Expo está ubicada en `web/src/shared/api/app.json` y debe volver a Mobile.
- Las fuentes oficiales quedan alineadas en alcance y backlog; la continuidad histórica puede conservar referencias FCM solo como estado anterior.
| Backend y Database podían confundirse en propiedad | Pruebas usan alertamujer_app, Liquibase permanece fuera | Se preserva el límite de ecosistemas |

## Controles ejecutados

- Revisión del estado Git y merges de Backend hasta la PR #19.
- Ejecución de scripts/verify-integration.ps1 con PostgreSQL 17.11: 126 pruebas, 0 fallos, 0 errores y 0 omitidas.
- Revisión de módulos, rutas REST, STOMP, jobs y configuración CORS del checkout Backend.
- Validación documental y enlaces del repositorio Docs pendiente de ejecutar al cierre de esta actualización.

---

**Relacionados:** [documentation-rules.md](./documentation-rules.md) · [../04-requirements/traceability-matrix.md](../04-requirements/traceability-matrix.md) · [../09-modules/module-catalog.md](../09-modules/module-catalog.md)
