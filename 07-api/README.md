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

El Backend integrado expone las familias de rutas de identidad, perfil, contactos, emergencias, evidencia, chat, dispositivo y administración bajo /api/v1, además de /ws para STOMP. El corte del 2026-10-08 ejecutó 126 pruebas sin fallos, errores ni omisiones contra PostgreSQL local.

La evidencia confirma la implementación y las pruebas de los flujos, no una integración ya realizada por el Frontend ni un despliegue TLS. Los consumidores conservan OpenAPI y WSS/STOMP como fuente para cuerpos, restricciones, códigos y destinos.

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
Consulte [contact-alerts-contract-proposal.md](./contact-alerts-contract-proposal.md) para el contrato objetivo todavía no implementado del panel interno de contactos. El OpenAPI v1 conserva el contrato ejecutable vigente hasta que HU-API-020 a 022 se integren.
