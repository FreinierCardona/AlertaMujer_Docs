# 07 — Convenciones REST

> [!NOTE] INSTRUCTIONS
> Estado: Implementado en Backend y vigente para nuevas rutas. Revise el contrato OpenAPI y las pruebas cuando se cambie una operación.

## Recursos

| Regla | Aplicación |
|---|---|
| URI | Sustantivos plurales y minúsculos |
| Versión | Prefijo /api/v1 |
| Formato | JSON UTF-8; multipart solo para evidencia |
| Identificador | UUID opaco, salvo messageId consecutivo de chat |
| Fecha/hora | ISO 8601 con zona UTC |

## Métodos

| Método | Uso | Repetición esperada |
|---|---|---|
| GET | Consultar | Segura e idempotente |
| POST | Crear o ejecutar acción | Definida por operación; SOS recupera la emergencia abierta |
| PUT | Reemplazar | Idempotente cuando se incluya |
| PATCH | Modificar parcialmente | Definida por contrato |
| DELETE | Eliminar o desactivar | Idempotencia documentada por operación |

## Respuestas y correlación

Los errores comunes contienen code, message, requestId y fields cuando corresponde. X-Request-Id acepta un UUID válido o se genera en Backend, se devuelve al cliente y no transporta información sensible. Las colecciones usan page desde cero y size entre 1 y 50 con valor predeterminado 20.

## Seguridad

- Las rutas públicas se limitan a registro, verificación y flujos de autenticación definidos.
- Las demás rutas requieren Bearer JWT, sesión vigente, rol, propiedad y estado aplicables.
- Administración requiere ENTITY_ADMIN.
- CORS permite solo los orígenes exactos de CORS_ALLOWED_ORIGINS, sin comodines ni credenciales cross-site.
- Ningún secreto o dato sensible se registra en URL, log o ejemplo.

## Compatibilidad

Los cambios incompatibles requieren ADR, versión y plan de transición. Agregar un campo opcional no exime la revisión de consumidores ni de la matriz de trazabilidad.

---

**Relacionados:** [contracts/openapi/openapi-alertamujer-v1.yaml](contracts/openapi/openapi-alertamujer-v1.yaml) · [README.md](README.md) · [../00-governance/definition-of-done.md](../00-governance/definition-of-done.md)
