# HU-AM-030 — Mostrar campana y listado de alertas vinculadas

> [!NOTE] INSTRUCTIONS
> Historia Propuesta. El indicador se deriva del Backend; no crear estado paralelo de notificaciones.

## Identificación

| Campo | Valor |
|---|---|
| Ecosistema | Frontend Mobile |
| Módulo | Home / notificaciones internas |
| Objetivo | Mostrar campana, punto rojo y tarjetas de alertas abiertas autorizadas. |
| Alcance | Home, navegación, lista, carga, vacío, error, offline, i18n y accesibilidad. |
| Precondiciones | Sesión `USER`; HU-API-022 disponible. |
| Dependencias | ADR-006, HU-API-022. |
| Candidatos | Rutas Expo, `HomeEmergencyScreen.tsx`, módulo `notifications`, cliente API y pruebas. |
| Resultado | El punto rojo existe si y solo si la consulta devuelve alertas abiertas. |

## Descripción

Consultar al recuperar foco y por gesto de refresco. Cada tarjeta muestra “Alerta de Emergencia”, estado Activa, “[nombre] está en peligro” y “Ver detalles”.

## Criterios de aceptación

```gherkin
Escenario: indicador y listado
  Dado al menos una alerta vinculada ACTIVE, IN_PROGRESS u OFFLINE
  Cuando Home carga y el contacto abre la campana
  Entonces ve punto rojo y una tarjeta por alerta autorizada

Escenario: estado vacío
  Dado que no hay alertas abiertas vinculadas
  Cuando se consulta el panel
  Entonces no hay punto rojo y se muestra un vacío claro

Escenario: error
  Dado que la consulta falla
  Cuando se abre o refresca el panel
  Entonces no se inventan alertas y se ofrece reintento
```

## Validaciones

- Funcionales: cero/una/varias alertas, finalización remota, cuatro idiomas y dos temas.
- Técnicas: sesión, deduplicación por `emergencyId`, accesibilidad y navegación.

---

**Relacionados:** [paquete](./change-package-evidence-internal-notifications.md) · [contrato](../07-api/contact-alerts-contract-proposal.md)
