# 07 — Convenciones REST

> [!NOTE] INSTRUCTIONS
> Estado: vigente como diseño. La implementación y las pruebas Backend permanecen pendientes.

## Recursos

| Regla | Aplicación |
|---|---|
| URI | sustantivos plurales y minúsculos |
| Versión | prefijo `/api/v1` |
| Formato | JSON UTF-8 |
| Identificador | UUID opaco |
| Fecha/hora | ISO 8601 con zona |

## Métodos

| Método | Uso | Repetición esperada |
|---|---|---|
| `GET` | consultar | segura e idempotente |
| `POST` | crear o ejecutar acción | definida por operación |
| `PUT` | reemplazar | idempotente |
| `PATCH` | modificar parcialmente | definida por contrato |
| `DELETE` | eliminar o desactivar | idempotencia documentada |

## Respuestas

Los códigos HTTP expresan resultado del protocolo; el cuerpo de error aporta código estable, mensaje comprensible, correlación y detalles seguros.

```json
{
  "code": "VALIDATION_ERROR",
  "message": "La solicitud contiene datos inválidos",
  "requestId": "uuid",
  "fields": []
}
```

## Paginación

Las colecciones usan `page` desde cero y `size` entre 1 y 50, con valor predeterminado 20. La respuesta incluye `items`, `page`, `size` y `total`.

## Seguridad

- Autenticación mediante mecanismo aprobado por Backend.
- Autorización por operación y propiedad del recurso.
- Ningún secreto o dato sensible en URL, log o ejemplo.
- Operaciones críticas con `requestId` y evento auditable cuando corresponda.

## Compatibilidad

Los cambios incompatibles requieren ADR, versión y plan de transición. Agregar un campo opcional no exime la revisión de consumidores.

---

**Relacionados:** [`./contracts/openapi/openapi-alertamujer-v1.yaml`](./contracts/openapi/openapi-alertamujer-v1.yaml) · [`../00-governance/definition-of-done.md`](../00-governance/definition-of-done.md)
