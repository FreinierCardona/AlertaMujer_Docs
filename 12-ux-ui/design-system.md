# 12 — Sistema de diseño

> [!NOTE] INSTRUCTIONS
> Estado: En refinamiento. Extraiga valores exactos de Frontend antes de declarar tokens oficiales.

## Fundamentos

| Fundamento | Regla | Estado |
|---|---|---|
| Color | semántica consistente para acción, éxito, alerta y error | En refinamiento |
| Tipografía | jerarquía legible y escalable | En refinamiento |
| Espaciado | escala repetible | En refinamiento |
| Movimiento | no bloquear comprensión | Pendiente |
| Iconografía | etiqueta accesible cuando sea necesaria | Normativa |

## Componentes esenciales

| Componente | Estados mínimos |
|---|---|
| Botón | normal, foco, presionado, deshabilitado, cargando |
| Campo | vacío, foco, válido, inválido, deshabilitado |
| Alerta | información, éxito, advertencia, error |
| Diálogo | abierto, confirmación, cancelación, error |
| Lista | cargando, datos, vacío, error |

## Accesibilidad

- Nombre, rol y estado comprensibles por tecnología asistiva.
- Orden de foco lógico y foco visible.
- Contraste suficiente según el criterio adoptado por el proyecto.
- Acción no dependiente solo de color, gesto o sonido.
- Áreas táctiles apropiadas en Mobile.

## Localización

Español, inglés, portugués y francés comparten claves funcionales. Ningún texto visible se codifica fuera del mecanismo i18n salvo excepción documentada.

## Gobierno

Un componente nuevo demuestra necesidad no cubierta, estados, accesibilidad, localización y pruebas antes de incorporarse.

## Pendientes

- Inventario exacto de tokens implementados.
- Criterio WCAG y matriz formal de conformidad.

---

**Relacionados:** [`./mobile.md`](./mobile.md) · [`./web.md`](./web.md)
