# 05 — Integraciones

> [!NOTE] INSTRUCTIONS
> Cada integración declara consumidor, contrato, fallo y límite. Mantenga configuraciones y credenciales fuera del documento.

## Catálogo

| Integración | Consumidor | Uso | Fallo controlado |
|---|---|---|---|
| GPS Android | Mobile | coordenada inicial y seguimiento | bloquear creación o conservar última confirmada |
| Cámara Android | Mobile | fotografía WebP | error aislado; no bloquea SOS |
| Notificaciones Android | Mobile | permiso y aviso persistente | requisito visible; no inventar habilitación |
| Marcador Android | Mobile | abrir aplicación Teléfono | informar indisponibilidad |
| FCM | Backend | un intento por contacto elegible | registrar resultado; SOS no revierte |
| Google Maps | Web | mostrar coordenadas | conservar valores textuales |
| Sistema de archivos | Backend | almacenar fotografías privadas | compensación y reconciliación de huérfanos |
| PostgreSQL | Backend / Liquibase | datos operativos / migraciones | separar app y migrator |

## Responsabilidad

- Mobile produce coordenadas y fotografía; Maps solo presenta.
- Backend decide elegibilidad FCM y registra el intento.
- Database no llama proveedores externos ni almacena archivos.
- Frontend no contiene credenciales de servidor.

## Límites de servicio

| Integración | Límite definido |
|---|---|
| FCM | timeout 5 s, un intento, sin cola ni reintento automático |
| WSS | tres reconexiones: 1, 2 y 5 s; recuperación REST |
| Archivos | limpieza inmediata + un reintento; reconciliación >24 h |
| GPS | precisión y frecuencia sujetas a permisos y dispositivo |

Estado: Pendiente para cuotas, cuentas técnicas, dominios y configuración por ambiente de FCM y Maps.

---

**Relacionados:** [`../07-api/README.md`](../07-api/README.md) · [`../13-operations/runbook.md`](../13-operations/runbook.md)
