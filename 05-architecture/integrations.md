# 05 — Integraciones

> [!NOTE] INSTRUCTIONS
> Cada integración declara consumidor, contrato, fallo y límite. Mantenga configuraciones y credenciales fuera del documento.

## Catálogo

| Integración | Consumidor | Uso | Fallo controlado |
|---|---|---|---|
| GPS Android | Mobile | coordenada inicial y seguimiento | bloquear creación o conservar última confirmada |
| Cámara/conversión Android | Mobile | captura y WebP previo de hasta 500 KB | error aislado; no bloquea SOS |
| Aviso foreground Android | Mobile | informar ubicación activa en segundo plano | conservar solo el mecanismo local requerido; no confundir con push remoto |
| Marcador Android | Mobile | abrir aplicación Teléfono | informar indisponibilidad |
| Google Maps | Web | mostrar coordenadas | conservar valores textuales |
| Sistema de archivos | Backend | almacenar fotografías privadas | compensación y reconciliación de huérfanos |
| PostgreSQL | Backend / Liquibase | datos operativos / migraciones | separar app y migrator |

## Responsabilidad

- Mobile produce coordenadas y fotografía; Maps solo presenta.
- Backend autoriza las consultas internas del contacto desde emergencias y relaciones aceptadas.
- Database no llama proveedores externos ni almacena archivos.
- Frontend no contiene credenciales de servidor.

## Límites de servicio

| Integración | Límite definido |
|---|---|
| WSS | tres reconexiones: 1, 2 y 5 s; recuperación REST |
| Archivos | WebP <=500 KB (500 000 bytes); limpieza inmediata + un reintento; reconciliación >24 h |
| GPS | precisión y frecuencia sujetas a permisos y dispositivo |

Estado de transición: el código vigente aún integra FCM; ADR-006 ordena retirarlo mediante HU-AM-029, HU-API-021 y HU-DB-027. Maps y el aviso foreground Android permanecen. La operación de Maps sigue pendiente de configuración por ambiente.

---

**Relacionados:** [`../07-api/README.md`](../07-api/README.md) · [`../13-operations/runbook.md`](../13-operations/runbook.md)
