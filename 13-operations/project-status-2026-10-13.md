# Estado técnico de AlertaMujer — 2026-10-13

> [!NOTE] INSTRUCTIONS
> Corte verificable de repositorios locales, Docs y Obsidian. Los porcentajes ponderan implementación, integración, pruebas y coherencia documental; no representan horas consumidas.

## Avance evaluado

| Área | Avance | Evidencia y límite principal |
|---|---:|---|
| Frontend Mobile | 72% | Typecheck/lint pasan y hay clientes reales; faltan dispositivo/APK, WebP previo y panel interno; la configuración Expo está fuera de `mobile/`. |
| Frontend Web | 68% | Typecheck, lint y build pasan; Playwright aprobó 3/10. |
| Backend | 82% | HU-API-001 a 019 implementadas y 138 pruebas pasan con PostgreSQL; faltan API-020 a 022 y retirar FCM. |
| Base de datos | 88% | 25 HUs, 16 entidades y reglas consumidas por Backend; faltan DB-026/027 y nueva release aislada. |
| Documentación | 92% | Docs/Obsidian describen estado, transición, HUs y ADRs; falta evidencia de implementación propuesta. |
| Integración Frontend–Backend | 58% | Existen clientes REST/WSS, pero no recorrido Mobile real y Web E2E falla 7/10. |
| Integración Backend–Database | 94% | 138 pruebas sin fallos, errores ni omisiones sobre PostgreSQL 17.11; sin nueva release Database en este corte. |
| Funcionalidad general | 68% | Núcleo servidor/persistencia existe; faltan fotos confiables, panel de contactos y pruebas operativas. |
| Proyecto completo | 76% | Ponderación global; no equivale a preparación productiva. |

## Funcionamiento e inconsistencias

- Backend cubre identidad, sesiones, perfil, contactos, SOS, ubicación/estados, evidencia privada, chat, administración y jobs.
- Mobile/Web pasan análisis estático; Web genera build. La integración Web E2E sigue incompleta.
- El flujo actual acepta multipart de 10 MB, convierte a WebP y limita el archivo final/metadata a 1 MB.
- `mobile/app.json` fue movido a `web/src/shared/api/app.json`; Expo puede no aplicar permisos/plugins de cámara.
- Mobile envía JPEG/PNG original, usa timeout común de 15 segundos y no preconvierte WebP.
- El contacto no dispone de API, campana, listado, detalle ni acceso autorizado a evidencia ajena.
- FCM sigue implementado en los tres ecosistemas; ADR-006 define su retiro futuro.

## Diagnóstico de fotografías

No se demostró una causa única en dispositivo. Se verificaron cuatro bloqueadores: configuración Expo mal ubicada; contrato dividido entre entrada de 10 MB y salida final de 1 MB; ausencia de conversión Mobile; y timeout multipart de 15 segundos. Database no impide capturar, pero rechaza metadata final superior a 1 048 576 bytes. Backend además exige alerta propia abierta y máximo diez evidencias.

## Cambios aprobados

- WebP 500 KB: restaurar configuración Expo; convertir/validar antes de enviar; timeout específico; validar firma/MIME/dimensiones en Backend; migrar constraint/configuración a 500 000 bytes con rollback.
- Retiro push: eliminar dependencias, tokens, endpoint, listener, adaptador/secretos FCM, tablas, índices y grants; conservar solo el aviso local foreground que Android requiera.
- Panel interno: campana/punto rojo, listado y detalle con nombre, estado, activación, coordenadas, Maps y evidencia; relación `ACCEPTED`, cuentas habilitadas y alerta abierta; sin chat, PII innecesaria ni acciones de estado.

## Brechas

- Documentado no implementado: ADR-006/007 y HU-AM-028 a 031, HU-API-020 a 022, HU-DB-026/027; dispositivo, Maps, despliegue, TLS y operación.
- Implementado antes desactualizado: HU-AM-021 a 027, HU-API-013/019, 138 pruebas Backend y clientes Mobile/Web.
- Por definir: retención/capacidad de 10 x 500 KB, refresco del panel, forma del nombre, tratamiento histórico FCM y matriz Android.

## Evidencia del corte

| Verificación | Resultado |
|---|---|
| Mobile typecheck / lint | Aprobados |
| Web typecheck / lint / build | Aprobados; 41 módulos |
| Web Playwright | 3 aprobadas, 7 fallidas |
| Backend + PostgreSQL | 138 pruebas; 0 fallos, errores u omitidas |
| Database release aislada | No ejecutada; evidencia indirecta por Backend |

---

**Relacionados:** [paquete de cambio](../04-requirements/change-package-evidence-internal-notifications.md) · [ADR-006](../05-architecture/decisions/records/ADR-006-retire-push-notifications.md) · [ADR-007](../05-architecture/decisions/records/ADR-007-webp-evidence-up-to-10mb.md)
