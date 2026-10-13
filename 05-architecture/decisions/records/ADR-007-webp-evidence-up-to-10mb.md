# ADR-007 — Normalizar evidencia WebP de hasta 10 MB antes de transferirla

> [!NOTE] INSTRUCTIONS
> Esta decisión modifica el límite de ADR-005, pero conserva el almacenamiento local privado y la separación entre archivo y metadata. No declararla implementada sin pruebas de los tres ecosistemas.

## Identificación

| Campo | Valor |
|---|---|
| Id | ADR-007 |
| Fecha | 2026-10-13 |
| Estado | Accepted |
| Autores | Equipo AlertaMujer |
| Sustituye | Límite de 1 MB de ADR-005; no sustituye su decisión de almacenamiento |

## Contexto

El Backend actual admite una solicitud multipart de hasta 10 MB, pero convierte el resultado a WebP de máximo 1 MB y Database rechaza metadatos por encima de 1 048 576 bytes. Mobile captura JPEG/PNG con `expo-image-picker`, no convierte a WebP antes de enviar y cancela cualquier carga que exceda 15 segundos. Además, la configuración nativa de Expo se encuentra fuera del directorio Mobile, por lo que permisos y plugins no quedan respaldados por la ubicación esperada.

| Restricción | Fuente |
|---|---|
| Solo fotografías tomadas con cámara durante una alerta abierta | RF7 y flujo de emergencia |
| Máximo 10 evidencias confirmadas por emergencia | Regla vigente |
| Formato transferido y almacenado `image/webp` | Decisión 2026-10-13 |
| Tamaño máximo del WebP transferido y final: 10 485 760 bytes | Decisión 2026-10-13 |
| Archivo privado fuera de PostgreSQL | ADR-005 |

## Decisión

**Decidimos:** Mobile convierte la captura a WebP antes de enviarla y rechaza una salida WebP superior a 10 MB; Backend valida firma, MIME, dimensiones y tamaño, puede re-encodear para normalizar, y nunca persiste un archivo final superior a 10 MB.

La solicitud multipart admite el archivo WebP y un margen de protocolo suficiente. PostgreSQL conserva solo metadata y valida `file_size_bytes` entre 1 y 10 485 760. No se distribuye el archivo original JPEG/PNG y no se crea una fila si falla la conversión, validación o escritura.

## Alternativas evaluadas

| Alternativa | Ventajas | Costos | Veredicto |
|---|---|---|---|
| WebP previo en Mobile + validación Backend | Reduce transferencia y mantiene control servidor | Requiere librería/flujo de conversión compatible con build Android | Elegida |
| Conversión solo en Backend | Cliente simple | Envía originales grandes y contradice la conversión previa requerida | Descartada |
| Guardar original y WebP | Conserva máxima fidelidad | Duplica almacenamiento y exposición | Descartada |

## Consecuencias

| Tipo | Consecuencia |
|---|---|
| Positiva | Formato y límite son coherentes desde captura hasta almacenamiento y consulta. |
| Costo | Frontend, Backend, Database, contratos y pruebas deben cambiar juntos. |
| Riesgo | Equipos de gama baja pueden tardar en convertir; la UI debe mostrar progreso, cancelación segura y reintento manual. |
| Riesgo | Diez archivos de 10 MB por alerta aumentan disco y transferencia; la operación debe vigilar capacidad y retención. |

## Revisión futura

Revisar cuando exista evidencia de dispositivo real, consumo de disco y tiempos de carga. Cualquier reducción o aumento exige migración, contrato y pruebas coordinadas.

---

**Relacionados:** [ADR-005](./ADR-005-local-evidence-files.md) · [`../../../04-requirements/change-package-evidence-internal-notifications.md`](../../../04-requirements/change-package-evidence-internal-notifications.md)
