# Registro de cambios

Los cambios siguen una estructura inspirada en Keep a Changelog y se agrupan por entrega documental.

## [Unreleased]

### Added

- ADR-006 para retirar notificaciones push y usar un panel interno derivado de alertas abiertas.
- ADR-007 para convertir a WebP antes de transferir y admitir archivos finales de hasta 500 KB.
- Paquete detallado HU-AM-028 a 031, HU-API-020 a 022 y HU-DB-026/027.
- Estado técnico del 2026-10-13 con porcentajes, diagnóstico fotográfico y brechas verificadas.
- Trazabilidad explícita RF a HU-API y límites de evidencia de proveedores externos.
- Procedimiento reproducible de validación integrada Backend desde el runbook documental.

### Changed

- Se registra evidencia actual: Backend 138/138; Frontend typecheck/lint/build aprobados; Web Playwright 3/10.
- Se distingue el FCM actualmente implementado de su retiro aprobado y todavía pendiente.
- Se documenta que la configuración Expo fue movida fuera de Mobile y que el flujo actual no convierte a WebP antes de enviar.
- Se sincroniza la documentación con la entrega Backend integrada de HU-API-001 a HU-API-019 en develop, merge d6b694e de la PR #19.
- Se renumeran los requisitos funcionales activos de forma continua: la anterior RF8 pasa a RF7 y la anterior RF19 pasa a RF18; se actualizan todas las referencias.
- Se actualizan catálogo HU-API, matriz de trazabilidad, modelo, arquitectura modular, API, runbook y estado de módulos.
- Se registra evidencia del 2026-10-08: 126 pruebas, 0 fallos, 0 errores y 0 omitidas contra PostgreSQL 17.11.
- Se separa la evidencia de código local de los pendientes operativos: SMTP/FCM reales, Docker de ambiente, TLS, SLO y promoción.


## [0.1.0] - 2026-10-06

### Added

- Primera consolidación de contexto, requisitos, arquitectura, datos, contratos, calidad y operación de AlertaMujer.
- Plantillas de retrospectiva, requisito, historia, ADR, API, módulo, prueba, pantalla, incidente, análisis, cambio arquitectónico, documento técnico y Pull Request.
- Guías tecnológicas para Frontend, Backend y Database.

### Changed

- Se reorganiza el repositorio según las secciones 00 a 13 y _stacks.
- Cada README incorpora propósito, documentos, fuera de alcance y condición de preparación.
- RF17 consolida español, inglés, portugués y francés.
- HU-DB-025 se registra como integrada y aplicada.
