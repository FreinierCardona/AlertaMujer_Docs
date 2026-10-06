# Backend

> [!NOTE] INSTRUCTIONS
> Estado: Pendiente. El repositorio consultado no contiene implementación funcional verificable; preserve esa distinción.

## Propósito

Implementar servicios, seguridad, reglas de aplicación e integraciones del sistema.

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
| Salida | respuestas, eventos, SQL e integraciones | contratos pendientes |

## Dependencias

| Dependencia | Motivo | Tipo |
|---|---|---|
| Database | persistencia | runtime |
| FCM | notificación push | integración pendiente |
| almacenamiento evidencia | archivos | decisión pendiente |

## Estado

| Aspecto | Estado | Evidencia |
|---|---|---|
| Implementación | Pendiente | README sin código funcional |
| Arquitectura | Diseño aceptado | documentos 05 |
| Contratos | En refinamiento | OpenAPI objetivo |

## Criterio de cierre

- Código, pruebas y contratos verifican cada capacidad.
- Límites modulares y controles de seguridad tienen evidencia.

---

**Relacionados:** [`data-model.md`](data-model.md) · [`decisions.md`](decisions.md) · [`runbook.md`](runbook.md)
