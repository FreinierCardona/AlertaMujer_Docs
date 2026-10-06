# Backend — Preparación y decisiones abiertas

> [!NOTE] INSTRUCTIONS
> Estado: En refinamiento. Esta matriz registra definiciones documentales y trabajo pendiente; no acredita una implementación Backend.

## Propósito

Priorizar el paso del scaffold a verticales funcionales sin reabrir reglas ya resueltas en requisitos, contratos o Database. El detalle permanece en los documentos fuente enlazados.

## Inconsistencias resueltas documentalmente

| Tema | Regla vigente | Implementación pendiente |
|---|---|---|
| OTP | Cinco intentos; propósito, canal y contexto restringidos | Servicio transaccional, reenvío, purga y pruebas |
| SOS | Emergencia abierta de la usuaria: `201` inicial, `200` en reintento o carrera | Recuperación tras conflicto concurrente |
| Auditoría | Solo acciones administrativas; finalización pertenece a la propietaria | Autorización, mapeo y saneamiento |
| Administración | Reemplazo controlado, no endpoint público ni SQL manual de negocio | Operación interna, transacción y runbook |
| Modelo y DCL | Modelo de 16 entidades y grants de HU-DB-024/025 | Mapeos y pruebas con rol app |

## Prioridad de implementación

| Prioridad | Historias / focos | Condición de cierre |
|---|---|---|
| P0 | API-003..005; contrato, JWT, RBAC, validación y administrador | filtros, errores seguros y pruebas de `401`/`403`/revocación |
| P0 | API-012..013; SOS y transiciones | `201`/`200`, carrera y bloqueo de fila verificados |
| P1 | API-007..011; registro, OTP, perfil y contactos | estados, límites, propiedad y concurrencia cubiertos |
| P1 | API-014..017; FCM, evidencia, chat y auditoría | integración degradada, compensación y autorización comprobadas |
| P2 | API-004/018/019; correlación, jobs y E2E | logs seguros, procesos idempotentes y matriz de evidencia |

## Límites ya definidos

| Área | Límite que debe preservar el código |
|---|---|
| Database | Solo `alertamujer_app`; no DDL, Liquibase ni credenciales de migración. |
| JWT | HS256, `iss`, `aud`, `sub`, `role`, `sid`, vencimiento y sesión no revocada. |
| FCM | Un intento, timeout de cinco segundos, sin cola ni reintento automático. |
| WSS | `CONNECT`/suscripción autorizados; persistir antes de publicar; reconexión 1/2/5 s. |
| Evidencia | Ruta privada, nombre aleatorio, compensación y reconciliación de huérfanos. |
| Operación | Sin SSO, JWKS, Redis, RabbitMQ, cloud ni plataforma de telemetría. |

## Uso durante una HU

1. Tomar la regla del requisito y el contrato, no de esta síntesis.
2. Verificar la tabla y grant de Database antes de escribir repositorio.
3. Mantener la funcionalidad en estado pendiente hasta contar con pruebas y evidencia.
4. Si contradice esta matriz, crear o actualizar ADR; no alterar la regla implícitamente.

## Revisión

Revisar antes de iniciar una vertical, al modificar OpenAPI/WSS y antes de declarar HU-API-019. Los valores de timeout, jobs y límites requieren prueba, no solo configuración.

---

**Relacionados:** [../../04-requirements/backend-stories.md](../../04-requirements/backend-stories.md) · [../../05-architecture/security-architecture.md](../../05-architecture/security-architecture.md) · [../../07-api/README.md](../../07-api/README.md) · [decisions.md](decisions.md)
