# HU-API-022 — Exponer alertas y evidencias seguras al contacto

> [!NOTE] INSTRUCTIONS
> Historia Propuesta. Reutilizar emergencia/contactos/evidencia; no crear tabla de notificaciones.

## Identificación

| Campo | Valor |
|---|---|
| Ecosistema | Backend |
| Módulo | Emergency / contacts / evidence |
| Objetivo | Consultar alertas abiertas vinculadas, detalle mínimo y fotos autorizadas. |
| Alcance | Listado paginado, detalle, metadata/contenido y autorización común. |
| Precondiciones | Actor/propietaria `USER ENABLED`, relación `ACCEPTED`, alerta no `FINALIZED`. |
| Dependencias | ADR-006, HU-AM-030/031, HU-API-020. |
| Candidatos | Controlador `/me/contact-alerts`, servicios/repositorios, DTOs, seguridad y pruebas. |
| Resultado | Solo el contacto vigente accede y no obtiene PII/acciones no requeridas. |

## Descripción

Derivar resultados de la fuente de verdad y responder `404` no revelador cuando falle cualquier condición individual.

## Criterios de aceptación

```gherkin
Escenario: listado autorizado
  Dado contacto aceptado y cuentas habilitadas
  Cuando consulta /me/contact-alerts
  Entonces recibe solo alertas ACTIVE, IN_PROGRESS u OFFLINE vinculadas

Escenario: detalle mínimo
  Cuando consulta una alerta autorizada
  Entonces recibe nombre permitido, estado, activación, última coordenada y evidencias

Escenario: acceso no autorizado
  Dado relación pendiente/rechazada, cuenta inhabilitada o alerta finalizada
  Cuando consulta detalle o evidencia
  Entonces recibe 404 sin revelar existencia
```

## Validaciones

- Funcionales: ambos sentidos de relación, varias alertas, finalización y revocación.
- Técnicas: paginación, joins sin N+1, RBAC por recurso, WebP autenticado y PostgreSQL real.

---

**Relacionados:** [paquete](./change-package-evidence-internal-notifications.md) · [contrato](../07-api/contact-alerts-contract-proposal.md)
