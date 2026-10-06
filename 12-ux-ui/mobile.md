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

## Estados obligatorios

- Inicial, cargando, contenido, vacío, error y sin conexión.
- Permiso denegado con explicación y alternativa.
- Acción crítica pendiente, confirmada o fallida.
- Sesión expirada con retorno seguro.

## Localización

Los cuatro idiomas implementados —español, inglés, portugués y francés— pertenecen al mismo requisito funcional RF18. La selección no altera permisos ni lógica.

## Accesibilidad

Probar lector de pantalla, foco, tamaño de texto, contraste, orientación aplicable y objetivos táctiles.

## Integración

Mientras Backend no esté disponible, cada flujo que use mocks lo indica en evidencia y no atribuye persistencia real.

---

**Relacionados:** [`./_template-screen.md`](./_template-screen.md) · [`../03-product/functional-flow.md`](../03-product/functional-flow.md)
