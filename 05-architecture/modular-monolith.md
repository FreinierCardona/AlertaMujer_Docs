# 05 — Monolito Modular Backend

> [!NOTE] INSTRUCTIONS
> Esta decisión aplica al Backend, no al conjunto de repositorios. La estructura está implementada; las decisiones de despliegue siguen siendo independientes.

## Qué es

Una aplicación Spring Boot desplegable como unidad y dividida internamente por capacidades. Cada módulo concentra sus adaptadores, servicios y persistencia sin convertir Frontend o Database en módulos internos.

Frontend Mobile y Web consume REST y WSS del Backend. El Backend accede a PostgreSQL con el rol de aplicación. Liquibase reside exclusivamente en el repositorio Database.

## Módulos implementados

| Módulo | Responsabilidad | Depende de |
|---|---|---|
| Shared | Seguridad, errores, configuración, auditoría y correlación | Configuración Database |
| Identity | Registro, OTP, JWT, sesión, cuenta y perfil | Shared |
| Contacts | Directorio e invitaciones | Identity |
| Emergency | SOS, estados, ubicaciones e historial | Identity, Contacts |
| Notification | Tokens e intentos FCM | Emergency, Contacts |
| Evidence | Archivos privados y metadata autorizada | Emergency |
| Chat | REST histórico y WSS/STOMP | Emergency, Identity |
| Administration | Atención, cuentas y auditoría | Módulos anteriores |

## Comunicación interna

Los servicios se coordinan dentro del proceso y delimitan transacciones por flujo. No se agregaron broker, API gateway, discovery, Redis ni consistencia eventual. Los eventos de chat y estado se emiten después del commit.

## Estado de evidencia

La estructura y sus verticales corresponden a las HU-API-001 a 019 integradas en develop. La suite del 2026-10-08 validó 126 pruebas con PostgreSQL local. Escalado independiente, alta disponibilidad y observabilidad operativa siguen fuera del alcance comprobado.

---

**Relacionados:** [../02-domain/module-boundaries.md](../02-domain/module-boundaries.md) · [boundary-enforcement.md](./boundary-enforcement.md) · [../09-modules/backend/README.md](../09-modules/backend/README.md)
