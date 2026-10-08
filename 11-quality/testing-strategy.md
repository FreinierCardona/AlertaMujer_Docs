# 11 — Estrategia de pruebas

> [!NOTE] INSTRUCTIONS
> Seleccione pruebas por riesgo y ecosistema. Los nombres concretos de comandos provienen de cada repositorio.

## Capas

| Capa | Frontend | Backend | Database |
|---|---|---|---|
| Estática | tipos, lint, formato | build Maven y revisión de formato | sintaxis y changelog |
| Unidad | componentes, hooks, servicios | dominio y aplicación objetivo | funciones donde aplique |
| Integración | navegación y adaptadores | repositorios y proveedores | update/grants/constraints |
| Contrato | cliente contra especificación | OpenAPI/WSS | compatibilidad física |
| E2E | registro, sesión, SOS, operación | orquestación completa | participa como dependencia |

## Riesgos prioritarios

- Autorización y aislamiento entre usuarias.
- Inicio SOS duplicado o perdido.
- Ubicación, evidencia y chat asociados al evento correcto.
- Revocación de sesión y eliminación autorizada.
- Rollback Database y privilegios mínimos.
- Consistencia de los cuatro idiomas en Frontend.

## Evidencia mínima

| Campo | Contenido |
|---|---|
| Alcance | HU, requisito o defecto |
| Ambiente | local/compartido y versiones |
| Ejecución | comando o caso exacto |
| Resultado | aprobado/fallido y salida final |
| Artefacto | log, reporte o captura segura |

## Reglas de aceptación

Un gate solo pasa con estado final exitoso. Una prueba omitida declara motivo y riesgo; no se registra como aprobada.

## Datos de prueba

Usar datos sintéticos. Limpiar dependencias antes de rollback y nunca incluir información personal o secretos en evidencia.

## Estado

La estrategia sigue siendo normativa, pero el Backend ya tiene suites unitarias, MVC e integración PostgreSQL. El 2026-10-08, scripts/verify-integration.ps1 terminó con 126 pruebas, 0 fallos, 0 errores y 0 omitidas. Una integración de Frontend, SMTP/FCM reales, Docker de ambiente y producción sigue requiriendo evidencia propia.

---

**Relacionados:** [`./_template-test-case.md`](./_template-test-case.md) · [`../06-data/migrations.md`](../06-data/migrations.md)
