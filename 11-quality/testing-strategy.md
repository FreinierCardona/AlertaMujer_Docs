# 11 — Estrategia de pruebas

> [!NOTE] INSTRUCTIONS
> Seleccione pruebas por riesgo y ecosistema. Los nombres concretos de comandos provienen de cada repositorio.

## Capas

| Capa | Frontend | Backend | Database |
|---|---|---|---|
| Estática | tipos, lint, formato | Pendiente | sintaxis y changelog |
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

La estrategia es normativa; suites Backend y E2E integradas permanecen **Pendiente**.

---

**Relacionados:** [`./_template-test-case.md`](./_template-test-case.md) · [`../06-data/migrations.md`](../06-data/migrations.md)
