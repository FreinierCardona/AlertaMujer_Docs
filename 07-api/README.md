# 07 — API y contratos

> [!NOTE] INSTRUCTIONS
> Mantenga los contratos alineados con Backend real. REST y WSS/STOMP están implementados; una modificación exige actualizar código, contrato, pruebas y trazabilidad juntos.

## Propósito

Definir cómo Frontend consume capacidades Backend y cómo se gobiernan los contratos REST y WSS/STOMP.

## Documentos

| Documento | Pregunta que responde | Estado |
|---|---|---|
| [rest-conventions.md](rest-conventions.md) | ¿Cómo se diseñan endpoints y errores? | Implementado y vigente |
| [wss-stomp.md](wss-stomp.md) | ¿Cómo funciona el canal de chat? | Implementado y vigente |
| [contracts/openapi/openapi-alertamujer-v1.yaml](contracts/openapi/openapi-alertamujer-v1.yaml) | ¿Cuál es el contrato REST aprobado? | Fuente de contrato mantenida |
| [contracts/openapi/_template-api.yaml](contracts/openapi/_template-api.yaml) | ¿Cómo se inicia un contrato nuevo? | Plantilla |

## Estado comprobado

El Backend expone rutas de identidad, perfil, contactos, emergencias, evidencia, chat y administración bajo `/api/v1`; el registro telefónico también tiene rutas bajo `/api/v2/registration-requests`, y `/ws` es la entrada STOMP. El corte del 2026-10-08 ejecutó 126 pruebas sin fallos, errores ni omisiones contra PostgreSQL local.

Los clientes de Mobile y Web consumen rutas del Backend en el código. Su presencia no confirma que la integración, la entrega SMTP o TLS funcionen en un ambiente concreto. Los consumidores conservan OpenAPI y WSS/STOMP como fuente para cuerpos, restricciones, códigos y destinos.

## Fuera de alcance

- Definir pantallas, almacenamiento local del cliente o migraciones Database.
- Declarar entrega SMTP/FCM a una persona, TLS desplegado o una promoción productiva.
- Publicar nuevos contratos de proveedor sin evidencia y decisión aprobada.

## Reglas de cambio

- Cada operación se traza a un RF o HU.
- El código no expone entidades, secretos, hashes ni rutas privadas.
- Los cambios incompatibles requieren ADR, versión y plan de transición.
- La disponibilidad de proveedor externo se declara como resultado técnico, no como entrega a una persona.

## Listo cuando

- Cada operación conserva requisito, contrato, implementación y prueba trazables.
- Los consumidores relevantes revisan cambios incompatibles.
- La evidencia declara su ambiente y límites sin incluir secretos.

---

**Relacionados:** [rest-conventions.md](rest-conventions.md) · [wss-stomp.md](wss-stomp.md) · [../04-requirements/traceability-matrix.md](../04-requirements/traceability-matrix.md) · [../09-modules/backend/README.md](../09-modules/backend/README.md)
La propuesta [contact-alerts-contract-proposal.md](./contact-alerts-contract-proposal.md) es antecedente de diseño: `ContactAlertController` ya declara `GET /api/v1/me/contact-alerts`, `/{emergencyId}`, `/{emergencyId}/evidences` y `/{emergencyId}/evidences/{evidenceId}/content`. El OpenAPI debe contrastarse operación por operación con controladores y DTO antes de considerarlo completo. El archivo v2 existente en el directorio se conserva sin modificar.
