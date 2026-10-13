# 12 — Experiencia Mobile

> [!NOTE] INSTRUCTIONS
> Verifique rutas, nombres y estados en Frontend. No documente mocks como respuestas remotas.

## Usuario y propósito

Mobile acompaña a la usuaria en registro, sesión, configuración, contactos y flujo de emergencia.

## Áreas funcionales

| Área | Resultado esperado | Fuente |
|---|---|---|
| acceso | entrar o recuperar acceso de forma comprensible | HU Frontend |
| perfil | consultar y modificar datos permitidos | HU Frontend |
| contactos | administrar red de emergencia | HU Frontend |
| SOS | iniciar y seguir una emergencia | flujo funcional |
| ubicación | comunicar estado y permisos | requisito correspondiente |
| evidencia | capturar con consentimiento y estado | decisión pendiente de archivos |
| chat | intercambiar mensajes asociados al evento | contrato WSS pendiente |
| notificaciones internas | campana, indicador, listado y detalle de alertas vinculadas | ADR-006 y HU-AM-030/031 |

## Estados obligatorios

- Inicial, cargando, contenido, vacío, error y sin conexión.
- Permiso denegado con explicación y alternativa.
- Acción crítica pendiente, confirmada o fallida.
- Sesión expirada con retorno seguro.

## Localización

Los cuatro idiomas implementados —español, inglés, portugués y francés— pertenecen al mismo requisito funcional RF17. La selección no altera permisos ni lógica.

## Accesibilidad

Probar lector de pantalla, foco, tamaño de texto, contraste, orientación aplicable y objetivos táctiles.

## Integración

Mientras Backend no esté disponible, cada flujo que use mocks lo indica en evidencia y no atribuye persistencia real.

## Decisiones de cambio aprobadas

- La campana vive en Home y el punto rojo se deriva de alertas abiertas autorizadas; no representa leído/no leído.
- El contacto ve información mínima, Maps y evidencia de una alerta abierta vinculada; no ve perfil completo, chat administrativo ni controles de estado.
- Mobile convierte la captura a WebP antes de la carga y valida un máximo de 500 KB (500 000 bytes).
- Push remoto y registro de token se retiran. El aviso foreground requerido por ubicación en segundo plano es un mecanismo local distinto.

Estado: estas decisiones están documentadas, pero sus HUs siguen propuestas. El código actual todavía contiene FCM y la configuración Expo está ubicada fuera de `mobile/`, hallazgo que debe corregir HU-AM-028.

---

**Relacionados:** [`./_template-screen.md`](./_template-screen.md) · [`../03-product/functional-flow.md`](../03-product/functional-flow.md)
