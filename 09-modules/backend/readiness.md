# Backend — Estado de entrega y límites de evidencia

> [!NOTE] INSTRUCTIONS
> Estado: Entrega de código completada y verificada localmente. Esta matriz no convierte pruebas locales en operación productiva.

## Corte confirmado

El 2026-10-08, develop contiene el merge d6b694e de la PR #19 y las HU-API-001 a HU-API-019. El procedimiento scripts/verify-integration.ps1 ejecutó 126 pruebas contra PostgreSQL 17.11 con 0 fallos, 0 errores y 0 omitidas.

## Capacidades verificadas

| Área | HUs | Resultado cubierto |
|---|---|---|
| Plataforma | 001 a 006 | Boot, contenedor, módulos, errores, correlación, rol app y configuración |
| Identidad | 007 a 010 | Registro, OTP, autenticación, sesión, perfil, términos y baja |
| Contactos y SOS | 011 a 013 | Invitaciones, SOS idempotente, ubicación, estado, finalización e historial |
| Integraciones funcionales | 014 a 016 | Intentos FCM, evidencia privada, REST y STOMP |
| Administración | 017 | Dashboard, atención, gestión de usuarios y auditoría |
| Mantenimiento y consumo web | 018 a 019 | Jobs acotados, CORS local y ejecución integrada reproducible |

## Límites preservados

| Área | Límite aplicado |
|---|---|
| Database | Solo alertamujer_app; el Backend no posee DDL, Liquibase ni grants. |
| JWT | HS256, issuer, audience, sesión vigente y rol revalidado. |
| FCM | Un intento con timeout de cinco segundos, sin cola ni reintento automático. |
| WSS | CONNECT, suscripción y envío autorizados; persistir antes de publicar. |
| Evidencia | Ruta privada, nombre aleatorio, compensación y reconciliación controlada. |
| CORS | Orígenes explícitos; sin comodines ni credenciales cross-site. |

## Pendientes operativos, no de implementación

| Tema | Estado | Evidencia necesaria |
|---|---|---|
| SMTP | Código y prueba automatizada | Aceptación de proveedor y recepción en buzón de prueba |
| FCM | Adaptador y resultados técnicos | Token de dispositivo real y notificación visible |
| Docker | Configuración incluida | Arranque de imagen contra base migrada del ambiente objetivo |
| TLS, SLO y alertas | Pendiente | Infraestructura, responsables y runbook ensayado |
| Promoción | Pendiente | Pipeline, aprobadores, rollback y versionado de ambiente |

## Uso al cambiar el Backend

1. Verifique requisito, contrato, esquema y grants antes de modificar código.
2. Ejecute la suite correspondiente y registre versión, comando y resultado.
3. Actualice este documento solo con evidencia fechada.
4. Si se agrega infraestructura o se cambia un límite, cree o revise el ADR aplicable.

---

**Relacionados:** [../../04-requirements/backend-stories.md](../../04-requirements/backend-stories.md) · [../../04-requirements/traceability-matrix.md](../../04-requirements/traceability-matrix.md) · [../../05-architecture/security-architecture.md](../../05-architecture/security-architecture.md) · [runbook.md](runbook.md)
