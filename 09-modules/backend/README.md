# Backend

> [!NOTE] INSTRUCTIONS
> Estado: En refinamiento. Existe el scaffold de HU-API-001; no existen capacidades funcionales Backend verificables.

## Propósito

Guiar la evolución del scaffold Java/Spring Boot hacia servicios, seguridad, reglas de aplicación e integraciones del sistema.

## Responsabilidades

- Autenticación, autorización y sesiones.
- Orquestación de SOS, contactos, ubicación, evidencia, chat y notificación.
- Acceso a Database mediante permisos de aplicación.

## Fuera de alcance

- Pantallas y experiencia de cliente.
- DDL, changeSets y propiedad de PostgreSQL.
- Reglas no aprobadas por requisitos o decisiones.

## Entradas y salidas

| Dirección | Elemento | Contrato o fuente |
|---|---|---|
| Entrada | REST y WSS desde Frontend | [`../../07-api/README.md`](../../07-api/README.md) |
| Salida | respuestas, eventos, consultas e integraciones | contratos de `07-api` y HUs Backend |

## Dependencias

| Dependencia | Motivo | Tipo |
|---|---|---|
| Database | persistencia | runtime |
| FCM | notificación push | integración pendiente |
| almacenamiento evidencia | archivos | decisión pendiente |

## Estado

| Aspecto | Estado | Evidencia |
|---|---|---|
| Scaffold | Integrada | Java 21, Spring Boot 4.1.1 y Maven Wrapper; sin datasource por defecto |
| Capacidades funcionales | Pendiente | no hay endpoints, módulos de negocio ni integración Database |
| Arquitectura | Diseño aceptado | documentos 05 |
| Contratos | En refinamiento | OpenAPI objetivo |

## Criterio de cierre

- Cada `HU-API` aporta código, pruebas y contratos verificables.
- Límites modulares y controles de seguridad tienen evidencia.

---

**Relacionados:** [`../../04-requirements/backend-stories.md`](../../04-requirements/backend-stories.md) · [`../../_stacks/java-spring.md`](../../_stacks/java-spring.md) · [`data-model.md`](data-model.md) · [`decisions.md`](decisions.md) · [`readiness.md`](readiness.md) · [`runbook.md`](runbook.md)
