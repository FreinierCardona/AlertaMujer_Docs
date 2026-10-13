# HU-AM-031 — Consultar detalle y evidencias como contacto

> [!NOTE] INSTRUCTIONS
> Historia Propuesta. Mostrar solo datos necesarios para apoyo y retirar el acceso cuando deje de ser válido.

## Identificación

| Campo | Valor |
|---|---|
| Ecosistema | Frontend Mobile |
| Módulo | Detalle de alerta / evidencias |
| Objetivo | Presentar estado, propietaria, activación, ubicación, Maps y fotos autorizadas. |
| Alcance | Detalle solo lectura de alerta abierta vinculada. |
| Precondiciones | Relación `ACCEPTED`, cuentas habilitadas y alerta abierta. |
| Dependencias | ADR-006/007, HU-AM-030, HU-API-022. |
| Candidatos | Ruta de detalle, `EvidenceGallery`, cliente API, enlace Maps, tipos y pruebas. |
| Resultado | Lectura mínima sin correo, teléfono, perfil, chat ni acciones de estado. |

## Descripción

Consumir el contrato limitado, abrir coordenadas en Google Maps y descargar WebP con JWT sin exponer rutas físicas.

## Criterios de aceptación

```gherkin
Escenario: detalle autorizado
  Dado contacto aceptado y alerta abierta
  Cuando pulsa Ver detalles
  Entonces ve nombre, estado, fecha, coordenadas, Maps y evidencias

Escenario: datos limitados
  Cuando se presenta el detalle
  Entonces no aparecen correo, teléfono, perfil, chat, auditoría ni acciones

Escenario: autorización revocada
  Dado que cambia la relación, cuenta o estado de alerta
  Cuando se vuelve a consultar
  Entonces se retira el detalle y se vuelve al listado seguro
```

## Validaciones

- Funcionales: Maps disponible/no disponible y evidencia vacía/cargada/error.
- Técnicas: JWT en contenido, no cache sensible, `404/403` seguro y limpieza de recursos temporales.

---

**Relacionados:** [paquete](./change-package-evidence-internal-notifications.md) · [contrato](../07-api/contact-alerts-contract-proposal.md)
